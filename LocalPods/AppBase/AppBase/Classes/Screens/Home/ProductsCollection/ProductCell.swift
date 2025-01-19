//
//  ProductCell.swift
//  Pods
//
//  Created by Alex Yatsenko on 22.12.2024.
//

import UIKit

final class ProductCell: UICollectionViewCell {
    
    private weak var productView: IProductView?
    
    static let reuseId = "ProductCell"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productView?.prepareForReuse()
    }
    
    func addContentIfNeeded(view: IProductView) {
        guard productView == nil else { return }
        productView = view
        contentView.addSubview(view)
        view.fillSuperview()
    }
    
    func configure(product: ProductViewModel, buttonsInteractionModel: IButtonsViewInteractionModel) {
        productView?.configure(product: product, buttonsInteractionModel: buttonsInteractionModel)
    }
}
