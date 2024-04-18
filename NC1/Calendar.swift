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
    @State var tmpTry3:[ListItem] = []
    
    
    var body: some View {
        ZStack {
            VStack(alignment: .center){
                Image("Main")
                    .resizable() //먼저 와야 함.. 왜냐면 먼저 명령을 때려야...
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                
                Text("4월")
                    .font(.largeTitle)
                Divider()
                VStack{
                    VStack {
                        Picker("Select", selection: $selectedSegment) {
                            Text("Top").tag(0)
                            Text("Try").tag(1)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        .onChange(of:selectedSegment){ newValue in
                            if newValue == 1{
                                tmpTry3 = todoList.try3()
                            }
                            
                        }
                        
                        if selectedSegment == 0 {
                            List {
                                if tmpTop3.isEmpty {
                                    Text("+ 버튼을 통해 추가해주세요.")
                                        .foregroundColor(.black)
                                } else {
                                    ForEach(tmpTop3, id: \.self) { data in
                                        Text("\(data.title), \(data.count)회 실천")
                                    }
                                }
                            }
                            .listStyle(.plain)
                        } else {
                            List {
                                if tmpTry3.isEmpty {
                                    Text("박박적")
                                        .foregroundColor(.gray)
                                } else {
                                    ForEach(tmpTry3.prefix(3), id: \.self) { data in
                                        Text("\(data.title) 해보슈")
                                    }
                                }
                            }
                            .listStyle(.plain)

                            
                        }
                        
                        
                    }
                    
                    
                }
                .onAppear {
                    loadData()
                }
            }
            
            
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
                }
                
            }
            
            .padding()
            
            
        }
        
        
    }
    func loadData() {
        if selectedSegment == 0 {
            tmpTop3 = todoList.ranking()
        } else {
            tmpTry3 = todoList.try3()
        }
        print("Selected Segment: \(selectedSegment)")
        print("listHistory:\(todoList.listHistory)")
        print("Top 3: \(tmpTop3)")
        print("Try: \(tmpTry3)")
        print("\(selectedSegment)")
    }
}
//    #Preview {
//        Calendar()
//    }

