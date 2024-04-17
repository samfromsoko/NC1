//
//  SheetView.swift
//  NC1
//
//  Created by Sujin Park on 4/16/24.
//

import SwiftUI

struct SheetView: View {
    @ObservedObject var viewModel = ContentViewModel()
//    @Binding var showSheet: Bool
    @State var count: Int = 0
    @EnvironmentObject var todoList:ListViewModel
    
    
    
    
    var body: some View {
        Button{
//            showSheet = false  // 닫기 버튼 클릭 시 모달 뷰 숨김
            print("hi")
        } label: {
            Image(systemName: "xmark")
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
        
        ScrollView {
            VStack {
                ForEach(todoList.listHistory, id: \.self) { listItem in
                    HStack{
                        Button(action: {
                            /* viewModel.*/
                            
                            todoList.listHistory[todoList.listHistory.firstIndex(of: listItem) ?? 0].count += 1
                            //                            viewModel.session.sendMessage(["count":  viewModel.count], replyHandler: nil)
                            print(todoList.listHistory)
                        }) {
                            HStack(alignment: .firstTextBaseline){
                                Image(systemName: listItem.iconName)
                                Text("\(listItem.title)")
                                
                            }                            .padding(16)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            
                            
                            
                            
                        }
                        Text(todoList.listHistory[todoList.listHistory.firstIndex(of: listItem) ?? 0].count.description)
                        //                        .padding(.horizontal, 20)
                    }
                    
                    
                }
                
                
            }
            .frame(width: 400)
            
        }
    }
}

//#Preview {
//    SheetView(showSheet: .constant(true))
//}

import WatchConnectivity

final class ContentViewModel: NSObject, WCSessionDelegate, ObservableObject {
    @Published var count: Int = 0
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    
}

