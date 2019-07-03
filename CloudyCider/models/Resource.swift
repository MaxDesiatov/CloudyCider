//
//  Resource.swift
//  CloudyCider
//
//  Created by Matvii Hodovaniuk on 7/3/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

final class Resource<A>: BindableObject {
  // Workaround for initialization
  private(set) var didChange: AnyPublisher<A?, Never> = Publishers.Empty().eraseToAnyPublisher()

  let subject = PassthroughSubject<A?, Never>()
  let endpoint: Endpoint<A>
  var firstSubscriber: Bool = true

  var value: A? {
    didSet {
      DispatchQueue.main.async {
        self.subject.send(self.value)
      }
    }
  }

  init(endpoint: Endpoint<A>) {
    self.endpoint = endpoint
    didChange = subject.handleEvents(receiveSubscription: { [weak self] _ in
      guard let s = self, s.firstSubscriber else { return }
      s.firstSubscriber = false
      s.reload()
    }).eraseToAnyPublisher()
  }

  func reload() {
    URLSession.shared.load(endpoint) { result in
      self.value = try? result.get()
    }
  }
}
