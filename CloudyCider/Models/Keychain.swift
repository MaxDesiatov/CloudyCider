//
//  Keychain.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/24/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import KeychainAccess

class KeychainSettings {
  private let keychain: Keychain
  private let service = "CloudyCider"

  init() {
    keychain = Keychain(service: "CloudyCider", accessGroup: "12ABCD3E4F.shared")
  }

  func set(key: String, value: String) {
    do {
      // Call set without remove will fire update error
      try keychain.remove(key)
      try keychain.set(value, key: key)
    } catch {
      print(error)
    }
  }

  func get(key: String) -> String? {
    return keychain[key]
  }
}
