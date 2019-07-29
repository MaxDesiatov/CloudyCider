//
//  HomeScreen.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/23/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

// MARK: - Shared View

struct HomeView: View {
  #if targetEnvironment(macCatalyst)
  var body: some View {
    DesktopView()
  }

  #else
  var body: some View {
    MobileView()
  }
  #endif
}

// MARK: - iOS implementation

struct MobileView: View {
  var body: some View {
    Text("")
  }
}

// MARK: - MacOS implementation

struct DesktopView: View {
  @EnvironmentObject var settings: UserSettings
  @EnvironmentObject var ec2Store: EC2Store

  var body: some View {
    VStack(alignment: .leading) {
      HStack(alignment: .top) {
        Spacer()
        NavView().padding(.init(top: 10, leading: 0, bottom: 0, trailing: 10))
      }
      HStack(alignment: .bottom) {
        EC2Screen()
          .environmentObject(self.settings)
          .environmentObject(self.ec2Store)
          .padding(.init(top: 0, leading: 10, bottom: 10, trailing: 10))
      }
      Spacer()
    }.onAppear {
      do {
        // optimize code that will fetch data on init
        if let accessKeyId = try self.settings.keychainAPI.get(key: .accessKeyId),
          let secretAccessKey = try self.settings.keychainAPI.get(key: .secretAccessKey) {
          self.ec2Store.loadPage(
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey
          )
        }
      } catch {
        print(error)
      }
    }
  }
}
