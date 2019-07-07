//
//  EC2Store.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/7/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI
import Combine

final class EC2Store: BindableObject {
    public let didChange = PassthroughSubject<(), Never>()
    public var instances: [EC2Instance] = [] {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send()
            }
        }
    }
}
