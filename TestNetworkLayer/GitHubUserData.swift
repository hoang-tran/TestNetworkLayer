//
//  GitHubUserData.swift
//  TestNetworkLayer
//
//  Created by eastagile-tc on 9/9/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import SwiftyJSON

struct GitHubUserData {
  var name: String
  var bio: String
  var email: String
  var numberOfFollowers: Int
  var numberOfFollowing: Int
  
  init(json: JSON) {
    name = json["name"].stringValue
    bio = json["bio"].stringValue
    email = json["email"].stringValue
    numberOfFollowers = json["followers"].intValue
    numberOfFollowing = json["following"].intValue
  }
}
