//
//  AppDependencyContainer.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


public class AppDependencyContainer {

  let dic: DICProtocol
  let sharedMainViewModel: MainViewModel

  public init() {
    func makeMainViewModel() -> MainViewModel {
      return MainViewModel()
    }

    dic = DIC.shared
    sharedMainViewModel = makeMainViewModel()

    setupBaseDependencies()
    setupDataDependencies()
  }

  fileprivate func setupBaseDependencies() {
    let networkConnectionChecker = NetworkConnectionChecker_V1()
    dic.register(type: NetworkConnectionChecker.self) { _ in
      return networkConnectionChecker as AnyObject
    }

    let networkManager = NetworkManager()
    dic.register(type: NetworkManager.self) { _ in
      return networkManager as AnyObject
    }
  }

  fileprivate func setupDataDependencies() {
    let networkConnectionChecker = dic.resolve(type: NetworkConnectionChecker.self)!
    let networkManager = dic.resolve(type: NetworkManager.self)!
    //let realRemoteDataSource = RemoteDataSourceImpl(networkService: networkManager)
    let fakeRemoteDataSource = FakeRemoteDataSource()
    let remoteDataSource = fakeRemoteDataSource //realRemoteDataSource

    dic.register(type: PoiReviewRemoteDataSource.self) { _ in
      return remoteDataSource as AnyObject
    }

    dic.register(type: PoiPhotoRemoteDataSource.self) { _ in
      return remoteDataSource as AnyObject
    }

    dic.register(type: PoiDetailRemoteDataSource.self) { _ in
      return remoteDataSource as AnyObject
    }

    dic.register(type: SearchPoiNearbyRemoteDataSource.self) { _ in
      return remoteDataSource as AnyObject
    }

    dic.register(type: SearchPoiInAreaRemoteDataSource.self) { _ in
      return remoteDataSource as AnyObject
    }

    dic.register(type: PoiAutoCompleteRemoteDataSource.self) { _ in
      return remoteDataSource as AnyObject
    }

    let repository = PoiRepositoryImpl(
      networkConnectionChecker: networkConnectionChecker,
      poiPhotoApi: remoteDataSource,
      poiReviewsApi: remoteDataSource,
      poiDetailApi: remoteDataSource,
      poiNearbyApi: remoteDataSource,
      poiAreaApi: remoteDataSource,
      poiAutocompleteApi: remoteDataSource
    )

    dic.register(type: PoiReviewsRepository.self) { _ in
      return repository as AnyObject
    }

    dic.register(type: PoiPhotoRepository.self) { _ in
      return repository as AnyObject
    }

    dic.register(type: PoiDetailRepository.self) { _ in
      return repository as AnyObject
    }

    dic.register(type: PoiNearbyRepository.self) { _ in
      return repository as AnyObject
    }

    dic.register(type: PoiAreaRepository.self) { _ in
      return repository as AnyObject
    }

    dic.register(type: PoiAutocompleteRepository.self) { _ in
      return repository as AnyObject
    }
  }

  public func makePoiViewModel() -> PoiViewModel {
    return PoiViewModel(
      searchNearbyRepository: dic.resolve(type: PoiNearbyRepository.self)!,
      searchInAreaRepository: dic.resolve(type: PoiAreaRepository.self)!,
      poiAutocompleteRepository: dic.resolve(type: PoiAutocompleteRepository.self)!
    )
  }

  public func makePoiView() -> PoiView {
    return PoiView(viewModel: makePoiViewModel())
  }

  public func makeRootView() -> MainView {
    let poiViewFactory = {
      return self.makePoiView()
    }

    return MainView(
      viewModel: sharedMainViewModel,
      poiViewFactory: poiViewFactory
    )
  }
  
}
