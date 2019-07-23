//
//  SettingScreen.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/23/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

struct SettingsScreen: View {
  @State private var name: String = ""

  var body: some View {
    Form {
      TextField("Enter your name", text: $name)
    }
  }
}
