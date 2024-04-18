////
////  File.swift
////  NC1_W Watch App
////
////  Created by Sujin Park on 4/16/24.
//
//
//import SwiftUI
//
//struct ListItemModel: Hashable, Identifiable, Codable {
//    var id = UUID()
//    var title: String
//    var count: Int
//    var iconName: String
//}
//
//class ListViewModel: ObservableObject{
//    @Published var tmpList : ListItemModel = ListItem(title: "", count: 0, iconName: "")
//    @Published var listHistory : [ListItem] = [
//        ListItemModel(title: "텀블러 사용하기", count: 0, iconName: "waterbottle"),
//        ListItemModel(title: "재활용하기", count: 0, iconName: "arrow.3.trianglepath"),
//        ListItemModel(title: "중고제품 사기", count: 0, iconName: "carrot"),
//        ListItemModel(title: "플라스틱 덜 쓰기", count: 0, iconName: "arrow.down"),
//        ListItemModel(title: "불 끄고 다니기", count: 0, iconName: "flashlight.slash"),
//        ListItemModel(title: "대중교통 타기", count: 0, iconName: "bus"),
//        ListItemModel(title: "책 빌리기", count: 0, iconName: "books.vertical"),
//        ListItemModel(title: "빨대 안 쓰기", count: 0, iconName: "mouth"),
//        ListItemModel(title: "포장 안 하기", count: 0, iconName: "takeoutbag.and.cup.and.straw"),
//        ListItemModel(title: "비건식 먹기", count: 0, iconName: "fork.knife"),
//        ListItemModel(title: "로컬 식재료 먹기", count: 0, iconName: "house"),
//        ListItemModel(title: "잔반 안 남기기", count: 0, iconName: "rays"),
//        ListItemModel(title: "멋지게 숨쉬기", count: 0, iconName: "nose"),
//        ListItemModel(title: "분리수거하기", count: 0, iconName: "trash"),
//        ListItemModel(title: "새활용하기", count: 0, iconName: "tree"),
//        ListItemModel(title: "걸어다니기", count: 0, iconName: "figure.walk"),
//        ListItemModel(title: "물건 끝까지 쓰기", count: 0, iconName: "hand.thumbsup"),
//        ListItemModel(title: "같이 하기", count: 0, iconName: "person.2"),
//    ].sorted { $0.title < $1.title}
//    
//    //top3를 선정하는 함수
//    func ranking() -> [ListItem] {
//        let countedItems = listHistory.filter {$0.count > 0 }
//        return countedItems.sorted { $0.count > $1.count }/*.prefix(3)*/.map { $0 }
//    }
//    
//    //새로운 시도를 선정하는 함수
//    func try3() -> [ListItem] {
//        
//        let countedItems = listHistory.filter {$0.count == 0 }
//        print(countedItems)
//        return countedItems
//    }
//    
//    
//}
