//
//  EC2List.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/7/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

struct EC2List: View {
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
