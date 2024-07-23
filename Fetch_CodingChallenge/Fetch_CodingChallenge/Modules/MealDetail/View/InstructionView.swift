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
                HStack(alignment: .top, spacing: 20) {
                    Text("\(index + 1)")
                        .foregroundColor(.black.opacity(0.8))
                        .font(.custom("OpenSans-Regular", size: 14))
                        .background(
                            Circle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 24, height: 24)
                        )
                        .frame(width: 30, alignment: .top)
                    
                    Text(instructions[index])
                        .foregroundColor(.black)
                        .font(.custom("OpenSans-Regular", size: 16))
                        .frame(width: 300, alignment: .leading)
                }
                .padding(.vertical, 5)
            }
        }
    }
}

#Preview {
    InstructionView(instructions: MockData().mealDetail.instructions.components(separatedBy: .newlines))
}
