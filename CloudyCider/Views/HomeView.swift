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

struct DetailsView: View {
  let message: String

  var body: some View {
    VStack {
      Text(message)
        .font(.largeTitle)
    }
  }
}

struct DesktopView: View {
//  private let messages = [
//    "Hello", "How are you?",
//  ]
  var body: some View {
//    EC2Screen(store: EC2Store())
    SettingsScreen()
//    NavigationView {
//      List(messages, id: \.self) { message in
//        NavigationLink(destination: DetailsView(message: message)) {
//          Text(message)
//        }
//      }.navigationBarTitle("Messages")
//    }
  }
}
