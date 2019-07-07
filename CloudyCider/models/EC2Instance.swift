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

struct EC2Instance: Identifiable {
  var id = UUID()
  var name: String
  var status: InstanceState
}
