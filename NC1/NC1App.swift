//
//  NC1App.swift
//  NC1
//
//  Created by Sujin Park on 4/16/24.
//

import SwiftUI

@main
struct NC1App: App {
    @StateObject var todoList = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                Calendar()
            }
        }
        .environmentObject(todoList)
//가장 바깥에 해야 문제가 안 생기는 애. 데이터를 뿌려주기 때문!
    }
}
//entry point라고 불림
