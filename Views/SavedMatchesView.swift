//
//  SavedMatchesView.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//

import SwiftUI
import CoreData
import Combine

struct SavedMatchesView: View {
    @Environment(\.managedObjectContext) private var context

    @FetchRequest(
        entity: SavedMatch.entity(),
        sortDescriptors: []
    ) var savedMatches: FetchedResults<SavedMatch>

    var body: some View {
        List {
            ForEach(savedMatches) { match in
                HStack {
                    VStack(alignment: .leading) {
                        Text(match.name ?? "")
                        Text(match.city ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    Button(action: {
                        delete(match)
                    }) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
        }
    }

    func delete(_ match: SavedMatch) {
        context.delete(match)
        try? context.save()
    }
}

#Preview {
    SavedMatchesView()
}
