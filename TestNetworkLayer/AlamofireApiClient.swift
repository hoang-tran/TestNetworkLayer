//
//  AlamofireApiClient.swift
//  TestNetworkLayer
//
//  Created by Hoang Tran on 9/8/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Alamofire
import SwiftyJSON

class AlamofireApiClient: GitHubApiClient {
  
  static func requestGitHubUserWithName(name: String) {
    let urlString = "\(kGitHubApiBaseUrl)users/\(name)"

    Alamofire.request(.GET, urlString)
      .validate()
      .responseJSON { response in
        switch response.result {
        case .Success:
          if let data = response.result.value {
            let json = JSON(data)
            print("data: \(json)")
          }
        case .Failure(let error):
          print(error)
        }
    }
  }
}
