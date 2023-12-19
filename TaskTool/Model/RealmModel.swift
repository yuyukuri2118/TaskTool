//
//  RealmModel.swift
//  TaskTool
//
//  Created by aijus on 2023/10/03.
//

import RealmSwift

class TasksDB: Object {
    @objc dynamic var id = 0
    @objc dynamic var taskTitle = ""
    @objc dynamic var taskDate = ""
    @objc dynamic var taskTime = ""
    @objc dynamic var taskColor = 0
    @objc dynamic var taskPriority = 0
    // 主キーを使うと、データの更新や削除に便利
    override static func primaryKey() -> String? {
        "id"
    }
}

struct TasksData: Identifiable{
    let id: Int
    let taskTitle: String
    let taskDate: String
    let taskTime: String
    let taskColor: Int
    var taskPriority: Int
}


extension TasksData {
    init(TasksDB: TasksDB) {
        id = TasksDB.id
        taskTitle = TasksDB.taskTitle
        taskDate = TasksDB.taskDate
        taskTime = TasksDB.taskTime
        taskColor = TasksDB.taskColor
        taskPriority = TasksDB.taskPriority
    }
}
