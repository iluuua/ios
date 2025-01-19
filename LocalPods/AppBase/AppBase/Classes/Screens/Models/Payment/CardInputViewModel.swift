//
//  CardInputViewModel.swift
//  AppBase
//
//  Created by m.titor on 23.12.2024.
//

public final class CardInputViewModel {
    
    // Properties
    public var cardNumber: Field = .correct("") {
        didSet {
            cardNumber.update(with: CardInputDataFormatter.format(cardNumber: cardNumber.unwrap()))
        }
    }
    public var expiryDate: Field = .correct("") {
        didSet {
            expiryDate.update(with: CardInputDataFormatter.format(expiryDate: expiryDate.unwrap()))
        }
    }
    public var cvv: Field = .correct("") {
        didSet {
            cvv.update(with: CardInputDataFormatter.format(cvv: cvv.unwrap()))
        }
    }
    
    // MARK: - Initialization
    
    public init(
        cardNumber: Field = .correct(""),
        expiryDate: Field = .correct(""),
        cvv: Field = .correct("")
    ) {
        self.cardNumber = cardNumber
        self.expiryDate = expiryDate
        self.cvv = cvv
    }
}

// MARK: - Public

public extension CardInputViewModel {
    
    enum Field {
        case correct(_ value: String)
        case incorrect(_ value: String)
        
        /// Получает значение поля без его типа
        public func unwrap() -> String {
            var result: String
            switch self {
            case .correct(let value):
                result = value
            case .incorrect(let value):
                result = value
            }
            return result
        }
        
        /// Обновляет значение поля, не изменяя его типа
        public mutating func update(with value: String?) {
            guard let value else { return }
            switch self {
            case .correct(_):
                self = .correct(value)
            case .incorrect(_):
                self = .incorrect(value)
            }
        }
    }
}

// MARK: - Fileprivate

fileprivate final class CardInputDataFormatter {
    
    static func format(cardNumber: String) -> String {
        guard !cardNumber.isEmpty else { return "" }
        
        let cleanCardNumber = cardNumber.replacingOccurrences(of: " ", with: "")
        
        var result: [String] = []
        var currentIndex = 0
        
        while currentIndex < cleanCardNumber.count {
            let endIndex = min(currentIndex + 4, cleanCardNumber.count)
            let range = cleanCardNumber.index(cleanCardNumber.startIndex, offsetBy: currentIndex)..<cleanCardNumber.index(cleanCardNumber.startIndex, offsetBy: endIndex)
            result.append(String(cleanCardNumber[range]))
            currentIndex += 4
        }
        
        return result.joined(separator: result.count > 4 ? "" : " ")
    }
    
    static func format(expiryDate: String) -> String {
        guard !expiryDate.isEmpty else { return "" }
        let cleaned = expiryDate
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "/", with: "")
        
        switch cleaned.count {
        case 3:
            return "\(cleaned.prefix(2))/\(cleaned.suffix(1))"
        case 4:
            return "\(cleaned.prefix(2))/\(cleaned.suffix(2))"
        default:
            return cleaned
        }
    }
    
    static func format(cvv: String) -> String {
        guard !cvv.isEmpty else { return "" }
        let cleaned = cvv.replacingOccurrences(of: " ", with: "")
        return cleaned
    }
}
