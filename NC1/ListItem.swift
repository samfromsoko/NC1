//
//  ListItem.swift
//  NC1
//
//  Created by Sujin Park on 4/16/24.
//

import SwiftUI

struct ListItem: Hashable, Identifiable, Codable {
    var id = UUID()
    var title: String
    var count: Int
    var iconName: String
}

class ListViewModel: ObservableObject{
    @Published var tmpList : ListItem = ListItem(title: "", count: 0, iconName: "")
    @Published var listHistory : [ListItem] = [
        ListItem(title: "텀블러 사용하기", count: 0, iconName: "waterbottle"),
        ListItem(title: "재활용하기", count: 0, iconName: "arrow.3.trianglepath"),
        ListItem(title: "중고제품 사기", count: 0, iconName: "carrot"),
        ListItem(title: "플라스틱 덜 쓰기", count: 0, iconName: "arrow.down"),
        ListItem(title: "불 끄고 다니기", count: 0, iconName: "flashlight.slash"),
        ListItem(title: "대중교통 타기", count: 0, iconName: "bus"),
        ListItem(title: "책 빌리기", count: 0, iconName: "books.vertical"),
        ListItem(title: "빨대 안 쓰기", count: 0, iconName: "mouth"),
        ListItem(title: "포장 안 하기", count: 0, iconName: "takeoutbag.and.cup.and.straw"),
        ListItem(title: "비건식 먹기", count: 0, iconName: "fork.knife"),
        ListItem(title: "로컬 식재료 먹기", count: 0, iconName: "house"),
        ListItem(title: "잔반 안 남기기", count: 0, iconName: "rays"),
        ListItem(title: "멋지게 숨쉬기", count: 0, iconName: "nose"),
        ListItem(title: "분리수거하기", count: 0, iconName: "trash"),
        ListItem(title: "새활용하기", count: 0, iconName: "tree"),
        ListItem(title: "걸어다니기", count: 0, iconName: "figure.walk"),
        ListItem(title: "물건 끝까지 쓰기", count: 0, iconName: "hand.thumbsup"),
        ListItem(title: "같이 하기", count: 0, iconName: "person.2"),
    ].sorted { $0.title < $1.title}
    
    //top3를 선정하는 함수
    func ranking() -> [ListItem] {
        let countedItems = listHistory.filter {$0.count > 0 }
        return countedItems.sorted { $0.count > $1.count }/*.prefix(3)*/.map { $0 }
    }
    
    //새로운 시도를 선정하는 함수
    func try3() -> [ListItem] {
        
        
//        guard noCount.count >= 3 else {
//            return noCount
//        }
//        
//        var randomItems = [ListItem]()
//        var chosenIndexes = Set<Int>()
//        while chosenIndexes.count < 3 {
//            let randomIndex = Int.random(in: 0..<noCount.count)
//            if !chosenIndexes.contains(randomIndex) {
//                randomItems.append(noCount[randomIndex])
//            }
//        }
        let countedItems = listHistory.filter {$0.count == 0 }
        print(countedItems)
        return countedItems
    }
    
    
}
