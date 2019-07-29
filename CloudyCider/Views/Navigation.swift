//
//  Navigation.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/29/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

struct NavView: View {
  @State var isPresented = false

  // The environment object is reachable only with explicit passing to SettingsScreen.
  // This might be because of SettingsScreen position inside modal.
  @EnvironmentObject var settings: UserSettings

  var body: some View {
    HStack(alignment: .center) {
      Button(action: { self.isPresented.toggle() }) {
        Image(systemName: "gear")
      }.sheet(isPresented: $isPresented, content: {
        VStack(alignment: .trailing) {
          Button(action: { self.isPresented.toggle() }) {
            Image(systemName: "multiply.circle")
          }.padding(.init(top: 10, leading: 0, bottom: 0, trailing: 10))
          SettingsScreen().environmentObject(self.settings)
        }
      })
    }.frame(width: 15, height: 15)
  }
}
