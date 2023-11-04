//
//  AutocompleteItem.swift
//  Created by Daniel Prastiwa on 05/11/23.
//

import SwiftUI


public struct AutocompleteItemView: View {

  let model: AutocompleteItem

  public init(model: AutocompleteItem) {
    self.model = model
  }

  var iconColor: Color {
    model.isNearby ? Color.orange : Color.gray
  }

  public var body: some View {
    HStack(spacing: 16) {
      Image(systemName: "magnifyingglass")
        .resizable()
        .scaledToFit()
        .padding(9)
        .frame(width: 32, height: 32)
        .background(iconColor.opacity(0.55))
        .clipShape(Circle())

      VStack(alignment: .leading, spacing: 4) {
        Text(model.mainText)
          .font(.headline)
          .lineLimit(1)
          .truncationMode(.tail)

        if !model.secondaryText.isEmpty {
          Text(model.secondaryText)
            .font(.subheadline)
            .lineLimit(1)
            .truncationMode(.tail)
            .foregroundColor(.black.opacity(0.65))
        }
      }

      Spacer()
    }
  }

  private var spacerView: some View {
    HStack {
      Spacer()
      VStack {
        Spacer()
      }
    }
  }

}


public struct AutocompleteItem {

  public init(id: String = UUID().uuidString, mainText: String, secondaryText: String, isNearby: Bool) {
    self.id = id
    self.mainText = mainText
    self.secondaryText = secondaryText
    self.isNearby = isNearby
  }

  let id: String
  let mainText: String
  let secondaryText: String
  let isNearby: Bool
}


struct AutocompleteItemView_Previews: PreviewProvider {

  static var previews: some View {
    ZStack {
      AutocompleteItemView(
        model: AutocompleteItem(
          mainText: "train".capitalized,
          secondaryText: "near Sunnyvale Municipal Tennis Center, South Mathilda Avenue, Sunnyvale, CA",
          isNearby: false
        )
      )
      .padding(.horizontal, 20)
      .padding(.vertical, 10)
    }
    .previewLayout(.sizeThatFits)
  }
}
