//
//  CloudyCider.swift
//  CloudyCider
//
//  Created by Max Desiatov on 04/05/2019.
//  Copyright © 2019 CloudyCider. All rights reserved.
//

import ECS

let ecs = ECS(
  accessKeyId: "key_id",
  secretAccessKey: "access_key",
  region: .useast1,
  endpoint: nil
)

let tasks = try ecs.listTasks(.init(cluster: "support")).wait()

let req = ECS.RegisterTaskDefinitionRequest(containerDefinitions: [.init(
  image: "postgres:11.2-alpine",
  memoryReservation: 128,
  name: "postgres"
)], family: "postgres")

let psqlTask = try ecs.runTask(.init(cluster: "support", taskDefinition: "postgres:1")).wait()

let psqlTask = try ecs.registerTaskDefinition(req).wait()

print(psqlTask)
