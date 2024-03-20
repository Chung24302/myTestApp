//
//  myTestCode.swift
//  myAssistant
//
//  Created by Chung on 2024/3/6.
//
import Foundation
import SwiftUI
struct BallData {
    //var numbersId =
    var number = Int()
    var position = CGPoint()
    
    //var color: Color = .blue
}
var ballStatuses: [Int: String] = [:]


func myBalls(Numbers: Int,imageWidth:CGFloat,imageHeight:CGFloat,position:Binding<CGPoint>) -> some View{
    return Text(String(Numbers))
        .foregroundColor(.pink)
    //.fill(.black)
        
        .border(.yellow, width: 1.0)
        .contentShape(Circle())
        .frame(width: 50, height: 50)
        .position(position.wrappedValue)
        .gesture(
            DragGesture()
                .onChanged { value in
                    // limit movement to min and max value
                    let limitedX = max(min(value.location.x, imageWidth - imageWidth/100), imageWidth / 100)
                    let limitedY = max(min(value.location.y, imageHeight - imageHeight / 100), imageHeight/100)
                    
                    position.wrappedValue = CGPoint(x: limitedX,
                                            y: limitedY)
                }
        )
}
    
    


struct mmContentView: View {
    
        let submitted = "已繳交"
        let notSubmitted = "未繳交"
        let revised = "訂正"
    
    //@State public var ballposition = CGPoint(x: 20, y: 260)
    @State private var balls: [BallData] = []
   // @State public var ballStatuses: [Int: String] = [:]
    init() {
            var ballsArray: [BallData] = []
            var temp = 1
            for i in 1..<28 {
                if ( i != 0 && i % 7 == 0 && i != 23){
                    temp += 1
                }
                ballsArray.append(BallData(number: i, position: CGPoint(x: CGFloat( ((i % 7 )  * 50) + 50 ), y: CGFloat(temp * 30 + 250))))
            }
            self._balls = State(initialValue: ballsArray)
            for i in 1..<28 {
                if (i != 23){
                    ballStatuses[i] = submitted
                }
                    
            }
        }
    public var imageW: CGFloat = 600
    public var imageH: CGFloat = 400
    private var imageX: CGFloat = 0
    private var imageY: CGFloat = 0
    @State private var toDay = Date.now
    @State private var hwInfoName = ""
    @State private var showSheet = false
    var body: some View {
        
        
        
        VStack(alignment: .leading){
           
            DatePicker(selection: $toDay, displayedComponents:  .date, label: { Text("Date :") })
                .frame(width: 300, height: 40)
            
            Text("作業名稱 :")
            TextField("請輸入作業名稱", text: $hwInfoName)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/,width: 2.0)
                .frame(width: 300,height: 50)
            Button("登錄上傳") {
                showSheet.toggle()
            }.padding(.leading,220)
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $showSheet) {
                Text( "\(ballStatuses[1] ?? "No data")").presentationDetents([.medium, .large])
                    Button("確認"){
                    
                }
                        
                }
            
        }//VStack END
        .frame(width: 400, height: 300)
        .border(.black, width: 6.0)
        ZStack(alignment: .top){
            Image("Area")
                    .resizable()
                    .frame(width: 600, height: 400)
                    .overlay(ForEach(balls.indices, id: \.self) { index in
                        ZStack {
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: 25, height: 25)
                                .position(balls[index].position)
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            let limitedX = max(min(value.location.x, imageW - imageW / 100), imageW / 100)
                                            let limitedY = max(min(value.location.y, imageH - imageH / 100), imageH / 100)
                                            balls[index].position = CGPoint(x: limitedX, y: limitedY)
                                            if limitedY > 140 {
                                                ballStatuses[balls[index].number] = submitted
                                                } else {
                                                    if limitedX < 135 {
                                                        ballStatuses[balls[index].number] = notSubmitted
                                                    }else{
                                                        ballStatuses[balls[index].number] = revised
                                                    }
                                                    
                                                }
                                            
                                            print("\(type(of: ballStatuses[1]))")

                                                                            
                                        }
                                )
                            Text(String(balls[index].number))
                                .foregroundColor(.pink)
                                .position(balls[index].position)
                        }
                    })
                
            
        
        }//Zstack end*/
            
        
                 
    }//body end
}

#Preview {
    mmContentView()
}

