//
//  ContentView.swift
//  NC1_W Watch App
//
//  Created by Sujin Park on 4/16/24.
//

import SwiftUI

struct SheetViewWatch: View {
    //    @Binding var showSheet: Bool
    @EnvironmentObject var todoList: ListViewModel
    @State var count: Int = 0
    @ObservedObject var viewModel = ContentViewModel()
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
                        }) {
                            HStack(alignment: .firstTextBaseline){
                                Image(systemName: listItem.iconName)
                                Text("\(listItem.title)")
                                
                            }                            .padding(16)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            
                        }
                        .frame(width: 400)
                    }
                    
                }
            }
        }
    }
}

import WatchConnectivity

final class ContentViewModel: NSObject, WCSessionDelegate, ObservableObject {
    
    var session: WCSession
    @Published var count: Int = 0
    
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
//
//            #Preview {
//                ContentView()


