//
//  TabbedItems.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable {
    case userList
    case authorisation
    
    var tile: LocalizedStringKey {
        switch self {
        case .userList:
            "user.list.tab.item.title"
        case .authorisation:
            "authorisation.tab.item.title"
        }
    }
    
    var image: String {
        switch self {
        case .userList:
            "person.3.sequence.fill"
        case .authorisation:
            "person.fill.badge.plus"
        }
    }
}
