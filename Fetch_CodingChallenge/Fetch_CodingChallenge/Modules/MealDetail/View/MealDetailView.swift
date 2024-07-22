//
//  MealDetailView.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/17/24.
//

import SwiftUI

struct MealDetailView: View {
    
    let meal: any MealBaseProtocol
    @State var index : Int = 0
    @State private var dragOffset = CGSize.zero
    @StateObject var mealDetailViewModel = MealDetailViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            if let meal = mealDetailViewModel.mealDetail {
                
                DetailHeaderView(meal: meal)
                Text(meal.name)
                    .font(.system(size: 24))
                    .frame(width: 350, height: 30, alignment: .topLeading)
                
                HStack {
                    Button(action: {
                        index = 0
                    }, label: {
                        VStack {
                            Text("Ingredients")
                                .foregroundStyle(index == 0 ? Color.black : Color.gray)
                        }
                    })
                    Spacer()
                    Button(action: {
                        index = 1
                    }, label: {
                        Text("Instructions")
                            .foregroundStyle(index == 1 ? Color.black : Color.gray)
                    })
                }
                .padding(.horizontal, 60)
                .padding()
                
                if index == 0 {
                    IngredientView(meal: meal)
                }
                if index == 1 {
                    InstructionView(instructions: meal.instructions.components(separatedBy: .newlines).filter({ !$0.isEmpty }))
                }
                Spacer()
            }
            else {
                ProgressView()
            }
        }
        .onAppear {
            if let mealDetail = meal as? MealDetail {
                mealDetailViewModel.mealDetail = mealDetail
            } else {
                mealDetailViewModel.fetchMealDetail(mealId: meal.id)
            }
        }
        .ignoresSafeArea(.all)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    if gesture.translation.width > 0 {
                        self.dragOffset = gesture.translation
                    }
                }
                .onEnded {
                    _ in
                    if self.dragOffset.width > 100 {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    self.dragOffset = .zero
                }
        )
    }
}

#Preview {
    MealDetailView(meal: MockData().mealBaseList[0])
}
