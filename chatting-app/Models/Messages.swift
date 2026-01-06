//
//  Messages.swift
//  chatting-app
//
//  Created by Dinar Hadiyanto on 14/12/25.
//

import Foundation


struct Message{
    let id:UUID
    let message:String
    let sent_at:Date
    let read_at:Date
    let sender_id:UUID
    let recipient_id:UUID
}

struct MessageBubble:Identifiable{
    let id:UUID
    let message:String
    let mine:Bool
}

struct MessageCover: Identifiable {
    let id = UUID()
    let name: String
    let lastMessage: String
}
