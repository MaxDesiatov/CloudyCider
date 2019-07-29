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

struct DesktopView: View {
  @EnvironmentObject var settings: UserSettings

  var body: some View {
    VStack(alignment: .leading) {
      HStack(alignment: .top) {
        Spacer()
        NavView().padding(.init(top: 10, leading: 0, bottom: 0, trailing: 10))
      }
      Spacer()
      HStack(alignment: .bottom) {
        Spacer()
        EC2Screen(store: EC2Store())
          .environmentObject(self.settings)
          .padding(.init(top: 0, leading: 10, bottom: 10, trailing: 10))
        Spacer()
      }
      Spacer()
    }
  }
}
