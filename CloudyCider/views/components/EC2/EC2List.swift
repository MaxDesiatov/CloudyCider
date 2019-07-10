//
//  EC2List.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/7/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

extension View {
  /// Returns a type-erased version of the view.
  public var typeErased: AnyView { AnyView(self) }
}

struct EC2Screen: View {
  @ObjectBinding var store: EC2Store

  var body: some View {
    EC2List(result: store.result).onAppear {
      self.store.loadPage()
    }
  }
}

struct EC2InstanceView: View {
  let instance: EC2Instance

  var body: some View {
    VStack {
      Text(instance.name)
      Text(instance.status.description).color(instance.status.color)
    }
  }
}

private struct EC2List: View {
  let result: Result<[EC2Instance], Error>

  var body: some View {
    switch result {
    case let .failure(e):
      return ErrorView(error: e).typeErased
    case let .success(instances) where instances.isEmpty:
      return Text("There are no instances on the EC2. Try to create at least one.").typeErased
    case let .success(instances):
      return List {
        ForEach(instances) { instance in
          VStack(alignment: .leading) {
            Text(instance.name)
            Text(instance.status.description)
              .color(instance.status.color)
          }
        }
      }.typeErased
    }
  }
}
