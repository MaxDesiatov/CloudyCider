//
//  Keychain.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/24/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import KeychainAccess

// Model for work with Keychain
final class KeychainAPI {
  // KeychainAccess entity to make work with Keychain easily
  private let keychain: Keychain

  // The service name
  private let service = "CloudyCider"

  // The list of settings key that will be stored in Keychain
  public enum SettingKey: String {
    case accessKeyId
    case secretAccessKey
  }

  init() {
    keychain = Keychain(service: service)
  }

  // Function to set values in the Keychain
  func set(key: SettingKey, value: String) {
    do {
      // Call set without remove will fire update error
      try keychain.remove(key.rawValue)
      try keychain.set(value, key: key.rawValue)
    } catch {
      print(error)
    }
  }

  // Function to get values from the Keychain
  func get(key: SettingKey) -> String? {
    return keychain[key.rawValue]
  }
}
