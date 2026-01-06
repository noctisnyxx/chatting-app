//
//  ChatRoomView.swift
//  chatting-app
//
//  Created by Dinar Hadiyanto on 07/12/25.
//

import SwiftUI
import Fakery

struct ChatRoomView: View{
    @State var bbls: [MessageBubble] = []
        init() {
            var tempBubbles: [MessageBubble] = []
            for _ in 0..<Int.random(in: 10...50) {
                tempBubbles.append(
                    MessageBubble(
                        id:UUID.init(),
                        message: faker.lorem.characters(amount: Int.random(in: 5...200)),
                        mine: Bool.random(),
                    )
                )
            }
            _bbls = State(initialValue: tempBubbles)
        }
    var body: some View {
        VStack{
            Spacer()
            ChatListView(bubbles: bbls)
            MessageInputContent()
        }
        
    }
}

#Preview {
    ChatRoomView()
}
