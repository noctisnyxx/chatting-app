//
//  ContentView.swift
//  chatting-app
//
//  Created by Dinar Hadiyanto on 10/11/25.
//

import SwiftUI
import Fakery

struct MessageMeta: Identifiable {
    let id = UUID()
    let name: String
    let preview: String
}

struct ContentView: View {
    let totalUsers: Int = 5
    let faker = Faker()
    var messages:[MessageMeta]{
        (0..<totalUsers).map{
            _ in MessageMeta(
                name: faker.name.name(),
                preview: faker.lorem.words(amount: 10)
            )
        }
    }
    var body: some View {
        NavigationStack{
            LinearGradient(
                gradient: Gradient(stops: [
                .init(color: .white,    location: -0.5),
                .init(color: .cyan, location: 2.5),
                ]),
                startPoint: .leading,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            .overlay(
                VStack(
                ){
                    HeaderView(text: "Live in connection")
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
                    .scrollIndicators(.hidden)
                    .scrollContentBackground(.hidden)
                }
            )
        }
        
    }
}

struct MessageThumbnailCard: View{
    let msgMeta: MessageMeta
    var avatarURL = "https://avatar.iran.liara.run/public"
    var body: some View{
        NavigationLink{
            ChatRoomView()
        }label: {
            cardContent
        }
    }
    private var cardContent: some View{
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray.opacity(0))
            .frame(height: 80)
            .overlay(
            HStack(){
                avatarBox
                messageBox
            }.padding(.horizontal, 7)
        )
    }
    private var avatarBox : some View{
        AsyncImage(url: URL(string: avatarURL)
        ){ image in
            image.resizable()
        } placeholder: {
            Color.gray.opacity(0.3)
        }
            .frame(width: 70, height: 70)
            .clipShape(
                Circle()
            )
    }
    private var messageBox: some View{
        RoundedRectangle(cornerRadius: 10)
            .fill(.gray.opacity(0.2))
            .frame(height: 60)
            .overlay(
                VStack(
                    alignment: .leading,
                ){
                    Text(msgMeta.name)
                        .foregroundColor(.black)
                        .font(.headline)
                    Text(msgMeta.preview)
                        .foregroundColor(.gray)
                        .font(.system(.caption, design: .rounded))
                }.padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading
            )
    )}
}
    

#Preview {
    ContentView()
}
