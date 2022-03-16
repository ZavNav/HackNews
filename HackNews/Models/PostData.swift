//
//  PostData.swift
//  HackNews
//
//  Created by Аркадий Рожков on 16.03.2022.
//

import Foundation

struct Results: Decodable {
    let hits: [PostData]
}

struct PostData: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
