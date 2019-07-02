//
//  EC2Instance.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/2/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

enum InstanceState {
  case pending
  case running
  case stopping
  case stopped
  case shuttingDown
  case terminated
  case rebooting
}

extension InstanceState {
  var value: Color {
    switch self {
    case .pending:
      return .yellow
    case .running:
      return .green
    case .stopping:
      return .yellow
    case .stopped:
      return .red
    case .shuttingDown:
      return .yellow
    case .terminated:
      return .red
    case .rebooting:
      return .blue
    }
  }
}

struct EC2Instance: Identifiable {
  var id = UUID()
  var name: String
  var status: InstanceState
}

let testEC2InstancesData = [
  EC2Instance(name: "Pending", status: .pending),
  EC2Instance(name: "Running", status: .running),
  EC2Instance(name: "Stopping", status: .stopping),
  EC2Instance(name: "Stopped", status: .stopped),
  EC2Instance(name: "ShuttingDown", status: .shuttingDown),
  EC2Instance(name: "Terminated", status: .terminated),
  EC2Instance(name: "Rebooting", status: .rebooting),
]
