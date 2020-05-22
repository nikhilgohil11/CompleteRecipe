//
//  MenuRecipesDetailViewModel.swift
//  CompleteMenu
//
//  Created by gohil on 22/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import Foundation
import RxCocoa
import RxBiBinding

final class MenuRecipesDetailViewModel : BaseViewModelType {
    
    @ViewEvent public var startLoad: Driver<Void> = .never()
    @ViewEvent public var addRecipeTap: Driver<Void> = .never()
    @ViewEvent public var saveData: Driver<Void> = .never()

    
//    @ViewEvent public var recipeDetailTap: Driver<MenuRecipesListCellViewModel> = .never()


    @ViewEvent public var exitWithResult: Driver<DismissResult> = .never()
    
    
    //Input
    let baseViewDidTap = PublishRelay<MenuRecipeItem>()
    weak var viewVC : MenuRecipesDetailController!
    
//    weak var view: MenuRecipesDetailViewType? = nil


//
//    var listItemsRelay: BehaviorRelay<[MenuRecipeSection.Item]> = BehaviorRelay<[MenuRecipeSection.Item]>(value: [])
//    var sectionsRelay: BehaviorRelay<[MenuRecipeSection]> = BehaviorRelay<[MenuRecipeSection]>(value: [])
    
    //Initialize
    init(vc: MenuRecipesDetailController) {
        self.viewVC = vc
    }

    //Transform
//    func transform(view: MenuRecipesListViewType){
//        let routeToDetail = self.baseViewDidTap.asDriverOnErrorJustComplete()
//            .map({ item -> MenuRecipesIntent in
//                return MenuRecipesIntent(model: item)
//            }).do(onNext: { intent in
//                (view as! MenuRecipesListViewType).routeToMenuRecipesDetail(intent: intent)
//            })
//    }
    
    func transform() {
//        self.viewVC.titleTextView.rx.text.bind(to: self.viewVC.intent.model.title)
//        self.viewVC.titleTextView.rx.text.bind(to: self.viewVC.intent.model.details)
//        self.viewVC.titleTextView.rx.text <-> self.viewVC.intent.model.title
//        self.viewVC.detailsTextView.rx.text <-> self.viewVC.intent.model.details // perform two way binding
        self.viewVC.titleTextView.text = self.viewVC.intent?.model.title
        self.viewVC.detailsTextView.text = self.viewVC.intent?.model.details
        self.viewVC.typeField.text = self.viewVC.intent?.model.type
        self.viewVC?.saveBarButton.rx.tap
                   .map { _ in
                    MenuRecipesListCellViewModel(menuRecipesImageURL: "URL", title: self.viewVC.titleTextView.text, details: self.viewVC.detailsTextView.text, type: ((self.viewVC.intent?.model.type?.count ?? 0 > 0) ? self.viewVC.intent?.model.type : "Defualt Type"), date: ((self.viewVC.intent?.model.date?.count ?? 0 > 0) ? self.viewVC.intent?.model.date : Date().dateTimeString()))
                   }.subscribe(onNext: { (recipe) in
                        if self.viewVC.titleTextView.text.count > 0 && self.viewVC.detailsTextView.text.count > 0 {
                            _ = try? (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext.rx.update(recipe)
                        }
                   })
                   .disposed(by: disposeBag)
        
             
                let saveCorData = saveData
                       .do(onNext:{
                        self.saveCoreData()
                       })
                
                //Subscribe
                disposeBag.insert(
                    saveCorData.drive()
                )
    }
    
    func saveCoreData(){
        if self.viewVC.titleTextView.text.count > 0 && self.viewVC.detailsTextView.text.count > 0 {
            let recipe = MenuRecipesListCellViewModel(menuRecipesImageURL: "URL", title: self.viewVC.titleTextView.text, details: self.viewVC.detailsTextView.text, type: "Type 1", date: ((self.viewVC.intent?.model.date?.count ?? 0 > 0) ? self.viewVC.intent?.model.date : Date().dateTimeString()))
               _ = try? (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext.rx.update(recipe)
           }

    }
    
    func getStartLoadData() -> Driver<Void>{
        print("getStartLoadData..")
        return .never()
    }
}

