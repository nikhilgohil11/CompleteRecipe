//
//  MenuRecipesListController.swift
//  CompleteMenu
//
//  Created by gohil on 18/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
//import SwifterSwift

class MenuRecipesListController : UIViewController, MenuRecipesListViewType{
    
    @IBOutlet weak var menuRecipesList: UITableView!
    var addBarButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    let baseViewDidTap = PublishRelay<MenuRecipeItem>()

    var viewModel: BaseViewModelType! {
          didSet {
              if let vm = viewModel {
                  vm.disposed(by: disposeBag)
              }
          }
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Complete Menu"
        viewModel = DI.resolver.resolve(MenuRecipesListViewModel.self, argument: self)
        viewModel.disposed(by: disposeBag)
        
        setupView()
        setupTransformInput()
        transform()
//         subscribe()
        
    }
    
    
    //MARK: setupTransformInput
    func setupTransformInput() {
//      viewModel.view = self
      viewModel.startLoad = rx.viewWillAppear
      viewModel.addRecipeTap = addBarButton.rx.tap.asDriver()
//        self.menuRecipesList.rx.itemSelected.map { [unowned self] ip -> MenuRecipesListCellViewModel in
//        return try self.menuRecipesList.rx.model(at: ip)
//        }.asObservable().bind(to: viewModel.recipeDetailTap)
    }
    
    func setupView(){
        navigationItem.rightBarButtonItem = addBarButton
//        menuRecipesList.register(nibWithCellClass: MenuRecipesListCell.self)

//        let animatedDataSource = RxTableViewSectionedAnimatedDataSource<AnimatableSectionModel<String, Event>>(configureCell: { dateSource, tableView, indexPath, event in
//                 let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//                 cell.textLabel?.text = "\(event.date)"
//                 return cell
//             })
    }
    
    func transform() {
        viewModel.transform()
    }

    
    //MARK: MenuRecipesListViewType
    func routeToMenuRecipesDetail(intent: MenuRecipesIntent) {
        // route to detail
        print("routeToMenuRecipesDetail")
        var screen = DI.resolver.resolve(MenuRecipesDetailType.self)!
        screen.intent = intent
//        navigationController?.pushViewController(screen)
        self.present(screen, animated: true, completion: {
            
        })

    }
    
    func routeToCreateMenuRecipes() {
        print("routeToCreateMenuRecipes")
        let screen = DI.resolver.resolve(MenuRecipesDetailType.self)!
//        navigationController?.pushViewController(screen)
        self.present(screen, animated: true, completion: {
            
        })

    }
}

//
protocol BaseViewModelType: ViewModelType {
    //MARK: Input
    var startLoad: Driver<Void> { set get }
    var saveData: Driver<Void> { set get }
    var addRecipeTap: Driver<Void> { set get }
//    var recipeDetailTap: Driver<MenuRecipesListCellViewModel> { set get }
//    var startExit: Driver<Void> { set get }
    //MARK: Output
    var exitWithResult: Driver<DismissResult> { set get }
    //MARK: State
//    var activityIndicator: ActivityIndicator { get }
//    var errorTracker: ErrorTracker { get }
//    var stopEventTracker: StopEventTracker { get }
//    var view: VCType {set get}
    
}
