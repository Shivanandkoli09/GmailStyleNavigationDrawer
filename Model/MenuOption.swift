//
//  MenuOption.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//

enum MenuOption: String, CaseIterable {
    case allMatches = "All Matches"
    case savedMatches = "Saved Matches"

    var icon: String {
        switch self {
        case .allMatches:
            return "list.bullet"
        case .savedMatches:
            return "star.fill"
        }
    }
}
