//
//  RecipeListViewModel.swift
//  MVVM2019June20
//
//  Created by Yee Chuan Lee on 01/07/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

final class RecipeListViewModel: ViewModelType {

    struct Input {
        let trigger: Driver<Void>
        let createRecipeTrigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    struct Output {
        let fetching: Driver<Bool>
        let recipes: Driver<[RecipeCardCellViewModel]>
        let createPost: Driver<Void>
        let selectedPost: Driver<Post>
        let error: Driver<Error>
    }

    private let useCase: RecipesUseCase
    private let navigator: RecipesNavigator
    
    init(useCase: RecipesUseCase, navigator: RecipesNavigator) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        let posts = input.trigger.flatMapLatest {
            return self.useCase.posts()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
                .map { $0.map { PostItemViewModel(with: $0) } }
        }
        
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        let selectedPost = input.selection
            .withLatestFrom(posts) { (indexPath, posts) -> Post in
                return posts[indexPath.row].post
            }
            .do(onNext: navigator.toPost)
        let createPost = input.createPostTrigger
            .do(onNext: navigator.toCreatePost)
        
        return Output(fetching: fetching,
                      posts: posts,
                      createPost: createPost,
                      selectedPost: selectedPost,
                      error: errors)
    }
}

