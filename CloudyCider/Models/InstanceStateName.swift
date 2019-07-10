//
//  InstanceState.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/7/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import EC2
import SwiftUI

extension EC2.InstanceStateName {
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
    }
  }
}
