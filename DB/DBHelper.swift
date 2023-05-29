//
//  DBHelper.swift
//  Bookshop
//
//  Created by Chris on 2023/5/19.
//

import Foundation
import FMDB

class DBHelper {
    static let shared = DBHelper() // singleton pattern
    
    let databaseFileName = "MovieTicketsDataBase.sqlite"
    var pathToDatabase: String!
    var database: FMDatabase!
    
    private init() {
        // Set the database file path
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        pathToDatabase = documentsDirectory.appendingPathComponent(databaseFileName).path
    }
    
    func openDatabase(tableName:String) -> Bool {
        // Create database connection
        database = FMDatabase(path: pathToDatabase)
        
        // open database
        if database.open() {
            if database.tableExists(tableName) {
                    // The table already exists, execute the corresponding logic
                    print("表已存在")
                } else {
                    // The table does not exist, execute the table creation operation
                    print("表不存在，执行建表操作")
                    // Code for table creation
                    if tableName == "history" {
                        let query = createHistoryTable()
                        createTable(sqlQuery: query)
                    }
                }
            return true
        } else {
            print("无法打开数据库连接")
            return false
        }
    }
    
    // create table
    func createTable(sqlQuery: String) {
        if executeUpdate(query: sqlQuery, withArguments: nil) {
            print("表创建成功")
        } else {
            print("表创建失败")
        }
    }
    
    // Create a history order table
    func createHistoryTable() -> String {
        let tableName = "history"
        let query = "CREATE TABLE IF NOT EXISTS \(tableName) (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,imageName TEXT,price DOUBLE,date TEXT, startTime TEXT, endTime TEXT, buyTime TEXT, orderNum TEXT, row TEXT, num INTEGER)"
        return query
    }
    
    
    func closeDatabase() {
        // close database connection
        database.close()
    }
    
    // MARK: - 增删改查操作
    
    func executeQuery(query: String) -> FMResultSet? {
        // Execute query
        do {
            let resultSet = try database.executeQuery(query, values: nil)
            return resultSet
        } catch {
            print("查询失败：\(error.localizedDescription)")
            return nil
        }
    }
    
    func executeUpdate(query: String, withArguments arguments: [Any]?) -> Bool {
        // execute update statement
        do {
            try database.executeUpdate(query, values: arguments)
            return true
        } catch {
            print("更新失败：\(error.localizedDescription)")
            return false
        }
    }
    /**
     var timeslot:TimeSlot?
     var movieInfo:MovieInfo?
     var row:Int?
     var num:Int?
     
     let query = "CREATE TABLE IF NOT EXISTS \(tableName) (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,imageName TEXT,price DOUBLE,date TEXT, startTime TEXT, endTime TEXT, buyTime TEXT, orderNum TEXT)"

     */
    func insertHistoryData(timeslot:TimeSlot,
                        movieInfo:MovieInfo,
                        row:String,
                        num:Int
                    ) {
        let tableName = "history"
        if openDatabase(tableName: tableName) {
            let query = "INSERT INTO  \(tableName) (name, imageName, price, date, startTime, endTime, buyTime, orderNum, row, num ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            let randomInt = Int.random(in: 10000000...100000000)
            let arguments: [Any] = [movieInfo.title, movieInfo.imageName, timeslot.price, timeslot.date, timeslot.startTime, timeslot.endTime, getCurrentTime(), "\(randomInt)", row, num]
            
            if executeUpdate(query: query, withArguments: arguments) {
                print("插入成功")
            } else {
                print("插入失败")
            }
            closeDatabase()
        }
        
    }
    
    /**
     let query = "CREATE TABLE IF NOT EXISTS \(tableName) (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,imageName TEXT,price DOUBLE,date TEXT, startTime TEXT, endTime TEXT, buyTime TEXT, orderNum TEXT)"

     */
        func fetchHistoryData() -> [HistoryModel] {
            var dataList = [HistoryModel]()
            let tableName = "history"
            if openDatabase(tableName: tableName) {
                let query = "SELECT * FROM \(tableName)"
    
                if let resultSet = executeQuery(query: query) {
                    while resultSet.next() {
                        let name = resultSet.string(forColumn: "name") ?? ""
                        let imageName = resultSet.string(forColumn: "imageName") ?? ""
                        let price = resultSet.double(forColumn: "price")
                        let date = resultSet.string(forColumn: "date") ?? ""
                        let startTime = resultSet.string(forColumn: "startTime") ?? ""
                        let endTime = resultSet.string(forColumn: "endTime") ?? ""
                        let orderNum = resultSet.string(forColumn: "orderNum") ?? ""
                        let buyTime = resultSet.string(forColumn: "buyTime") ?? ""
                        let row = resultSet.string(forColumn: "row") ?? ""
                        let num = resultSet.int(forColumn: "num")


                        let data = HistoryModel(name: name, imageName: imageName, price: Double(price), date: date, startTime: startTime, endTime: endTime, buyTime: buyTime, orderNum: orderNum, row: row, num: Int(num))
                        dataList.append(data)
                    }
                }
                closeDatabase()
    
            }
    
            return dataList
        }
    
    func deleteHistoryData(orderNum:String) -> Bool {
            let tableName = "history"
            if openDatabase(tableName: tableName) {
                let query = "DELETE FROM \(tableName) WHERE orderNum = ?"
                let arguments: [Any] = [orderNum]
    
                if executeUpdate(query: query, withArguments: arguments) {
                    print("删除成功")
                    closeDatabase()
                    return true
                } else {
                    closeDatabase()
                    print("删除失败")
                    return false
                }
            }
            closeDatabase()
            return false
    
        }
    

    func getCurrentTime() -> String {
        let currentTime = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let formattedTime = dateFormatter.string(from: currentTime)
        return formattedTime
    }
}
