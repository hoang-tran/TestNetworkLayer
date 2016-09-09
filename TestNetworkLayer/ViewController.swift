//
//  ViewController.swift
//  TestNetworkLayer
//
//  Created by Hoang Tran on 9/8/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let onSuccess: (GitHubUserData) -> Void = { userData in
      print(userData)
    }
    NativeApiClient.requestUserWithName("hoang-tran", onSuccess: onSuccess)
  }
}
