//  Created by Kuznetsov Mikhail on 21.12.2024.
//

import UIKit

final class PaymentViewController: UIViewController {

    // Dependencies
    private let presenter: IPaymentPresenter
    private let cardInputView: ICardInputView
    
    // UI
    private lazy var paymentButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Оплатить", for: .normal)
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(paymentButtonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor(hexString: "FFDD2D")
        button.tintColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.isEnabled = false
        return button
    }()

    // MARK: - Initialization

    init(presenter: IPaymentPresenter,
         cardInputView: ICardInputView) {
        self.presenter = presenter
        self.cardInputView = cardInputView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Оплата"
        navigationItem.hidesBackButton = true
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Закрыть",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(close))
        configureUI()
        setupConstraints()
        view.backgroundColor = .systemBackground
    }

    // MARK: - Private

    private func configureUI() {

        cardInputView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardInputView)
        view.addSubview(paymentButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardInputView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cardInputView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            cardInputView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            paymentButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            paymentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            paymentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            paymentButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    @objc private func close() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func paymentButtonPressed() {
        presenter.paymentButtonDidPressed(cardInputView.viewModel())
        close()
    }
}

// MARK: - CardInputViewDelegate

extension PaymentViewController: CardInputViewDelegate {

    public func didUpdateField(_ model: CardInputViewModel) {
        presenter.didUpdateField(model)
    }
}

// MARK: - IPaymentView

extension PaymentViewController: IPaymentView {

    public func update(model: PaymentViewModel) {
        cardInputView.configure(viewModel: model.cardInputViewModel)
        changeButtonPresentation(with: model.buttonState)
    }
    
    private func changeButtonPresentation(with state: PaymentViewModel.PaymentButtonState) {
        DispatchQueue.main.async {
            self.paymentButton.isHidden = state == .hidden
            self.paymentButton.isEnabled = state == .enabled
        }
    }
}
