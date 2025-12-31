//
//  HeaderView.swift
//  chatting-app
//
//  Created by Dinar Hadiyanto on 07/12/25.
//

import SwiftUI

struct HeaderView: View {
    var text:String
    var body: some View {
        RoundedRectangle(cornerRadius: 1.5, )
            .frame(height: 75)
            .opacity(0)
            .overlay(
                VStack(
                ){
                    Text(text)
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.semibold)
                }.frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding(.horizontal, 7)
                ,alignment: .bottom
            )
    }
}

#Preview {
    HeaderView(text:"Your title")
}
