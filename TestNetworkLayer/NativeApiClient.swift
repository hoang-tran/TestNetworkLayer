//
//  MyApiClient.swift
//  TestNetworkLayer
//
//  Created by Hoang Tran on 9/8/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Foundation
import SwiftyJSON

class NativeApiClient: GitHubApiClient {
  
  static func requestGitHubUserWithName(name: String) {
    let urlString = "\(kGitHubApiBaseUrl)users/\(name)"
    let url = NSURL(string: urlString)!

    let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    let dataTask = defaultSession.dataTaskWithURL(url) { data, response, error in
      if let error = error {
        print("error: \(error)")
      } else if let data = data {
        let json = JSON(data: data)
        print("data: \(json)")
      }
    }
    dataTask.resume()
  }
}
