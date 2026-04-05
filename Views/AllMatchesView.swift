//
//  AllMatchesView.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//

import SwiftUI

struct AllMatchesView: View {
    @StateObject private var vm = MatchesViewModel()
    @Environment(\.managedObjectContext) private var context

    var body: some View {
        List(vm.venues) { venue in
            MatchRowView(venue: venue)
        }
        .task {
            await vm.fetchMatches()
        }
    }
}

#Preview {
    AllMatchesView()
}
