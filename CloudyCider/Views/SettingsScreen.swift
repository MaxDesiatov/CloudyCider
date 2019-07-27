//
//  SettingScreen.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/23/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import KeychainAccess
import SwiftUI

struct SettingsScreen: View {
  @EnvironmentObject var settings: UserSettings
  @State var accessKeyId = ""
  @State var secretAccessKey = ""

  var body: some View {
    Form {
      Section(header: Text("Access Key ID")) {
        TextField("Your ID", text: $accessKeyId)
      }
      Section(header: Text("Secret Access Key")) {
        TextField("Your Key", text: $secretAccessKey)
      }
      Button(action: {
        self.settings.accessKeyId = self.accessKeyId
        self.settings.secretAccessKey = self.secretAccessKey
      }) {
        Text("Save")
      }
    }.onAppear {
      do {
        if let accessKeyId = try self.settings.keychainAPI.get(key: .accessKeyId) {
          self.accessKeyId = accessKeyId
        }
        if let secretAccessKey = try self.settings.keychainAPI.get(key: .secretAccessKey) {
          self.secretAccessKey = secretAccessKey
        }
      } catch {
        print(error)
      }
    }
  }
}
