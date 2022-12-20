//
//  ContentView.swift
//  ios_test_Mornhouse
//
//  Created by Andrew Boldyrev on 20.12.2022.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @State private var showingAlert = false
    @State var number: String = ""
    @StateObject var viewModel = ViewModel()
    
    @ObservedResults(NumbersModel.self) var numbersList
    @ObservedRealmObject var numList : NumbersModel
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextInputField(placeHolder: "Enter any number" , textValue: $number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                    //  Spacer()
                    Button {
                    } label: {
                        NavigationLink(destination: DetailView(num: number, numList: numList ), label: {
                            Text(Constant.getFactBT)
                                .padding()
                        })
                        .disabled(number == "")
                    }
                    
                    Button {
                    } label: {
                        NavigationLink(destination: DetailView(num: Constant.randomURL, numList: numList), label: {
                            Text(Constant.randomFactBT)
                                .padding()
                        })
                    }
                }
                
                VStack {
                    List {
                        ForEach(numbersList, id: \.id) { nList in
                            NavigationLink {
                                DetailView(numList: nList)
                            } label: {
                                Text(nList.detailText)
                            }
                        }
                    }.listStyle(.plain)
                        .lineLimit(2)
                }
            }
            .navigationTitle(Constant.navBarTitle)
            .onAppear{
                number = ""
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(numList: NumbersModel())
    }
}

