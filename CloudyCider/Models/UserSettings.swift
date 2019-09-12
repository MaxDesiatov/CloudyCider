//
//  UserSettings.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/25/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import Combine
import SwiftUI

/// The model for work with UserSettings, store and update.
final class UserSettings: ObservableObject {
  var willChange = PassthroughSubject<(), Never>()

  /// Entity to work with Keychain inside UserSettings
  let keychainAPI = KeychainAPI()

  /// EC2 user accessKeyId. It is need to fetch data from EC2
  var accessKeyId = "" {
    didSet {
      keychainAPI.set(key: .accessKeyId, value: accessKeyId)
      willChange.send(())
    }
  }

  /// EC2 user secretAccessKey. It is need to fetch data from EC2
  var secretAccessKey = "" {
    didSet {
      keychainAPI.set(key: .secretAccessKey, value: secretAccessKey)
      willChange.send(())
    }
  }
}
