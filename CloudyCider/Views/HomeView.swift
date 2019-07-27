//
//  HomeScreen.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/23/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

// MARK: - Shared View

struct HomeView: View {
  #if targetEnvironment(macCatalyst)
  var body: some View {
    DesktopView()
  }

  #else
  var body: some View {
    MobileView()
  }
  #endif
}

// MARK: - iOS implementation

struct MobileView: View {
  var body: some View {
    SettingsScreen()
  }
}

// MARK: - MacOS implementation

struct NavView: View {
  @State var isPresented = false

  // The environment object is reachable only with explicit passing to SettingsScreen.
  // This might be because of SettingsScreen position inside modal.
  @EnvironmentObject var settings: UserSettings

  var body: some View {
    Button(action: { self.isPresented.toggle() }) { Text("Source View") }.sheet(isPresented: $isPresented, content: {
      HStack {
        Button(action: { self.isPresented.toggle() }) { Text("Source View") }
      }
      SettingsScreen().environmentObject(self.settings)
    })
  }
}

struct DesktopView: View {
  @EnvironmentObject var settings: UserSettings

  var body: some View {
    VStack {
      NavView()
      EC2Screen(store: EC2Store()).environmentObject(self.settings)
    }
  }
}
