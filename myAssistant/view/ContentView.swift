//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Tim Condon on 14/02/2023.
//
import SwiftUI
var temp = ""
//---目錄結構

/*private let  assistantMenu = [
    "作業管理","成績管理","A",
]*/


struct ContentView: View {
    @State private var columnVisibility = NavigationSplitViewVisibility.detailOnly
    @State private var selectedItem: MenuItem?
    @State private var selectedCategoryId: MenuItem.ID?
    
    private var dataModel = systemManagerModel()
    var body: some View {
        NavigationSplitView {
            List(dataModel.mainMenuItems, selection: $selectedCategoryId) { item in
                
                HStack {
                    
                    Text(item.name)
                        
                        .font(.system(.title3, design: .rounded))
                        .bold()
                }
                
            }
            
            .navigationTitle("HOME")
            //.navigationSplitViewColumnWidth(150)
        }
    content: {
        
        
        if let selectedCategoryId,
           let subMenuItems = dataModel.subMenuItems(for: selectedCategoryId) {
            List(subMenuItems, selection: $selectedItem) { item in
                NavigationLink(value: item) {
                    HStack {
                        
                        Text(item.name)
                            .font(.system(.title3, design: .rounded))
                            .bold()
                    }
                }
            }
            //.listStyle(.plain)
            //.navigationBarTitleDisplayMode(.inline)
            //.navigationSplitViewColumnWidth(300)
            
        }
        
      // Sub menu
    }
    
    
    
    detail: {
                 
                if let selectedItem {
                    switch (selectedItem.name){
                    case "作業繳交上傳":
                        mmContentView()
                        //homeworkSubmit()
                    case "作業訂正查詢":
                        homeworkRevisionQuery()
                    case "作業缺交查詢":
                        homeWorkMissingDeliveryQuery()
                    case "通知單相關繳交上傳":
                        noticesDeliverySubmit()
                    case "通知單缺交查詢":
                        noticesMissingDeliveryQuery()
                    case "平時成績上傳":
                        dailyResultsUpload()
                        
                    case "上課表現上傳":
                        classPerformanceUpload()
                        
                    case "段考成績上傳":
                        testScoresUpload()
                    case "班級及學生管理":
                        ClassAndStudentManager()
                        
                    case "輸出檔案":
                        
                        OutputFiles()
                    case "登出" :
                        
                        logOut()
                        
                    default:
                            Text("aa")
                    }
                    
                            } else {
                                Text("Please select an item")
                            }
            
                }
    
    }
}//Contentview end

 


/*
 
 homeworkRevisionQuery
 homeWorkMissingDeliveryQuery
 
 noticesDeliverySubmit
 noticesMissingDeliveryQuery
 
 dailyResultsUpload
 classPerformanceUpload
 testScoresUpload
 
 ClassAndStudentManager
 OutputFiles
 logOut
 
 
 
 
 */








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
    
}
