//
//  GreedingHeadLineView.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/18/24.
//

import SwiftUI

struct GreedingHeadLineView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(greetingMessage)
                .font(.system(size: 20))
                .foregroundStyle(.gray.opacity(0.7))
            Text("What are you in the mood to make today?")
                .font(.system(size: 14))
                .foregroundStyle(.black.opacity(0.7))
        }
        .frame(width: 350, alignment: .leading)
        .padding()
    }
    
    var greetingMessage: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12:
            return "Good morning!"
        case 12..<17:
            return "Good afternoon!"
        case 17..<22:
            return "Good evening!"
        default:
            return "Good night!"
        }
    }
}

#Preview {
    GreedingHeadLineView()
}
