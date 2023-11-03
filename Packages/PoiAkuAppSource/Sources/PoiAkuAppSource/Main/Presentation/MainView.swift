//
//  MainView.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import SwiftUI
import Combine


public struct MainView: View {

  @ObservedObject var viewModel: MainViewModel

  public init(viewModel: MainViewModel) {
    self.viewModel = viewModel
  }

  public var body: some View {
    Text("MainView!!!")
      .onAppear {
        viewModel.testFetch()
      }
  }
}


public class MainViewModel: ObservableObject {

  public init() {}

  public var task: AnyCancellable?

  public func testFetch() {
    let networkChecker = NetworkConnectionChecker_V1()
    let remote = RemoteDataSourceImpl(networkService: NetworkManager())
    let repo = PoiRepositoryImpl(
      networkConnectionChecker: networkChecker,
      poiPhotoApi: remote
    )
    //let param = PoiModule.Data.Payload.SearchPoi(keyword: "plumbers", lat: 37.359428, lng: -121.925337, zoom: 13)
    //task = remote.fetchSearchPoiInArea(params: param.requestParams)
    //let param = PoiModule.Data.Payload.PoiDetail(businessId: "0x89c259b5a9bd152b:0x31453e62a3be9f76")
    //task = remote.fetchPoiDetail(params: param.requestParams)
    //task = remote.fetchPoiPhoto(params: param.requestParams)
    task = repo.getPoiPhotos(payload: PoiModule.Data.Payload.PoiPhoto(businessId: "0x89c259b5a9bd152b:0x31453e62a3be9f76"))
      .subscribe(on: DispatchQueue.global(qos: .userInitiated))
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
      .sink(receiveCompletion: { completion in
        shout("completion", completion)
      }, receiveValue: { data in
        shout("poi data", data)
      })
  }
}


//struct MainView_Previews: PreviewProvider {
//  static var previews: some View {
//    MainView()
//  }
//}
