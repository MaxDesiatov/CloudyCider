//
//  EC2List.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/7/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

struct EC2List: View {
    @EnvironmentObject var store: EC2Store
    @State var pageListener = EC2PageListener()
    
    var body: some View {
        HStack() {
            if store.instances.isEmpty {
                Text("There are no instance on EC2. Try to create at least one.")
            } else {
                List(store.instances) { instance in
                    VStack(alignment: .leading) {
                        Text(instance.name)
                        Text(instance.status.string)
                            .color(instance.status.color)
                    }
                }
            }
            }.onAppear {
                self.pageListener.loadPage(store: self.store)
        }
    }
}

