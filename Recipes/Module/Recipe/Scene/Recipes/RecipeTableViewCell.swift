//
//  RecipeCardCollectionViewCell.swift
//  MVVM2019June20
//
//  Created by Yee Chuan Lee on 02/07/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import UIKit
import TagListView
import RxSwift
import RxCocoa
import RxGesture

class RecipeTableViewCell: UITableViewCell {
    //Container
    @IBOutlet weak var paddingView: UIStackView!
    //Poster
    @IBOutlet weak var posterImageView: UIImageView!
    //CardContent - Header
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    
    override func awakeFromNib() {
        
    }
    
    var viewModel: RecipeCardCellViewModel? {
        didSet {
            dispose()
            if let viewModel = viewModel {
                //Poster
//                posterImageView.kf.setImage(with: viewModel.posterImageURL) //..
                //CardContent - Header
                titleLabel.text = viewModel.headerTitleText
                subTitleLabel.text = viewModel.headerSubTitleText
                typeLabel.text = viewModel.headerTypeText
            }
        }
    }
}
