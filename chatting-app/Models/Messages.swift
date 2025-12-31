//
//  Messages.swift
//  chatting-app
//
//  Created by Dinar Hadiyanto on 14/12/25.
//

import Foundation


struct Message{
    let id:UUID
    let userID: UUID
    let message: String
    let timestamp: Date
}
