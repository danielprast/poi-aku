//
//  AppDependencyContainer.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


public class AppDependencyContainer {

  let dic: DICProtocol = DIC.shared

  public init() {
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
    let remoteDataSource = RemoteDataSourceImpl(networkService: networkManager)

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

    let repository = PoiRepositoryImpl(
      networkConnectionChecker: networkConnectionChecker,
      poiPhotoApi: remoteDataSource,
      poiReviewsApi: remoteDataSource,
      poiDetailApi: remoteDataSource,
      poiNearbyApi: remoteDataSource,
      poiAreaApi: remoteDataSource
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
  }
  
}
