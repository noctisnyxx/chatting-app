//
//  ContentView.swift
//  chatting-app
//
//  Created by Dinar Hadiyanto on 10/11/25.
//

import SwiftUI
import Fakery

struct ContentView: View {
    let totalUsers: Int = Int.random(in: 7...20)
    let faker = Faker()
    var messages:[MessageCover]{
        (0..<totalUsers).map{
            _ in MessageCover(
                name: faker.name.name(),
                lastMessage: faker.lorem.words(amount: 10)
            )
        }
    }
    var body: some View {
        NavigationStack{
            LinearGradient(
                gradient: Gradient(stops: [
                .init(color: .white, location: -0.5),
                .init(color: .white, location: 3.5),
                ]),
                startPoint: .leading,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            .overlay(
                VStack(
                ){
                    HeaderView(text: "Live in connection", color:Color(.systemGray))
                    ScrollView{
                        VStack(
                            spacing: 0
                        ){
                            ForEach(messages){ m in
                                MessageThumbnailCard(msgMeta: m)
                            }
                        }
                    }
                    .cornerRadius(20)
                    .border(Color(.systemGray3), width:0.5)
                    .scrollIndicators(.hidden)
                    .scrollContentBackground(.hidden)
                }
            )
        }
        
    }
}    

#Preview {
    ContentView()
}
