//
//  PoiView.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import SwiftUI


public struct PoiView: View {

  @StateObject var viewModel: PoiViewModel
  @State var titleText: String = ""
  @State var focusResponder: Bool = false
  @State var showDetail: Bool = false

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
    .sheet(isPresented: $showDetail) {
      DetailScreen()
        .environmentObject(viewModel)
    }
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
          .padding(.horizontal, 12)
          .background(Color.white.opacity(0.25))
          .clipShape(RoundedRectangle(cornerRadius: 12))
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
        HStack {
          VStack {
            Text(item.response.name)
          }
          Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(Color.white.opacity(0.25))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .onTapGesture {
          shout("item search", item.response.name)
          viewModel.bussinessId = item.id
           showDetail = true
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
