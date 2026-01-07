//
//  ChatListView.swift
//  chatting-app
//
//  Created by Dinar Hadiyanto on 25/12/25.
//

import SwiftUI
struct ChatListView: View {
    let bubbles: [MessageBubble]

    var body: some View {
        VStack(
            spacing: 0,
            
        ) {
            ScrollView{
                ForEach(bubbles) { bubble in
                    HStack(
                        
                    ) {
                        if bubble.mine {
                            Spacer()
                        }
                        ChatBubble(
                            msg: bubble.message,
                            mine: bubble.mine,
                            color: bubble.mine ? Color(.systemGray) : Color(.blue))
                        if !bubble.mine {
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 15)
                }
            }
            .cornerRadius(20)
            .defaultScrollAnchor(.bottom)
            
        }
    }
}

#Preview {
    ChatListView(bubbles: MessageBubble.dummyList(count: Int.random(in: 10...50)))
}
