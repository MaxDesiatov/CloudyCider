//
//  UserSettings.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/25/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import Combine
import SwiftUI

class UserSettings: BindableObject {
  var willChange = PassthroughSubject<(), Never>()

  let keychainSettings = KeychainSettings()

  var accessKeyId = "" {
    didSet {
      keychainSettings.set(key: "accessKeyId", value: accessKeyId)
      willChange.send(())
    }
  }

  var secretAccessKey = "" {
    didSet {
      keychainSettings.set(key: "secretAccessKey", value: secretAccessKey)
      willChange.send(())
    }
  }
}
