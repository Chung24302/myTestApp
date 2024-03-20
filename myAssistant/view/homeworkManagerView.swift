//
//  homeworkManagerView.swift
//  myAssistant
//
//  Created by 蔡忠良 on 2024/3/2.
//

import SwiftUI

let mynumber =  [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                21, 22, 24, 25, 26, 27, 28
]
/*
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
 
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 2)
                .frame(width: 25, height: 25)
                .cornerRadius(5.0)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
 
            configuration.label
 
        }
    }
}
*/




struct homeworkSubmit:View {
    @State private var isChecked = false
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    var body: some View{
        
        
        
        ScrollView(.vertical,showsIndicators: false){
            VStack{
                /*ForEach(mynumber, id: \.self){ idx in
                    Text("\(idx)")
                        .frame(alignment: .center)
                        .padding()
                        .overlay(
                                Circle()
                                .stroke(Color.orange, lineWidth: 4)
                                .padding(6)
                            )
                }*/
                
                Circle()
                    .frame(width: 20, height: 20)
                    //Color.pink
                // 可拖拉 動畫
                    .offset(x: position.width + dragOffset.width, y: position.height+dragOffset.height
                         
                    )
                    .animation(.easeInOut, value: dragOffset)
                    .gesture(
                DragGesture()
                    .updating($dragOffset, body: { (value, state, transaction) in

                                            state = value.translation
                                        })
                                        .onEnded({ (value) in
                                                            self.position.height += value.translation.height
                                                            self.position.width += value.translation.width
                                                        })
                                )
                //Text("作業名稱")
                //Text("繳交狀況")
                
                //Spacer()
                
            }
            // 設定 VStack 大小
            .frame(/*
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,*/
                    width: 500,
                    height: 500,
                    alignment: .topLeading
                )
            .padding()
            .border(Color.red)
            
        }
        VStack{
            Circle()
                .frame(width: 20, height: 20)
                //Color.pink
            // 可拖拉 動畫
                .offset(x: position.width+dragOffset.width, y: position.height+dragOffset.height)
                .animation(.easeInOut, value: dragOffset)
                .gesture(
            DragGesture()
                .updating($dragOffset, body: { (value, state, transaction) in

                                        state = value.translation
                                    })
                .onEnded({ (value) in
                    self.position.height += value.translation.height
                    self.position.width += value.translation.width
                                                    }))
        }
        
        
    }
}


struct homeworkRevisionQuery:View {
    var body: some View{
        Button("HWQuery") {
        }
    }
}

struct homeWorkMissingDeliveryQuery:View {
    var body: some View{
        Button("HWMDQuery") {
        }
    }
}

struct noticesDeliverySubmit:View {
    var body: some View{
        Button("noticesSubmit") {
        }
    }
}

struct noticesMissingDeliveryQuery:View {
    var body: some View{
        Button("noticesQuery") {
        }
    }
}

