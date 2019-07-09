//
//  EC2List.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/7/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

struct EC2InstanceView: View {
  @ObjectBinding var instance: EC2Instance

  var body: some View {
    Text(instance.name)
    Text(instance.status.description)
      .color(instance.status.color)
  }
}

struct EC2List: View {
  @ObjectBinding var store: EC2Store
  @State var pageListener = EC2PageListener()

  var body: some View {
    HStack {
      store.errorMessage.map { error in
        Text("There is an error on the EC2. \(error)")
      } ?? store.instances.map { (instance: EC2Instance) -> EC2InstanceView in
        EC2InstanceView(instance)
      } ?? {
        Text("There are no instances on the EC2. Try to create at least one.")
      }
    }.onAppear {
      self.pageListener.loadPage(store: self.store)
    }
  }
}
