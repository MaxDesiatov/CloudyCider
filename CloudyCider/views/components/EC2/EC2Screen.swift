//
//  EC2Screen.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/10/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import SwiftUI

struct EC2Screen: View {
    @ObjectBinding var store: EC2Store
    
    var body: some View {
        EC2List(result: store.result).onAppear {
            self.store.loadPage()
        }
    }
}
