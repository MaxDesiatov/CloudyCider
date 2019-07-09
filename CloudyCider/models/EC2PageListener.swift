//
//  EC2PageListener.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/7/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import AWSSDKSwiftCore
import EC2
import Foundation

final class EC2PageListener: EC2Listener {
  func loadPage(store: EC2Store) {
    // MARK: - EC2Init

    let accessKeyId = ProcessInfo.processInfo.environment["accessKeyId"]
    let secretAccessKey = ProcessInfo.processInfo.environment["secretAccessKey"]
    let ec2 = EC2(
      accessKeyId: accessKeyId,
      secretAccessKey: secretAccessKey,
      region: .euwest2
    )
    let instanceRequest = EC2.DescribeInstancesRequest()
    do {
      try ec2.describeInstances(instanceRequest).whenComplete { response in
        do {
          let result = try response.get()
          guard let reservations = result.reservations else { return }

          // create temp storage for the instances list
          var nextStoreInstances: [EC2Instance] = []

          for reservation in reservations {
            guard let instances = reservation.instances else { return }

            for instance in instances {
              // get the instance state
              guard let state = instance.state,
                let statusName = state.name else { return }

              // get the instance name
              guard let tags = instance.tags else { return }
              let nameTag = tags.filter { $0.key == "Name" }[0]
              guard let name = nameTag.value else { return }

              // add new instance information to the list
              let instanceInformation = EC2Instance(name: name, status: statusName)
              nextStoreInstances.append(instanceInformation)
            }
          }
          // replace old instances list with the new one
          store.instances = nextStoreInstances
        } catch let error as AWSError {
          store.errorMessage = error.rawBody
        } catch {
          print(error)
          store.errorMessage = error.localizedDescription
        }
      }
    } catch {
      print(error)
      store.errorMessage = error.localizedDescription
    }
  }
}
