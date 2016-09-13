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
  
  static func requestUserWithUsername(username: String, onSuccess: GitHubGetUserCallback? = nil, onError: ErrorCallback? = nil) {
    let urlString = "\(kGitHubApiBaseUrl)users/\(username)"

    Alamofire.request(.GET, urlString)
      .validate()
      .responseJSON { response in
        switch response.result {
        case .Success:
          if let data = response.result.value {
            let json = JSON(data)
            onSuccess?(GitHubUserData(json: json))
          }
        case .Failure(let error):
          onError?(error)
        }
    }
  }
}
