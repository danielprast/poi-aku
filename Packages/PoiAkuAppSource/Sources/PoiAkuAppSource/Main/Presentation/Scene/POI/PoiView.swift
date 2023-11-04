//
//  PoiView.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import SwiftUI


public struct PoiView: View {

  @StateObject var viewModel: PoiViewModel
  @State var titleText: String = ""
  @State var focusResponder: Bool = false

  let textColor = Color.colorHex(.black).opacity(0.65)

  public init(viewModel: PoiViewModel) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }

  public var body: some View {
    ZStack {
      spacerView
      BottomSheetView(
        searchText: $viewModel.searchText,
        focusResponder: $focusResponder,
        onFocusedInputTextSearch: { isFocused in
          shout("input text search focused", isFocused)
          if !isFocused {
            return
          }
          viewModel.searchMode = isFocused
        },
        onSubmitInputTextSearch: {
          viewModel.submitTextSearch()
        },
        content: {
          poiSheetContent()
        }
      )
    }
    .background(
      MapView()
        .environmentObject(viewModel)
        .edgesIgnoringSafeArea(.all)
    )
    .onAppear {
      titleText = "Joss Gandoss"
      viewModel.searchPoiAtSpecificArea()
    }
  }

  @ViewBuilder
  private func poiSheetContent() -> some View {
    if viewModel.searchMode {
      autocompleteContentsView()
    } else {
      if viewModel.poListEntity == nil {
        EmptyView()
      } else {
        poiContentsView()
      }
    }
  }

  @ViewBuilder
  private func autocompleteContentsView() -> some View {
    if viewModel.autocompleteListEntity == nil {
      EmptyView()
    } else {
      VStack(alignment: .leading) {
        ForEach(viewModel.displayAutocompleteList, id: \.id) { item in
          AutocompleteItemView(
            model: AutocompleteItem(
              id: item.id,
              mainText: item.mainText,
              secondaryText: item.secondaryText,
              isNearby: item.isNearby
            )
          )
          .padding(.vertical, 8)
          .onTapGesture {
            focusResponder = true
            viewModel.onTapAutoCompleteItem(item)
          }
        }
      }
    }
  }

  @ViewBuilder
  private func poiContentsView() -> some View {
    VStack {
      ForEach(viewModel.displayPoiList, id: \.id) { item in
        Text(item.response.name)
      }
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
