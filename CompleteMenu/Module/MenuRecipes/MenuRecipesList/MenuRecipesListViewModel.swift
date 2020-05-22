//
//  MenuRecipesListViewModel.swift
//  CompleteMenu
//
//  Created by gohil on 20/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import Foundation
import RxCocoa
import RxDataSources

final class MenuRecipesListViewModel : BaseViewModelType {
    
    //Input
    let baseViewDidTap = PublishRelay<MenuRecipeItem>()
    weak var viewVC : MenuRecipesListController!
//    weak var view: MenuRecipesListViewType? = nil

    @ViewEvent public var startLoad: Driver<Void> = .never()
    @ViewEvent public var saveData: Driver<Void> = .never()
    @ViewEvent public var addRecipeTap: Driver<Void> = .never()
//    @ViewEvent public var recipeDetailTap: Driver<MenuRecipesListCellViewModel> = .never()
//    let recipeDetailTap = PublishRelay<MenuRecipesListCellViewModel>()

    @ViewEvent public var exitWithResult: Driver<DismissResult> = .never()
    
    var listItemsRelay: BehaviorRelay<[MenuRecipeSection.Item]> = BehaviorRelay<[MenuRecipeSection.Item]>(value: [])
    var sectionsRelay: BehaviorRelay<[MenuRecipeSection]> = BehaviorRelay<[MenuRecipeSection]>(value: [])
    
    //Initialize
    init(vc: MenuRecipesListController) {
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
        
//        self.viewVC?.addBarButton.rx.tap
//                   .map { _ in
//                        MenuRecipesListCellViewModel(menuRecipesImageURL: "URL", title: "title...", details: "Details....", type: "Type 1", date: Date().dateTimeString())
//                   }.subscribe(onNext: { (recipe) in
//                       _ = try? (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext.rx.update(recipe)
//                   })
//                   .disposed(by: disposeBag)
        
        let routeToRecipeCreate = self.addRecipeTap
            .do(onNext:{ self.viewVC.routeToCreateMenuRecipes() })
        
//        let routeToRecipeDetail = self.recipeDetailTap.asDriverOnErrorJustComplete()
//            .map({ item -> MenuRecipesIntent in
//                return MenuRecipesIntent(model: item)
//            }).do(onNext: { intent in
////                (view as! MenuRecipesListViewType).routeToMenuRecipesDetail(intent: intent)
//                self.viewVC.routeToMenuRecipesDetail(intent: intent)
//            })
                
        
//        let startRate = self.rateDidTap.asDriverOnErrorJustComplete()
//        .flatMap({ item in
//            self.view!.presentDialog(title: "Rate Movie",
//                                     message: "Rate this movie \(item.headerTitleText.orEmpty) ?",
//                actions: [.negative(), .positive()])
//        }).filter { $0.kind == .positive }
//        .withLatestFrom(self.rateDidTap.asDriverOnErrorJustComplete())
//        .flatMap { self.rate($0).asDriverOnErrorJustComplete() }
        
        
        
        
        
//            .do(onNext:{ self.viewVC.routeToMenuRecipesDetail(intent: MenuRecipesIntent(model: <#T##MenuRecipesListCellViewModel#>)) })
        
//        let addRecipeTapToDetail = self.addRecipeTap.asDriverOnErrorJustComplete()
//            .map({ item -> MenuRecipesIntent in
//                return MenuRecipesIntent(model: item)
//            }).do(onNext: { intent in
//                (view as! MenuRecipesListViewType).routeToMenuRecipesDetail(intent: intent)
//            })
        
        let startLoadFirst = startLoad
               .do(onNext:{
                self.getStartLoadData()
               })
        
        //Subscribe
        disposeBag.insert(
            startLoadFirst.drive(),
            routeToRecipeCreate.drive()
//            routeToRecipeDetail.drive()
//            routeToDetail.drive()
        )
    }
    //Helper
//    func mapResponseToItems(output: OMDb.ResponseSearchMovie) -> [MovieItem] {
//        return (output.search ?? []).map { response -> MovieItem in
//            var ret = MovieItem()
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
//            ret.menuRecipe = response
//            return ret
//        }
//    }
//
//    func createSections(list: [MenuRecipeItem]) -> [MovieSection] {
//        return [MovieSection<String, MenuRecipeItem>.init(model: "", items: list)]
//    }
//
    
    
//    func getStartLoadData() -> Driver<Void>{
    func getStartLoadData() {
        print("getStartLoadData..")
        // load coredata models
        let animatedDataSource = RxTableViewSectionedAnimatedDataSource<MenuRecipeSection>(configureCell: { dateSource, tableView, indexPath, menuRecipesListCellViewModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuRecipesListCell", for: indexPath) as! MenuRecipesListCell
            cell.viewModel = menuRecipesListCellViewModel
                       return cell
                   })
                   
            (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext.rx.entities(MenuRecipesListCellViewModel.self, sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])
               .map { recipes in
                   [MenuRecipeSection(model: "", items: recipes)]
               }
            .bind(to: self.viewVC.menuRecipesList.rx.items(dataSource: animatedDataSource))
               .disposed(by: disposeBag)

            self.viewVC?.menuRecipesList.rx.itemSelected.map { [unowned self] ip -> MenuRecipesListCellViewModel in
               return try self.viewVC.menuRecipesList.rx.model(at: ip)
               }
               .subscribe(onNext: { [unowned self] (recipe) in
                (self.viewVC!).routeToMenuRecipesDetail(intent: MenuRecipesIntent(model: recipe))
               })
               .disposed(by: disposeBag)
        
//        return .never()
    }
    
    func addRecipesTapped() -> Driver<Void> {
        let recipe = MenuRecipesListCellViewModel(menuRecipesImageURL: "URL", title: "title...", details: "Details....", type: "Type 1", date: Date().dateTimeString())
       _ = try? (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext.rx.update(recipe)
        return .never()
    }
    
}

