//
//  InstructionView.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/18/24.
//

import SwiftUI

struct InstructionView: View {
    
    let instructions: [String]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(instructions.indices, id: \.self) { index in
                HStack {
                    Text("\(index + 1)")
                        .foregroundStyle(Color.black.opacity(0.8))
                        .font(.system(size: 14))
                        .background(
                            Circle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 24, height: 24)
                        )
                    
                    Text(instructions[index])
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .frame(width: 340, alignment: .leading)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    InstructionView(instructions: MockData().mealDetail.instructions.components(separatedBy: .newlines))
}
