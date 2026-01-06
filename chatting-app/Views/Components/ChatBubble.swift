//
//  ChatBubble.swift
//  chatting-app
//
//  Created by Dinar Hadiyanto on 25/12/25.
//

import SwiftUI
import Fakery

let faker = Faker()

struct ChatBubble: View {
    let msg:String
    let mine:Bool
    let color:Color
    var body: some View {
        Text(msg)
            .font(.caption)
            .multilineTextAlignment(.leading)
            .foregroundStyle(Color(.white))
            .padding(8)
            .fixedSize(horizontal: false, vertical: true)
            .background(
                RoundedRectangle(cornerRadius: 7)
                    .fill(color)
            )
            .frame(
                maxWidth: 240,
                alignment: mine ? .trailing : .leading)
    }
}

#Preview {
    ChatBubble(
        msg:faker.lorem.characters(amount: 10),
        mine: Bool.random(),
        color:.blue
    )
}
