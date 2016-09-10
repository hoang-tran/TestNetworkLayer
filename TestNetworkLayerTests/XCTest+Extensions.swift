//
//  XCTest+Extensions.swift
//  TestNetworkLayer
//
//  Created by Hoang Tran on 9/10/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import XCTest
import Mockingjay

extension XCTest {
  public func stub(urlString: String, jsonFileName: String) -> Mockingjay.Stub {
    let path = NSBundle(forClass: self.dynamicType).pathForResource(jsonFileName, ofType: "json")!
    let data = NSData(contentsOfFile: path)!
    return stub(uri(urlString), builder: jsonData(data))
  }

  public func stub(urlString: String, error: NSError) -> Mockingjay.Stub {
    return stub(uri(urlString), builder: failure(error))
  }
}
