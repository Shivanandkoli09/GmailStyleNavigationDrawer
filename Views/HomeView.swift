//
//  HomeView.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isMenuOpen = false
    @State private var selectedTab: MenuOption = .allMatches

    var body: some View {
        ZStack {
            NavigationView {
                contentView()
                    .navigationTitle(title)
                    .navigationBarItems(leading: Button(action: {
                        withAnimation {
                            isMenuOpen.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                    })
            }

            if isMenuOpen {
                SideMenuView(selectedTab: $selectedTab, isMenuOpen: $isMenuOpen)
                    .transition(.move(edge: .leading))
            }
        }
    }

    @ViewBuilder
    func contentView() -> some View {
        switch selectedTab {
        case .allMatches:
            AllMatchesView()
        case .savedMatches:
            SavedMatchesView()
        }
    }

    var title: String {
        selectedTab == .allMatches ? "All Matches" : "Saved Matches"
    }
}

#Preview {
    HomeView()
}
