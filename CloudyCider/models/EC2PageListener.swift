//
//  EC2PageListener.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/7/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import EC2

final class EC2PageListener: EC2Listener {
    func loadPage(store: EC2Store) {
        // MARK: - EC2Init
        
        let accessKeyId = "AKIA2VSQ64GBSMZGGL4Y"
        let secretAccessKey = "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"
        let ec2 = EC2(
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey,
            region: .euwest2
        )
        let instanceRequest = EC2.DescribeInstancesRequest()
        do {
            try ec2.describeInstances(instanceRequest).whenComplete { response in
                do {
                    guard let reservations = try response.get().reservations else { return }
                    
                    // create temp storage for instances list
                    var nextStoreInstances: [EC2Instance] = []
                    
                    for reservation in reservations {
                        guard let instances = reservation.instances else { return }
                        
                        for instance in instances {
                            // get instance state
                            guard let state = instance.state else { return }
                            guard let status = state.code else { return }
                            
                            // get instance name
                            guard let tags = instance.tags else { return }
                            let nameTag = tags.filter { $0.key == "Name" }[0]
                            guard let name = nameTag.value else { return }
                            
                            // add new instance information to list
                            let instanceInformation = EC2Instance(name: name, status: InstanceState(status))
                            nextStoreInstances.append(instanceInformation)
                        }
                    }
                    // replace old instances list with new
                    store.instances = nextStoreInstances
                } catch {
                    print(error)
                }
            }
        } catch {
            print(error)
        }
    }
}

