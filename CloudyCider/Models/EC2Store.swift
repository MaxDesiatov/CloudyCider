//
//  EC2Store.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/7/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import AWSSDKSwiftCore
import Combine
import EC2
import SwiftUI

final class EC2Store: ObservableObject {
  let willChange = PassthroughSubject<(), Never>()

  var result: Result<[EC2Instance], Error> = .success([]) {
    didSet {
      DispatchQueue.main.async {
        self.willChange.send()
      }
    }
  }

  func loadPage() {
    // MARK: - EC2Init

    let accessKeyId = ProcessInfo.processInfo.environment["accessKeyId"]
    let secretAccessKey = ProcessInfo.processInfo.environment["secretAccessKey"]
    let ec2 = EC2(
      accessKeyId: accessKeyId,
      secretAccessKey: secretAccessKey,
      region: .euwest2
    )
    let instancesRequest = EC2.DescribeInstancesRequest()
    do {
      try ec2.describeInstances(instancesRequest).whenComplete { response in
        do {
          guard let reservations = try response.get().reservations else { return }

          // create temp storage for the instances list
          var nextStoreInstances: [EC2Instance] = []

          for reservation in reservations {
            guard let instances = reservation.instances else { return }

            for instance in instances {
              // get the instance state and the instance name
              guard let state = instance.state,
                let statusName = state.name,
                let tags = instance.tags,
                let nameTag = tags.filter({ $0.key == "Name" }).first,
                let name = nameTag.value else { return }

              // add new instance information to the list
              let instanceInformation = EC2Instance(name: name, status: statusName)
              nextStoreInstances.append(instanceInformation)
            }
          }
          // replace old instances stored in store with with the new one fetched from aws
          self.result = .success(nextStoreInstances)
        } catch {
          print(error)
          self.result = .failure(error)
        }
      }
    } catch {
      print(error)
      result = .failure(error)
    }
  }
}
