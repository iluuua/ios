//
//  GoodsBannerViewModel.swift
//  AppBase
//
//  Created by Matvey Titor on 29.12.2024.
//

public struct GoodsBannerViewModel {

    public let state: BannerState
    public let largeBanner: LargeBanner
    public let smallBanner: SmallBanner?

    public init(state: BannerState, largeBanner: LargeBanner, smallBanner: SmallBanner?) {
        self.state = state
        self.largeBanner = largeBanner
        self.smallBanner = smallBanner
    }
}

public extension GoodsBannerViewModel {

    /// Состояние продуктового баннера
    enum BannerState {
        /// Слева отображается маленький баннер, справа - большой
        case smallComesFirst
        /// Слева отображается большой баннер, справа - маленький
        case largeComesFirst
        /// Отображается только большой баннер
        case largeOnly
    }

    struct SmallBanner {
        public let image: UIImage
        public let rightLabelText: String
        public let leftLabelText: String

        public init(image: UIImage, rightLabelText: String, leftLabelText: String) {
            self.image = image
            self.rightLabelText = rightLabelText
            self.leftLabelText = leftLabelText
        }
    }

    struct LargeBanner {
        public let image: UIImage
        public let titleLabelText: String
        public let descriptionLabelText: String

        public init(image: UIImage, titleLabelText: String, descriptionLabelText: String) {
            self.image = image
            self.titleLabelText = titleLabelText
            self.descriptionLabelText = descriptionLabelText
        }
    }
}
