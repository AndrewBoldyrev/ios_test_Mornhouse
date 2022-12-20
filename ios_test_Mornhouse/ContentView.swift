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
    var random = "random"
    
    @ObservedResults(NumbersModel.self) var numbersList
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Enter any number", text: $number)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                    //   Spacer()
                    NavigationLink(destination: DetailView(num: number), label: {
                        Text("Search Number")
                            .padding()
                    })
                    .disabled(number == "")
                    
                    Button {
                       // print("Image tapped!")
                    } label: {
                        NavigationLink(destination: DetailView(num: random), label: {
                            Text("Rundom Number")
                                .padding()
                        })
                    }
                }
                
                VStack {
                    List {
                        ForEach(numbersList, id: \.id) { nList in
                            NavigationLink(destination: DetailView(numStory: String( nList.number)), label: {
                                Text(nList.detailText)
                            })
                        }
                    }
                }
            }
            .navigationTitle("Numbers")
            .onAppear{
                number = ""
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
