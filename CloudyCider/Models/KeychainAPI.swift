//
//  Keychain.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/24/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import KeychainAccess

/// The model for work with Keychain
final class KeychainAPI {
  /// The keychainAccess entity to make work with Keychain easily
  private let keychain: Keychain

  /// The service name
  private let service = "CloudyCider"

  /// The list of the settings key that will be stored in Keychain
  public enum SettingKey: String {
    case accessKeyId
    case secretAccessKey
  }

  init() {
    keychain = Keychain(service: service)
  }

  /// This function is used to set the value in Keychain
  func set(key: SettingKey, value: String) {
    do {
      // Call set without remove will fire an update error
      try keychain.remove(key.rawValue)
      try keychain.set(value, key: key.rawValue)
    } catch {
      print(error)
    }
  }

  /// This function is used  to get the value from Keychain
  func get(key: SettingKey) throws -> String? {
    return try keychain.get(key.rawValue)
  }
}
