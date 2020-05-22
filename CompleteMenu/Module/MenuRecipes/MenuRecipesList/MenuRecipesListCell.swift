//
//  MenuRecipesListCell.swift
//  CompleteMenu
//
//  Created by gohil on 19/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

class MenuRecipesListCell: UITableViewCell {

    @IBOutlet weak var menuRecipesImageView: UIImageView!
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var type: UILabel!
    
    override func prepareForReuse() {
        dispose()
    }
    
    var viewModel: MenuRecipesListCellViewModel? {
        didSet {
            dispose()
            if let viewModel = viewModel {
//                menuRecipesImageView.kf.setImage(with: viewModel.posterImageURL)
                title.text = viewModel.title
                details.text = viewModel.details
                type.text = "\(String(describing: viewModel.type!)) Date: \(String(describing: viewModel.date!))"
            }
        }
    }
}

extension Reactive where Base : MenuRecipesListCell {
    var baseViewDidTap: Driver<MenuRecipesListCellViewModel> {
        return base.baseView.rx.tapGesture().when(.recognized).asVoid().asDriverOnErrorJustComplete().map { _ in self.base.viewModel! }
    }
}

