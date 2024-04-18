//
//  NC1_WApp.swift
//  NC1_W Watch App
//
//  Created by Sujin Park on 4/16/24.
//

import SwiftUI

@main
struct NC1_W_Watch_AppApp: App {
//    @StateObject var todoList = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                SheetViewWatch()
            }
        }
        .environmentObject(todoList)
        
    }
}
