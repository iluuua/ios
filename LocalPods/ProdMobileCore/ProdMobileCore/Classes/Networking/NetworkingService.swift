//
//  NetworkingService.swift
//  ProdMobileCore
//
//  Created by Kuznetsov Mikhail on 12.02.2024.
//

import Foundation

public final class NetworkingService: INetworkingService {

    // MARK: - Init

    public init() {}

    // MARK: - Public

    public func load(request: IRequest, _ completion: @escaping (Result<Data, Error>) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(Int.random(in: 30...200))) { [weak self] in
            guard let self else { return }
            completion(self.getResponseFor(request: request))
        }
    }

    // MARK: - Private

    private func getResponseFor(request: IRequest) -> Result<Data, Error> {
        guard request.baseUrl == "https://prodcontest-ios.ru" else { return .failure(NetworkingError.invalidRequest) }

        switch request.methodPath {
        case "/goods_banners":
            return JSONStubs.bannerResponse.wrapToResult()
        case "/goods/all":
            return JSONStubs.goodsAllResponse.wrapToResult()
        case "/user/user312/goods_info":
            return JSONStubs.userInfoResponse.wrapToResult()
        case "/bonuses/all":
            return JSONStubs.bonusesAllResponse.wrapToResult()
        default:
            return .failure(NetworkingError.notFound)
        }
    }
}

private extension Data? {
    func wrapToResult() -> Result<Data, Error> {
        guard let self else {
            return .failure(NetworkingError.notFound)
        }

        return .success(self)
    }
}

enum JSONStubs {

    static let bannerResponse = """
    {
        "large": {
            "priority": 0,
            "image_id": "banner-1-img",
            "title": "Кэшбэк на манго",
            "description": "Купите до 2 кг Манго и получите %@",
            "bonus": {
                "value": 123,
                "postfix": " баллов"
            }
        },
        "small": {
            "priority": 1,
            "right_label": "Акции",
            "left_label": "2 в 1"
        }
    }
    """.data(using: .utf8)

    static let goodsAllResponse = """
    {
        "goods": [
            {
                "id": "good_13647283-dao",
                "image_id": "goods-1-img",
                "name": "Хлеб с отрубями Хрустяшка",
                "producer": {
                    "id": "prodai-31323",
                    "name": "АО Московский хрящекомбинат"
                },
                "item_countity": {
                    "type": "gramm",
                    "value": 200
                },
                "cost": 130,
                "popularity": 100,
                "category": "HLEB"
            },
            {
                "id": "good_13643463-hae",
                "image_id": "goods-2-img",
                "name": "Ты мягкий пирожочек",
                "producer": {
                    "id": "prodai-31323",
                    "name": "Участник PROD'а"
                },
                "is_new": true,
                "item_countity": {
                    "type": "kilo",
                    "value": 2
                },
                "cost": 2000,
                "popularity": 100,
                "rating": 4.9,
                "category": "HLEB"
            },
            {
                "id": "good_87647283-dop",
                "image_id": "goods-3-img",
                "name": "Молоко Молочное",
                "producer": {
                    "id": "prodai-31323",
                    "name": "ООО Милые Коровки"
                },
                "is_new": true,
                "item_countity": {
                    "type": "kilo",
                    "value": 1
                },
                "cost": 244,
                "popularity": 25,
                "rating": 3.5,
                "bonus_ids": ["bonus_3233", "bonus_323"],
                "category": "MILK"
            },
            {
                "id": "good_13649783-wpo",
                "image_id": "goods-4-img",
                "name": "Манго сочное. Египет",
                "producer": {
                    "id": "prodai-31323",
                    "name": "Египетские сельхоз проля Дары Клеопатры"
                },
                "item_countity": {
                    "type": "gramm",
                    "value": 200
                },
                "cost": 130.2506,
                "popularity": 35,
                "rating": 4.5,
                "bonus_ids": ["bonus_13132", "bonus_4243"],
                "category": "FRUITS"
            }
        
        ]
    }
    """.data(using: .utf8)

    static let userInfoResponse = """
    {
        "last_goods_cat": ["FRUITS", "MILK"],
        "available_bonuses": ["bonus_323", "bonus_4243", "bonus_13132"],
        "favourites": ["good_13643463-hae"],
        "activity_level": 50
    }
    """.data(using: .utf8)

    static let bonusesAllResponse = """
    [
        {
            "id": "bonus_13132",
            "type": "cashback",
            "value": 0.1,
            "available_due_to": "2025-04-23T18:25:43.511Z"
        },
        {
            "id": "bonus_4243",
            "type": "points",
            "value": 200,
            "promotion_extra": {
                "base_color": "5222FF",
                "tint_color": "FFFFFF",
                "label": "PREMIUM"
            }
        },
        {
            "id": "bonus_323",
            "type": "cashback",
            "value": 0.05,
        },
        {
            "id": "bonus_3233",
            "type": "points",
            "value": 1000,
        }
    ]
    """.data(using: .utf8)
}
