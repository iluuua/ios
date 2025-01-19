//
//  CartViewController.swift
//  AppBase
//
//  Created by Kuznetsov Mikhail on 21.12.2024.
//

import UIKit

public protocol ICartViewController: AnyObject {
    func configureCartView(totalCartViewModel: TotalCartViewModel, bonusViewModel: BonusViewModel)
    func push(viewController: UIViewController)
    func dismiss()
}

final class CartViewController: UIViewController {
    // UI
    private lazy var cartView = presenter.makeView()

    // Dependencies
    private var presenter: ICartPresenter

    // MARK: Initialization

    init(presenter: ICartPresenter) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        self.presenter.view = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Корзина"

        setupUI()
    }

    private func setupUI() {
        view.addSubview(cartView)
        cartView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    @objc private func cardButtonDidTap() {
        presenter.cardButtonDidTap()
    }
}

extension CartViewController: ICartViewController {
    func configureCartView(totalCartViewModel: TotalCartViewModel, bonusViewModel: BonusViewModel) {
        cartView.configure(totalCartViewModel: totalCartViewModel, bonusViewModel: bonusViewModel)
    }

    func push(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }

    func dismiss() {
        navigationController?.popViewController(animated: true)
    }
}
