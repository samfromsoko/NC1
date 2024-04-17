//
//  File.swift
//  NC1_W Watch App
//
//  Created by Sujin Park on 4/16/24.
//

import SwiftUI

struct ListItem: Hashable {
    var title: String
    var selectedTime: Int
    var imageName: String
}

var listItems: [ListItem] = [
    ListItem(title: "텀블러 사용하기", selectedTime: 0, imageName: "waterbottle"),
    ListItem(title: "재활용하기", selectedTime: 0, imageName: "arrow.3.trianglepath"),
    ListItem(title: "중고제품 사기", selectedTime: 0, imageName: "carrot"),
    ListItem(title: "플라스틱 덜 쓰기", selectedTime: 0, imageName: "arrow.down"),
    ListItem(title: "불 끄고 다니기", selectedTime: 0, imageName: "flashlight.slash"),
    ListItem(title: "대중교통 타기", selectedTime: 0, imageName: "bus"),
    ListItem(title: "책 빌리기", selectedTime: 0, imageName: "books.vertical"),
    ListItem(title: "빨대 안 쓰기", selectedTime: 0, imageName: "mouth"),
    ListItem(title: "포장 안 하기", selectedTime: 0, imageName: "takeoutbag.and.cup.and.straw"),
    ListItem(title: "비건식 먹기", selectedTime: 0, imageName: "fork.knife"),
    ListItem(title: "로컬 식재료 먹기", selectedTime: 0, imageName: "house"),
    ListItem(title: "잔반 안 남기기", selectedTime: 0, imageName: "rays"),
    ListItem(title: "멋지게 숨쉬기", selectedTime: 0, imageName: "nose"),
    ListItem(title: "분리수거하기", selectedTime: 0, imageName: "trash"),
    ListItem(title: "새활용하기", selectedTime: 0, imageName: "tree"),
    ListItem(title: "걸어다니기", selectedTime: 0, imageName: "figure.walk"),
    ListItem(title: "물건 끝까지 쓰기", selectedTime: 0, imageName: "hand.thumbsup"),
    ListItem(title: "같이 하기", selectedTime: 0, imageName: "person.2"),
].sorted { $0.title < $1.title}
