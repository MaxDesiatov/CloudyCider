//
//  EC2Screen.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/10/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

struct EC2Screen: View {
  @EnvironmentObject var ec2Store: EC2Store

  var body: some View {
    EC2List(result: ec2Store.result)
  }
}
