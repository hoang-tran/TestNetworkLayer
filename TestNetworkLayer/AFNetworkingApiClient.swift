//
//  AFNetworkingApiClient.swift
//  TestNetworkLayer
//
//  Created by Hoang Tran on 9/8/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import AFNetworking
import SwiftyJSON

class AFNetworkingApiClient: GitHubApiClient {
  
  static func requestUserWithUsername(username: String, onSuccess: GitHubGetUserCallback? = nil, onError: ErrorCallback? = nil) {
    let urlString = "\(kGitHubApiBaseUrl)users/\(username)"
    let url = NSURL(string: urlString)!
    
    let manager = AFURLSessionManager(sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration())
    let request = NSURLRequest(URL: url)
    let dataTask = manager.dataTaskWithRequest(request) { response, data, error in
      if let error = error {
        onError?(error)
      } else if let data = data {
        let json = JSON(data)
        onSuccess?(GitHubUserData(json: json))
      }
    }
    dataTask.resume()
  }
}
