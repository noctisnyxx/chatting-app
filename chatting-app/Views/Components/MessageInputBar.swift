//
//  MessageInputBar.swift
//  chatting-app
//
//  Created by Dinar Hadiyanto on 25/12/25.
//

import SwiftUI
struct MaxCharacterStatus{
    let color: Color
    let opacity: Double
}
struct MessageInputContent: View{
    @State private var msg:String = ""
    var charLeft: Int {
        AppConfig.maxMessageLength - msg.count
    }
    var currentStatus: MaxCharacterStatus{
        let opacity = Double(msg.count) / Double(AppConfig.maxMessageLength)
        if Double(charLeft) < Double(AppConfig.maxMessageLength)*0.1{
            return MaxCharacterStatus(color: .red, opacity: opacity)
        }else if Double(charLeft) < Double(AppConfig.maxMessageLength)*0.5{
            return MaxCharacterStatus(color: .orange, opacity: opacity)
        }else{
            return MaxCharacterStatus(color: .gray, opacity: opacity)
        }
    }
    var body: some View{
        VStack(
            alignment: .trailing,
            spacing: 0,
        ){
            HStack(
                alignment: .bottom
            ){
                TextField(
                    "write your message here",
                    text: $msg,
                    axis: .vertical
                )
                .font(.caption)
                .lineLimit(10)
                .scrollIndicators(.visible)
                .padding(5)
                .background()
                Button(action:{
                    
                }){
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.teal)
                }.padding(.trailing, 5)
            }
            .padding(.horizontal)
            Text("\(charLeft)")
                .foregroundStyle(currentStatus.color)
                .opacity(currentStatus.opacity)
                .font(.caption)
                .padding(.top, 5)
                .padding(.horizontal,65)
        }
        .padding(.top, 20)
        .padding(.bottom, 5)
        .background(.ultraThinMaterial)
    }
}

#Preview {
    MessageInputContent()
}
