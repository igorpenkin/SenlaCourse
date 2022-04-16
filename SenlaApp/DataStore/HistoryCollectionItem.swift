//
//  HistoryCollectionItem.swift
//  SenlaApp
//
//  Created by Igor Penkin on 09.04.2022.
//

import UIKit


struct HistoryCollectionItem: Hashable {
    let uuid = UUID()
    
    enum ItemType {
        case recent(configuration: RecentContentConfiguration)
        case popular(configuration: PopularContnetConfiguration)
        case ordinary(configuration: OrdinaryContentConfiguration)
    }
    
    let content: ItemType
    
    init(content: ItemType) {
        self.content = content
    }
    
    static func == (lhs: HistoryCollectionItem, rhs: HistoryCollectionItem) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
//        hash(into: &hasher)
    }
}
