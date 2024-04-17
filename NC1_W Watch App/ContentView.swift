//
//  ContentView.swift
//  NC1_W Watch App
//
//  Created by Sujin Park on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    //    @Binding var showSheet: Bool
    @ObservedObject var viewModel = ContentViewModel()
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(listItems, id: \.self) { listItem in
                    Button {
                        viewModel.count += 1
                        viewModel.session.sendMessage(["count":  viewModel.count], replyHandler: nil)
                    } label: {
                        Text("\(listItem.title)")
                            .padding(8)
                        //                            .background(Color.gray)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    
                }
                
                
            }
            .frame(width: 400)
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

#Preview {
    ContentView()
}
