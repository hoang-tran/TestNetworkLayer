//
//  MyApiClientSpec.swift
//  TestNetworkLayer
//
//  Created by Hoang Tran on 9/8/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Quick
import Nimble
import Mockingjay
@testable import TestNetworkLayer

class NativeApiClientSpec : QuickSpec {
  override func spec() {
    super.spec()

    describe("requestUserWithName") {
      var returnedUserData: GitHubUserData?
      var returnedError: NSError?
      let urlString = "https://api.github.com/users/hoang-tran"

      beforeEach {
        returnedUserData = nil
        returnedError = nil
      }

      context("success") {
        beforeEach {
          self.stub(urlString, jsonFileName: "GetUserSuccess")
          NativeApiClient.requestUserWithUsername("hoang-tran", onSuccess: { userData in
            returnedUserData = userData
          })
        }

        it("returns GitHubUserData") {
          expect(returnedUserData).toEventuallyNot(beNil(), timeout: 20)
          expect(returnedUserData?.name) == "Hoang Tran"
          expect(returnedUserData?.bio) == "Hi, I'm Hoang. I'm a Swift lover. I blog weekly about iOS development/testing/deployment at http://hoangtran.me/\r\nAnd I happen to love GitHub so much 😜 "
          expect(returnedUserData?.email) == "hoangtx.master@gmail.com"
          expect(returnedUserData?.numberOfFollowers) == 16
          expect(returnedUserData?.numberOfFollowing) == 93
        }
      }

      context("error") {
        let error = NSError(domain: "error", code: 404, userInfo: nil)

        beforeEach {
          self.stub(urlString, error: error)
          NativeApiClient.requestUserWithUsername("hoang-tran", onError: { error in
            returnedError = error
          })
        }

        it("returns error") {
          expect(returnedError).toEventuallyNot(beNil())
          expect(returnedError?.domain) == error.domain
          expect(returnedError?.code) == error.code
        }
      }
    }
  }
}
