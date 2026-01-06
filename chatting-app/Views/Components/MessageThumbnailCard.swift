//
//  MessageThumbnailCard.swift
//  chatting-app
//
//  Created by Dinar Hadiyanto on 07/01/26.
//

import SwiftUI

struct MessageThumbnailCard: View{
    let msgMeta: MessageCover
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
                    Text(msgMeta.lastMessage)
                        .foregroundColor(.gray)
                        .font(.system(.caption, design: .rounded))
                }.padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading
            )
    )}
}
