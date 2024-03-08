//
//  RealmViewModel.swift
//  TaskTool
//
//  Created by aijus on 2023/10/03.
//

import RealmSwift
import SwiftUI
let realm = try! Realm()

final class Task: ObservableObject {
    
    private var taskResults: Results<TasksDB> = {
        guard let realm = try? Realm() else {
            fatalError("Failed to create Realm instance")
        }
        return realm.objects(TasksDB.self)
    }()
    var items: [TasksData] {
        taskResults.map(TasksData.init)
    }
    
    private func handleRealmError(_ error: Error) {
        print(error.localizedDescription)
    }
    private var token: NotificationToken?
    let results: RealmSwift.Results<TasksDB> = realm.objects(TasksDB.self)
    
    init() {
        // 最初の一回しか呼ばれない
        token = results.observe { [self] _ in
            // データ変更が起こったときに実行される
            objectWillChange.send()
        }
    }
}

extension Task {
    //MARK: データを追加
    func create(taskTitle: String, taskDate: Date, taskColor: Int, taskPriority: Int) {
        objectWillChange.send()
        do {
            let realm = try Realm()
            let tasksDB = TasksDB()
            tasksDB.id = UUID().hashValue
            tasksDB.taskTitle = taskTitle
            tasksDB.taskDate = taskDate
            tasksDB.taskColor = taskColor
            tasksDB.taskPriority = taskPriority
            tasksDB.isTaskUpdata = false
            
            try realm.write {
                realm.add(tasksDB)
            }
            
        } catch let error {
            handleRealmError(error)
        }
    }
    
    func getSortedClothes(narrowDown: String, sort: String) -> Results<TasksDB> {
        let realm = try! Realm()
        var tasks = realm.objects(TasksDB.self)
        
        let currentDate: Date = Date()
        if narrowDown == "全て" {
            if sort == "日付順" {
                tasks = realm.objects(TasksDB.self).sorted(by: [
                    SortDescriptor(keyPath: "taskDate", ascending: true)
                ])
            } else if sort == "重要度順" {
                tasks = realm.objects(TasksDB.self).sorted(by: [
                    SortDescriptor(keyPath: "taskPriority", ascending: false),
                    SortDescriptor(keyPath: "taskDate", ascending: true)])
            }
        } else if narrowDown == "未完了" {
            if sort == "日付順" {
                tasks = realm.objects(TasksDB.self)
                    .where({ $0.isTaskUpdata == false })
                    .sorted(by: [
                        SortDescriptor(keyPath: "taskDate", ascending: true)
                    ])
            } else if sort == "重要度順" {
                tasks = realm.objects(TasksDB.self)
                    .where({ $0.isTaskUpdata == false })
                    .sorted(by: [
                        SortDescriptor(keyPath: "taskPriority", ascending: false),
                        SortDescriptor(keyPath: "taskDate", ascending: true)
                    ])
            }
        } else if narrowDown == "完了" {
            if sort == "日付順" {
                tasks = realm.objects(TasksDB.self)
                    .where({ $0.isTaskUpdata == true })
                    .sorted(by: [
                        SortDescriptor(keyPath: "taskDate", ascending: true)
                    ])
            } else if sort == "重要度順" {
                tasks = realm.objects(TasksDB.self)
                    .where({ $0.isTaskUpdata == true })
                    .sorted(by: [
                        SortDescriptor(keyPath: "taskPriority", ascending: false),
                        SortDescriptor(keyPath: "taskDate", ascending: true)
                    ])
            }
        }
        return tasks
    }
    
    //MARK: -  データを更新
    func update(itemID: Int, brandName: String, itemName: String, categoryName: String, itemToggle: Bool) {
        objectWillChange.send()
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(TasksDB.self,
                             value: ["id": itemID,
                                     "brandName": brandName,
                                     "itemName": itemName,
                                     "categoryName": categoryName,
                                     "isOnMain": itemToggle
                                    ],
                             update: .modified)
            }
        } catch let error {
            handleRealmError(error)
        }
    }
    
    //MARK: -  更新モード
    func isTaskUpdataToggle(taskId: Int, isTaskUpdata: Bool) {
        objectWillChange.send()
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(TasksDB.self,
                             value: [
                                "id": taskId,
                                "isTaskUpdata": !isTaskUpdata
                                    ],
                             update: .modified)
            }
        } catch let error {
            handleRealmError(error)
        }
    }
    
    //    //MARK: -  データを削除
    func delete(itemID: Int) {
        objectWillChange.send()
        guard let TasksDB = taskResults.first(where: { $0.id == itemID})
        else {
            return
        }
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(TasksDB)
            }
        } catch let error {
            handleRealmError(error)
            print(error.localizedDescription)
        }
    }
    //
    //    //MARK: - データを全削除
    //    func deleteAll() {
    //        objectWillChange.send()
    //
    //        do {
    //            let realm = try Realm()
    //            try realm.write {
    //                realm.deleteAll()
    //            }
    //        } catch let error {
    //            print(error.localizedDescription)
    //        }
    //    }
}
