//
//  ProductsCollectionViewController.swift
//  Solution
//
//  Created by Alex Yatsenko on 22.12.2024.
//

import UIKit

protocol IProductsCollectionView: UIViewController {
    func configure(userInfo: UserInfo, bonuses: [Bonus], goods: [Product])
    func push(viewController: UIViewController)
    func updateCartButton(isHidden: Bool)
    func add(banner: IGoodsBannerView)
}

final class ProductsCollectionViewController: UIViewController {
    
    private let presenter: IProductsCollectionPresenter
    
    // MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 108)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCell.self,
                                forCellWithReuseIdentifier: ProductCell.reuseId)
        collectionView.register(UICollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "BannerHeader")
        return collectionView
    }()
    
    private lazy var cartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Корзина", for: .normal)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(cartButtonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor(hexString: "FFEC18")
        button.tintColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    private var banner: IGoodsBannerView?
    
    private lazy var sectionInsets = UIEdgeInsets(top: 15, left: 20, bottom: 20, right: 20)
    private var itemsPerRow: CGFloat {
        return view.bounds.height > view.bounds.width ?  2 : 4
    }
    
    // MARK: - Init
    
    init(presenter: IProductsCollectionPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        presenter.updateStateButton()
    }
    
    // MARK: - Private
    
    private func setupLayout() {
        [collectionView, cartButton].forEach {
            view.addSubview($0)
        }
        collectionView.fillSuperview()
        cartButton.anchors(
            leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor,
            padding: .init(top: .zero, left: 20, bottom: 36, right: 20),
            size: .init(width: .zero, height: 31)
        )
    }
    
    private func setupBanner(on headerView: UICollectionReusableView) {
        guard let banner else { return }
        
        if headerView.subviews.isEmpty {
            banner.frame = CGRect(
                x: 10,
                y: 0,
                width: headerView.bounds.width - 20,
                height: headerView.bounds.height
            )
            headerView.addSubview(banner)
        }
    }
    
    @objc private func cartButtonPressed() {
        presenter.didTapPrimaryButton()
    }
}

extension ProductsCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId, for: indexPath)
        let product = presenter.products[indexPath.item]
        (cell as? ProductCell)?.addContentIfNeeded(view: presenter.makeView())
        (cell as? ProductCell)?.configure(product: product.product, buttonsInteractionModel: product.button)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gapWidth = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.bounds.width - gapWidth
        let widthPerItem = (availableWidth / itemsPerRow)
        return CGSize(width: widthPerItem, height: widthPerItem * 1.6)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.bottom
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.right / 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "BannerHeader",
            for: indexPath
        )
        
        setupBanner(on: headerView)
    
        return headerView
    }
}

// MARK: - IProductsCollectionView

extension ProductsCollectionViewController: IProductsCollectionView {
    
    func configure(userInfo: UserInfo, bonuses: [Bonus], goods: [Product]) {
        presenter.updateData(userInfo: userInfo, bonuses: bonuses, goods: goods)
        collectionView.reloadData()
    }

    func updateCartButton(isHidden: Bool) {
        cartButton.isHidden = isHidden
    }

    func push(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func add(banner: IGoodsBannerView) {
        self.banner = banner
        collectionView.reloadSections(IndexSet(integer: 0))
    }
}
