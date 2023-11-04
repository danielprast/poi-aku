//
//  PoiView.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import SwiftUI


public struct PoiView: View {

  @StateObject var viewModel: PoiViewModel
  @State var titleText: String = ""

  public init(viewModel: PoiViewModel) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }

  public var body: some View {
    ZStack {
      spacerView
      BottomSheetView(searchText: $viewModel.searchText) {
        poiContent()
      }
    }
    .background(
      MapView()
        .environmentObject(viewModel)
        .edgesIgnoringSafeArea(.all)
    )
    .onAppear {
      titleText = "Joss Gandoss"
    }
  }

  @ViewBuilder
  private func poiContent() -> some View {
    VStack {
      HStack {

        Text("Favourites")
          .fontWeight(.bold)
          .foregroundColor(.white)

        Spacer()

        Button(action: {}, label: {
          Text("See All")
            .fontWeight(.bold)
            .foregroundColor(.gray)
        })
      }
      .padding(.top, 20)

      Divider()
        .background(Color.white)

      ScrollView(.horizontal, showsIndicators: false, content: {

        HStack(spacing: 15){

          VStack(spacing: 8){

            Button(action: {}, label: {
              Image(systemName: "house.fill")
                .font(.title)
                .frame(width: 65, height: 65)
                .background(BlurView(style: .dark))
                .clipShape(Circle())
            })

            Text("Home")
              .foregroundColor(.white)
          }

          VStack(spacing: 8){

            Button(action: {}, label: {
              Image(systemName: "briefcase.fill")
                .font(.title)
                .frame(width: 65, height: 65)
                .background(BlurView(style: .dark))
                .clipShape(Circle())
            })

            Text("Work")
              .foregroundColor(.white)
          }

          VStack(spacing: 8){

            Button(action: {}, label: {
              Image(systemName: "plus")
                .font(.title)
                .frame(width: 65, height: 65)
                .background(BlurView(style: .dark))
                .clipShape(Circle())
            })

            Text("Add")
              .foregroundColor(.white)
          }
        }
      })
      .padding(.top)
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
