//
//  EC2Instance.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/2/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import Combine
import EC2
import SwiftUI

final class ECStore: BindableObject {
  public let didChange = PassthroughSubject<(), Never>()
  public var instances = testEC2InstancesData {
    didSet {
      DispatchQueue.main.async {
        self.didChange.send()
      }
    }
  }

  public func updateInstances() {
    instances = []
  }
}

class EC2Listener {
  var currentPage: Int = 1 {
    didSet {
      loadPage()
    }
  }

  func loadPage() {}
}

final class EC2PageListener: EC2Listener {
  func loadPage(store: ECStore) {
    // MARK: - EC2Init

    let accessKeyId = "AKIA2VSQ64GBSMZGGL4Y"
    let secretAccessKey = "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"
    let ec2 = EC2(accessKeyId: accessKeyId, secretAccessKey: secretAccessKey)
    do {
      try ec2.describeInstances(EC2.DescribeInstancesRequest()).whenSuccess { response in
        do {
          guard let instances = response.reservations?.first?.instances else { return }
          for instance in instances {
            print(instance.keyName!)
          }
          store.updateInstances()
        }
      }
    } catch {
      print(error)
    }
  }
}

struct EC2List: View {
  @EnvironmentObject var store: ECStore
  @State var pageListener = EC2PageListener()

  var body: some View {
    List(store.instances) { instance in
      VStack(alignment: .leading) {
        Text(instance.name)
        Text(instance.status.string)
          .color(instance.status.color)
      }
    }.onAppear {
      self.pageListener.loadPage(store: self.store)
    }
  }
}

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
