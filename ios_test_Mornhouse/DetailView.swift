//
//  DetailView.swift
//  ios_test_Mornhouse
//
//  Created by Andrew Boldyrev on 20.12.2022.
//

import Foundation
import SwiftUI
import RealmSwift

struct DetailView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var num : String = ""
    @State var numStory : String = ""
    
    @ObservedResults(NumbersModel.self) var numbersList
    
    var body: some View {
        NavigationView {
            List {
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
                if num != "" {
                    viewModel.fetchData(n: num)
                } else {
                    viewModel.fetchData(n: numStory)
                }
            }
            .onDisappear{
                let numbersList = NumbersModel()
                for n in viewModel.numbers {
                    numbersList.number = n.number
                    numbersList.detailText = n.text
                    if num != "" {
                        $numbersList.append(numbersList)
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
