//
//  RecipeListViewModel.swift
//  MVVM2019June20
//
//  Created by Yee Chuan Lee on 01/07/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

//final class RecipeListViewModel: BasePaginationViewModel<OMDb.ResponseSearchRecipe, RecipeSection, ()> { //..
final class RecipeListViewModel: BasePaginationViewModel<RecipeSection, ()> {
    //Input
    let cellDidTap = PublishRelay<RecipeItem>()
    
    //Initialize
    required init() {
        super.init()
//        self.pageSize = -1
//        self.enableLoadMore = false
    }
    //Transform
    override func transform() {
        super.transform()
        let routeToDetail = self.cellDidTap.asDriverOnErrorJustComplete()
            .map({ item -> RecipeIntent in
                return RecipeIntent(id: (item.RecipeSearchResult?.id).orEmpty)
            }).do(onNext: { intent in
                (self.view as! RecipeListViewType).routeToRecipeDetail(intent: intent)
            })
        
//        //Subscribe
//        disposeBag.insert(
//            startRate.drive(),
//            startShare.drive(),
//            routeToDetail.drive()
//        ) //..
    }
    //Helper
//    override func mapResponseToItems(output: OMDb.ResponseSearchRecipe) -> [RecipeItem] {
//        return (output.search ?? []).map { response -> RecipeItem in
//            var ret = RecipeItem()
//            //Poster
//            ret.posterImageURL = response.poster.flatMap { URL(string:$0) }
//            //CardContent - Header
//            ret.headerTitleText = response.title
//            ret.headerSubTitleText = nil
//            ret.headerTagText = response.type
//            //CardContent - Body
//            ret.bodyText = {
//                let s: String
//                if Int.random(in: 0...1) == 0 {
//                    s = "Toy Story is about the 'secret life of toys' when people are not around. When Buzz Lightyear, a space-ranger, takes Woody's place as Andy's favorite toy, Woody doesn't like the situation and gets into a fight with Buzz."
//                } else {
//                    s = "Toy Story is about the"
//                }
//                return NSAttributedString(string: s)
//            }()
//            //State
//            ret.RecipeSearchResult = response
//            return ret
//        }
//    } //..
    
//    override func createSections(list: [RecipeItem]) -> [RecipeSection] {
//        return [SectionModel<String, RecipeItem>.init(model: "", items: list)]
//    }//..
    
    //Model
//    func rate(_ item: RecipeItem) -> Observable<Void> {
//        let api = Observable<Void>.just(()).delay(.milliseconds(2000), scheduler: MainScheduler.instance)
//        return api
////            .trackActivity(activityIndicator)
////            .trackError(errorTracker) //..
//    }
//
//    func share(_ item: RecipeItem) -> Observable<Void> {
//        let api = Observable<Void>.just(()).delay(.milliseconds(2000), scheduler: MainScheduler.instance)
//        return api
////            .trackActivity(activityIndicator)
////            .trackError(errorTracker) //..
//    }
    
//    override func getStartLoadData() -> Driver<OMDb.ResponseSearchRecipe> {
//        var input = OMDb.RequestSearchRecipe()
//        input.s = self.searchText.value ?? ""
//        if input.s.isNilOrEmpty {
//            return .empty()
//        }
//        let api = OMDb.EndPoint.SearchRecipe(input: input).request()
//        return api
//            .trackActivity(activityIndicator)
//            .trackError(errorTracker)
//            .asDriverOnErrorJustComplete()
//    }
//
//
//    override func getReloadData() -> Driver<OMDb.ResponseSearchRecipe> {
//        var input = OMDb.RequestSearchRecipe()
//        input.s = self.searchText.value ?? ""
//        let api = OMDb.EndPoint.SearchRecipe(input: input).request()
//        return api
//            .trackActivity(activityIndicator)
//            .trackStopEvent(reloadTracker)
//            .trackError(errorTracker)
//            .asDriverOnErrorJustComplete()
//    }
//
//
//    override func getLoadMoreData() -> Driver<OMDb.ResponseSearchRecipe> {
//        var input = OMDb.RequestSearchRecipe()
//        input.s = self.searchText.value ?? ""
//        let api = OMDb.EndPoint.SearchRecipe(input: input).request()
//        return api
//            .trackActivity(activityIndicator)
//            .trackStopEvent(loadMoreTracker)
//            .trackError(errorTracker)
//            .asDriverOnErrorJustComplete()
//    }//..
}

