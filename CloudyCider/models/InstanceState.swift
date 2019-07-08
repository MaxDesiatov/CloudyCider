//
//  InstanceState.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/7/19.
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
  init(_ value: Int32) {
    switch value {
    case 0:
      self = .pending
    case 16:
      self = .running
    case 32:
      self = .shuttingDown
    case 48:
      self = .terminated
    case 64:
      self = .stopping
    case 80:
      self = .stopped
    default:
      self = .running
    }
  }

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
