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

  var body: some View {
    Button(action: { self.isPresented.toggle() }) { Text("Source View") }.sheet(isPresented: $isPresented, content: {
      HStack {
        Button(action: { self.isPresented.toggle() }) { Text("Source View") }
      }
      Text("Destination View")
    })
  }
}

struct DesktopView: View {
  var body: some View {
    VStack {
      NavView()
      SettingsScreen()
    }
  }
}
