//
//  RealmViewModel.swift
//  TaskTool
//
//  Created by aijus on 2023/10/03.
//

import RealmSwift
import SwiftUI

final class Task: ObservableObject {

    private var clotheResults: Results<TasksDB> = {
        guard let realm = try? Realm() else {
            fatalError("Failed to create Realm instance")
        }
        return realm.objects(TasksDB.self)
    }()
    
    var items: [TasksData] {
        clotheResults.map(TasksData.init)
    }
    
    private func handleRealmError(_ error: Error) {
        print(error.localizedDescription)
    }
}

extension Task {
    //MARK: データを追加
    func create(taskTitle: String, taskDate: String, taskTime: String, taskColor: Int, taskPriority: Int) {
        objectWillChange.send()
        do {
            let realm = try Realm()
            let tasksDB = TasksDB()
            tasksDB.id = UUID().hashValue
            tasksDB.taskTitle = taskTitle
            tasksDB.taskDate = taskDate
            tasksDB.taskTime = taskTime
            tasksDB.taskColor = taskColor
            tasksDB.taskPriority = taskPriority
                
            try realm.write {
                realm.add(tasksDB)
            }
            
        } catch let error {
            handleRealmError(error)
        }
    }
    
//    func findById(itemName: Int) -> Results<TasksDB> {
//        let realm = try! Realm()
//        let tasks = realm.objects(TasksDB.self).filter("id == %@", itemName)
//        return tasks
//    }
//    func getSortedClothes(word: String, sort: String ,categoryName: String) -> Results<TasksDB> {
//        var a = false
//        var sortName = ""
//        var category = ""
//        let realm = try! Realm()
//        var clothes = realm.objects(TasksDB.self)
//        if sort == "古い順" {
//            a = true
//            sortName = "nowState"
//        } else if sort == "五十音順" {
//            sortName = "itemName"
//            a = true
//        } else {
//            sortName = "nowState"
//        }
//        
//        if categoryName == "全て" {
//            if (word == "" || word == " ") {
//                clothes = realm.objects(TasksDB.self).sorted(byKeyPath: "\(sortName)", ascending: a)
//            } else {
//                clothes = realm.objects(TasksDB.self).filter("brandName CONTAINS[c] %@ OR itemName CONTAINS[c] %@", word, word).sorted(byKeyPath: "\(sortName)", ascending: a)
//            }
//        } else {
//            if (word == "" || word == " ") {
//                clothes = realm.objects(TasksDB.self).filter("categoryName == %@", categoryName).sorted(byKeyPath: "\(sortName)", ascending: a)
//            } else {
//                clothes = realm.objects(TasksDB.self).filter("(brandName CONTAINS[c] %@ OR itemName CONTAINS[c] %@) AND categoryName == %@", word, word, categoryName).sorted(byKeyPath: "\(sortName)", ascending: a)
//            }
//        }
//                    
//        
//        //let clothes = realm.objects(ClothesDB.self).sorted(byKeyPath: "\(sortName)", ascending: a)
//        return clothes
//    }
//    
//    //MARK: -  データを更新
//    func update(itemID: Int, brandName: String, itemName: String, categoryName: String, itemToggle: Bool) {
//        objectWillChange.send()
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.create(TasksDB.self,
//                             value: ["id": itemID,
//                                     "brandName": brandName,
//                                     "itemName": itemName,
//                                     "categoryName": categoryName,
//                                     "isOnMain": itemToggle
//                                    ],
//                             update: .modified)
//            }
//        } catch let error {
//            handleRealmError(error)
//        }
//    }
//    
//    //MARK: -  データを削除
//    func delete(itemID: Int) {
//        objectWillChange.send()
//        guard let clothesDB = clotheResults.first(where: { $0.id == itemID})
//        else {
//            return
//        }
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.delete(clothesDB)
//            }
//        } catch let error {
//            handleRealmError(error)
//            print(error.localizedDescription)
//        }
//    }
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
