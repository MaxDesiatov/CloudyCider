//
//  EC2InstanceView.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/10/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

struct EC2InstanceView: View {
  let instance: EC2Instance

  var body: some View {
    VStack {
      Text(instance.name)
      Text(instance.status.description)
        .foregroundColor(instance.status.color)
    }
  }
}
