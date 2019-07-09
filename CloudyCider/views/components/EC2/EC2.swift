//
//  EC2.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/1/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

// MARK: - Shared View

struct HomeView: View {
  #if targetEnvironment(UIKitForMac)
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
    Text("Mobile View")
  }
}

// MARK: - MacOS implementation

struct DesktopView: View {
  var body: some View {
    EC2List(store: EC2Store())
  }
}
