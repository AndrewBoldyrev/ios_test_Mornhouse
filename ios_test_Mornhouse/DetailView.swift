//
//  DetailView.swift
//  ios_test_Mornhouse
//
//  Created by Andrew Boldyrev on 20.12.2022.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var num : String = ""
    
  //  @ObservedResults(NumbersModel.self) var numbersList
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.numbers, id: \.self) {
                    n in
                    VStack {
                        Text(String(n.number)).font(.headline)
                        Divider()
                        Text(n.text)
                    }
                }
            }
            .navigationBarTitle("Detail", displayMode: .inline)
            .onAppear{
                viewModel.fetchData(n: num)
            }
            .onDisappear{
//               let numbersList = NumbersModel()
//                for n in viewModel.numbers {
//                    numbersList.number = n.number
//                    numbersList.detailText = n.text
//                    print(numbersList.number)
//                    $numbersList.append(numbersList)
//                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
