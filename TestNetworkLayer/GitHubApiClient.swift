//
//  GitHubApiClient.swift
//  TestNetworkLayer
//
//  Created by Hoang Tran on 9/8/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Foundation

let kGitHubApiBaseUrl = "https://api.github.com/"

protocol GitHubApiClient {
  static func requestGitHubUserWithName(name: String)
}