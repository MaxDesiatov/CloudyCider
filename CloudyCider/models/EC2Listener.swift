//
//  EC2Listener.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/7/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

class EC2Listener {
    var currentPage: Int = 1 {
        didSet {
            loadPage()
        }
    }
    
    func loadPage() {}
}
