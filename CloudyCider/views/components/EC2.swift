//
//  EC2.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/1/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI
// import SwiftUIFlux

// MARK: - Shared View

struct HomeView: View {
  #if targetEnvironment(UIKitForMac)
  var body: some View {
    DesctopView()
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

struct DesctopView: View {
//    var instances: [EC2Instance] = []
  let instances = testEC2InstancesData

  var body: some View {
    List(instances) { instance in
      VStack(alignment: .leading) {
        Text(instance.name)
        Text("status")
          .color(instance.status.value)
      }
    }
  }
}
