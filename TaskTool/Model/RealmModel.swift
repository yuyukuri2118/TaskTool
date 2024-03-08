//
//  RealmModel.swift
//  TaskTool
//
//  Created by aijus on 2023/10/03.
//

import RealmSwift

class TasksDB: Object, Identifiable, Codable{
    @objc dynamic var id = 0
    @objc dynamic var taskTitle = ""
    @objc dynamic var taskDate = Date()
    @objc dynamic var taskColor = 0
    @objc dynamic var taskPriority = 0
    @objc dynamic var isTaskUpdata = false
    // 主キーを使うと、データの更新や削除に便利
    override static func primaryKey() -> String? {
        "id"
    }
}

struct TasksData: Identifiable{
    let id: Int
    let taskTitle: String
    let taskDate: Date
    let taskColor: Int
    let taskPriority: Int
    var isTaskUpdata: Bool
}


extension TasksData {
    init(TasksDB: TasksDB) {
        id = TasksDB.id
        taskTitle = TasksDB.taskTitle
        taskDate = TasksDB.taskDate
        taskColor = TasksDB.taskColor
        taskPriority = TasksDB.taskPriority
        isTaskUpdata = TasksDB.isTaskUpdata
    }
}
