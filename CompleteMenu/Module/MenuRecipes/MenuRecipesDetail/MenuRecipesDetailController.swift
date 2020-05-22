//
//  MenuRecipesDetailViewController.swift
//  CompleteMenu
//
//  Created by gohil on 21/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import UIKit
import SwifterSwift
import RxSwift
import RxCocoa

class MenuRecipesDetailController : MenuRecipesDetailType {
    var intent: MenuRecipesIntent!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var typeField: UITextField!
    //    var titleText : BehaviorRelay<String?> { get  }
//    var detailsText : BehaviorRelay<String?> { get  }
//    var titleText = BehaviorSubject<String?>(value: "")
//    var detailsText = BehaviorSubject<String?>(value: "")
//
    var saveBarButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: nil)
    var viewModel: BaseViewModelType! {
          didSet {
              if let vm = viewModel {
                  vm.disposed(by: disposeBag)
            }
          }
      }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Recipe"
            viewModel ??= DI.resolver.resolve(MenuRecipesDetailViewModel.self, argument: self)
//            viewModel ??= MenuRecipesDetailViewModel(vc: self)
            viewModel.disposed(by: disposeBag)
            setupView()
            setupTransformInput()
             transform()
        }
    
    
    func setupView(){
         navigationItem.rightBarButtonItem = saveBarButton
    }
    
       func setupTransformInput() {
    //      viewModel.view = self
          viewModel.startLoad = rx.viewWillAppear
            viewModel.saveData = rx.viewWillDisappear
          viewModel.addRecipeTap = saveBarButton.rx.tap.asDriver()
        }
    
    func transform() {
           viewModel.transform()
       }
    
    func saveRecipe() {
        
    }
}
