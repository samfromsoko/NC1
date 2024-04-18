//
//  ContentView.swift
//  NC1_W Watch App
//
//  Created by Sujin Park on 4/16/24.
//

import SwiftUI

struct SheetViewWatch: View {
    //    @Binding var showSheet: Bool
    @EnvironmentObject var todoList: ListViewModel  // 이렇게 접근
    @State var count: Int = 0
    @ObservedObject var viewModel = ContentViewModel()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(todoList.listHistory, id: \.self) { listItem in
                    HStack{
                        Button(action: {
                            let index = todoList.listHistory.firstIndex(of: listItem) ?? 0
                            todoList.listHistory[index].count += 1
                            let updatedCount = todoList.listHistory[index].count
                            
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
                    }
                    
                    
                }
                .frame(width: 400)
                
            }
        }
    }
}



import Foundation
import WatchConnectivity

final class ContentViewModel: NSObject, WCSessionDelegate, ObservableObject {
    @EnvironmentObject var todoList: ListViewModel
    var session: WCSession
    @Published var count: Int = 0
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.count = message["count"] as? Int ?? -1
        }
    }
}

/////////
// 여기까지
//    func updateListItem(listItem: ListItem) {
//        let index = todoList.listHistory.firstIndex(of: listItem) ?? 0
//        todoList.listHistory[index].count += 1
//        let updatedCount = todoList.listHistory[index].count
//
//        if WCSession.default.isReachable {
//            WCSession.default.sendMessage(["id": listItem.id.uuidString, "count": updatedCount], replyHandler: nil, errorHandler: nil)
//        }
//    }

//}
//
//            #Preview {
//                ContentView()


