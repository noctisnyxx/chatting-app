//
//  AppConfig.swift
//  chatting-app
//
//  Created by Dinar Hadiyanto on 06/01/26.
//

import SwiftUI

enum AppConfig{
    static let maxMessageLength = 1200
    enum Typography {
            static let messageBody: Font = .system(size: 17, weight: .regular)
            static let senderName: Font = .system(size: 15, weight: .semibold)
            static let timestamp: Font = .system(size: 13, weight: .regular)
        }
        
        enum Colors {
            static let incomingBubble = Color(.systemGray6)
            static let outgoingBubble = Color.blue
            static let primaryText = Color.primary
            static let secondaryText = Color.secondary
        }
}
