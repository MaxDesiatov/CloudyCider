//
//  View.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/10/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

extension View {
  // Returns a type-erased version of the view.
  public var typeErased: AnyView { AnyView(self) }
}
