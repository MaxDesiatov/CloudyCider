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
  var color: Color {
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

  var string: String {
    switch self {
    case .pending:
      return "pending"
    case .running:
      return "running"
    case .stopping:
      return "stopping"
    case .stopped:
      return "stopped"
    case .shuttingDown:
      return "shutting-down"
    case .terminated:
      return "terminated"
    case .rebooting:
      return "rebooting"
    }
  }
}

struct EC2Instance: Identifiable {
  var id = UUID()
  var name: String
  var status: InstanceState
}

let testEC2InstancesData = [
  EC2Instance(name: "Linux", status: .pending),
  EC2Instance(name: "Windows", status: .running),
  EC2Instance(name: "Redhat", status: .stopping),
  EC2Instance(name: "Mint", status: .stopped),
  EC2Instance(name: "Arch", status: .shuttingDown),
  EC2Instance(name: "Ubuntu", status: .terminated),
  EC2Instance(name: "MSDOS", status: .rebooting),
]
