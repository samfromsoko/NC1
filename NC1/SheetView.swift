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
        ScrollView {
            VStack {
                ForEach(todoList.listHistory, id: \.self) { listItem in
                    HStack{
                        Button(action: {
                            /*viewModel.*/
                            todoList.listHistory[todoList.listHistory.firstIndex(of: listItem) ?? 0].count += 1
                            viewModel.session.sendMessage(["count":  viewModel.count], replyHandler: nil)
                            print(todoList.listHistory)
                            //                            updateAndSendData()
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

import WatchConnectivity
//
@Observable
final class ContentViewModel: NSObject, WCSessionDelegate, ObservableObject {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    var title: String = ""
    var count: Int = 0
    var todoList:ListViewModel
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    

    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.count = message ["count"] as? Int ?? 0
        }
    }
//            if let idString = message["id"] as? String,
//               let id = UUID(uuidString: idString),
//               let index = self.todoList.listHistory.firstIndex(where: {$0.id == id}),
//               let newCount = message["count"] as? Int {
//                self.todoList.listHistory[index].count = newCount
//            }
//        }
//    }
    
//    func updateAndSendData() {
//        let data: [String: Any] = ["count": viewModel.count, "title": viewModel.title]
//        viewModel/*shared*/.sendListViewModelData(data)
//    }
}


//#Preview {
//    SheetView(showSheet: .constant(true))
//}

