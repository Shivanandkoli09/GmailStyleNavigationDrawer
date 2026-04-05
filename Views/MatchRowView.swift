//
//  MatchRowView.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//

import SwiftUI
import CoreData

struct MatchRowView: View {
    let venue: Venue
    @Environment(\.managedObjectContext) private var context

    @FetchRequest(
        entity: SavedMatch.entity(),
        sortDescriptors: []
    ) var savedMatches: FetchedResults<SavedMatch>

    var isSaved: Bool {
        savedMatches.contains(where: { $0.id == venue.id })
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(venue.name)
                    .font(.headline)

                Text(venue.location?.city ?? "Unknown")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: toggleSave) {
                Image(systemName: isSaved ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
    }

    func toggleSave() {
        if isSaved {
            deleteMatch()
        } else {
            saveMatch()
        }
    }

    func saveMatch() {
        let match = SavedMatch(context: context)
        match.id = venue.id
        match.name = venue.name
        match.city = venue.location?.city

        try? context.save()
    }

    func deleteMatch() {
        if let match = savedMatches.first(where: { $0.id == venue.id }) {
            context.delete(match)
            try? context.save()
        }
    }
}

//#Preview {
//    MatchRowView()
//}

