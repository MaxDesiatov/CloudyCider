//
//  ErrorView.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/9/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import AWSSDKSwiftCore
import SwiftUI

struct ErrorView: View {
  let error: Error

  var body: some View {
    let errorText: String
    switch error {
    case let e as AWSError:
      errorText = e.rawBody
    default:
      errorText = error.localizedDescription
    }

    return Text("There is an error when attempting to request data from EC2: \(errorText)")
      .color(.red)
      .lineLimit(nil)
  }
}
