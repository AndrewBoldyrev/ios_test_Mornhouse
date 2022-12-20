//
//  ContentView.swift
//  ios_test_Mornhouse
//
//  Created by Andrew Boldyrev on 20.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State var number: String = ""
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack {
                    TextField("Enter any number", text: $number)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                    Spacer()
                    NavigationLink(destination: DetailView(num: number), label: {
                        Text("MyButton")
                        .padding()
                    })
                     //   .buttonStyle(ThemeAnimationStyle())
                        .disabled(number == "")
                }
                
                VStack {
                    List {
//                        ForEach(numbersList, id: \.id) { nList in
//                            Text(String((nList.number)) + nList.detailText)
//                        }
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
