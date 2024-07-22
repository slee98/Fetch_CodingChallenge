import SwiftUI

struct MealListView: View {
    
    @Binding var selectedCategory: Category?
    @ObservedObject var mealsViewModel: MealsViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(mealsViewModel.mealList, id: \.self) { meal in
                        NavigationLink(
                            value: meal,
                            label: {
                                VStack {
                                    AsyncImage(url: meal.thumbnailURL, content: { image in
                                        image
                                            .resizable()
                                            .cornerRadius(4)
                                    }, placeholder: {
                                        ProgressView()
                                    })
                                    .frame(width: 170, height: 170)
                                    Text(meal.name)
                                        .foregroundColor(.black)
                                        .bold()
                                        .font(.system(size: 16))
                                        .frame(width: 170, height: 40, alignment: .topLeading)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        )
                    }
                }
                .padding()
            }
            .navigationDestination(for: MealBase.self) { meal in
                MealDetailView(meal: meal)
                    .navigationBarBackButtonHidden(true)
            }
        }
        .onChange(of: selectedCategory, {
            mealsViewModel.fetchMeals(by: selectedCategory)
        })
    }
}

#Preview {
    let mealsViewModel = MealsViewModel()
    let categoryViewModel = CategoryViewModel()
    @State var selectedCategory = MockData().categoryList.first
    mealsViewModel.mealList = MockData().mealBaseList
    
    return MealListView(selectedCategory: $selectedCategory, mealsViewModel: mealsViewModel)
}

