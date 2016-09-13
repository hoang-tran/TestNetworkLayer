//
//  GitHubApiClient.swift
//  TestNetworkLayer
//
//  Created by Hoang Tran on 9/8/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Foundation

let kGitHubApiBaseUrl = "https://api.github.com/"

typealias GitHubGetUserCallback = (GitHubUserData) -> Void
typealias ErrorCallback = (NSError) -> Void

protocol GitHubApiClient {
  static func requestUserWithUsername(username: String,
                                  onSuccess: GitHubGetUserCallback?,
                                  onError: ErrorCallback?)
}