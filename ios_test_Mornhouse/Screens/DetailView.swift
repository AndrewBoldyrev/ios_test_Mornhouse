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
    
    @ObservedRealmObject var numList : NumbersModel
    @ObservedResults(NumbersModel.self) var numbersList
    
    var body: some View {
        NavigationView {
            List {
                if num == "" {
                    VStack {
                        Text(String(numList.number))
                            .font(.headline)
                        Divider()
                        Text(numList.detailText)
                    }
                } else {
                    ForEach(viewModel.numbers, id: \.self) {
                        n in
                        VStack {
                            Text(String(n.number)).font(.headline)
                            Divider()
                            Text(n.text)
                        }
                    }
                }
            }
            .navigationBarTitle("Detail", displayMode: .inline)
            .onAppear{
                if num != "" {
                    viewModel.fetchData(n: num)
                }
            }
            .onDisappear{
                let numberList = NumbersModel()
                for n in viewModel.numbers {
                    numberList.number = n.number
                    numberList.detailText = n.text
                    if num != "" {
                        $numbersList.append(numberList)
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(numList: NumbersModel())
    }
}
