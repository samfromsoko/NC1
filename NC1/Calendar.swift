//
//  ContentView.swift
//  NC1
//
//  Created by Sujin Park on 4/16/24.
//

import SwiftUI

struct Calendar: View {
//    @State var showSheet: Bool = false //타입추론 bool 빼도 됨
    //@StateObject var diaryList = DiaryList()
    @State private var selectedSegment = 0
    let segmentTitles = ["Top 3", "Try"]
    let imageNames = ["image1.jpg", "image2.jpg", "image3.jpg"]
    let daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"]
    @EnvironmentObject var todoList: ListViewModel
    @State var tmpTop3:[ListItem] = []
    
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: SheetView()){
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .clipShape(Circle())
                            .shadow(radius: 2)
                    }
//                    Button(action: {
////                        showSheet = true
//                    }) {
//                        Image(systemName: "plus")
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.black)
//                            .clipShape(Circle())
//                            .shadow(radius: 2)
//                    }
//                    .padding()
                
            }
            //            if showSheet {
            //                SheetView(showSheet: $showSheet)
//            .sheet(isPresented: $showSheet) {
//                SheetView(showSheet: $showSheet)
            }
            
            VStack(alignment: .center) {
                Image("Main")
                    .resizable() //먼저 와야 함.. 왜냐면 먼저 명령을 때려야...
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                
                Text("4월")
                
                // 요일 제목
                HStack {
                    ForEach(daysOfWeek, id: \.self) { day in
                        Text(day)
                            .frame(width: 40, height: 50, alignment: .center)
                    }
                }
                
                // 날짜 표시
                ForEach(0..<5) { week in // 5주 가정
                    HStack {
                        ForEach(0..<7) { dayIndex in
                            let dayNumber = week * 7 + dayIndex - (daysOfWeek.firstIndex(of: "월") ?? 0) + 1
                            if dayNumber > 0 && dayNumber <= 30 {
                                Text("\(dayNumber)")
                                    .frame(width: 40, height: 50, alignment: .center)
                            } else {
                                Text("") // 빈 칸 처리
                                    .frame(width: 40, height: 50, alignment: .center)
                            }
                        }
                    }
                }
                Divider()
                Picker("Select", selection: $selectedSegment) {
                    ForEach(0..<segmentTitles.count, id: \.self) { index in
                        Text(self.segmentTitles[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // 선택된 세그먼트에 따라 다른 뷰를 표시
                
                if selectedSegment == 0 {
                    
                        List{
                            ForEach(tmpTop3,id: \.self){ data in
                                Text("\(data.title)와 \(data.count)")
                                
                            }
                        }
                    
                    

                } else {
                    Text("New items displayed here")
                }
            }
            
        }
        .onAppear(){
            
            
            tmpTop3=todoList.top3()
            print("top3:\(tmpTop3)")
        }
        
        
        
    }
    
}
    
    #Preview {
        Calendar()
    }
