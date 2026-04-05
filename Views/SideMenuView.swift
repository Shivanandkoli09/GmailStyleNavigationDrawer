//
//  SideMenuView.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var selectedTab: MenuOption
    @Binding var isMenuOpen: Bool

    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        isMenuOpen = false
                    }
                }

            HStack {
                VStack(alignment: .leading, spacing: 20) {

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Welcome 👋")
                            .font(.headline)

                        Text("Match List")
                            .font(.title2)
                            .bold()
                    }
                    .padding(.top, 40)
                    .padding(.bottom, 20)

                    ForEach(MenuOption.allCases, id: \.self) { option in
                        menuRow(option)
                    }

                    Spacer()
                }
                .padding()
                .frame(width: 260)
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .shadow(radius: 5)

                Spacer()
            }
        }
    }

    @ViewBuilder
    func menuRow(_ option: MenuOption) -> some View {
        Button {
            withAnimation {
                selectedTab = option
                isMenuOpen = false
            }
        } label: {
            HStack(spacing: 16) {
                Image(systemName: option.icon)
                    .font(.system(size: 18))

                Text(option.rawValue)
                    .font(.system(size: 16, weight: .medium))

                Spacer()
            }
            .padding()
            .background(
                selectedTab == option
                ? Color.blue.opacity(0.15)
                : Color.clear
            )
            .cornerRadius(10)
        }
        .foregroundColor(selectedTab == option ? .blue : .primary)
    }
}

//#Preview {
//    SideMenuView(selectedTab: MenuOption.allMatches, isMenuOpen: constant(false))
//}

