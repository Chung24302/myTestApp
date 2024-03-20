//
//  dataStruct.swift
//  myAssistant
//
//  Created by 蔡忠良 on 2024/3/2.
//

import Foundation
struct MenuItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    //var image: String
    var subMenuItems: [MenuItem]?
}
let homeworkManager = [
    MenuItem(name:"作業繳交上傳"),
    MenuItem(name:"作業訂正查詢"),
    MenuItem(name:"作業缺交查詢"),
    MenuItem(name:"通知單相關繳交上傳"),
    MenuItem(name:"通知單缺交查詢")
]
let gradeManager = [
    MenuItem(name:"平時成績上傳"),
    MenuItem(name:"上課表現上傳"),
    MenuItem(name:"段考成績上傳"),
]
let systemMenuItems =  [
    MenuItem(name:"班級及學生管理"),
    MenuItem(name:"輸出檔案"),
    MenuItem(name:"登出")
]
struct systemManagerModel {
   
    
    
    let mainMenuItems = {
            // Top menu items
        let topMenuItems = [
            MenuItem(name: "作業管理",  subMenuItems: homeworkManager),
            MenuItem(name: "成績管理",  subMenuItems: gradeManager),
            MenuItem(name: "系統管理",  subMenuItems: systemMenuItems)
        ]
        

            return topMenuItems
        }()
    
    func subMenuItems(for id: MenuItem.ID) -> [MenuItem]? {
            guard let menuItem = mainMenuItems.first(where: { $0.id == id }) else {
                return nil
            }

            return menuItem.subMenuItems
        }
    
    
    func menuItem(for categoryID: MenuItem.ID, itemID: MenuItem.ID) -> MenuItem? {

            guard let subMenuItems = subMenuItems(for: categoryID) else {
                return nil
            }

            guard let menuItem = subMenuItems.first(where: { $0.id == itemID }) else {
                return nil
            }

            return menuItem
        }
    
}
