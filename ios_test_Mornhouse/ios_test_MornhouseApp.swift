//
//  ios_test_MornhouseApp.swift
//  ios_test_Mornhouse
//
//  Created by Andrew Boldyrev on 20.12.2022.
//

import SwiftUI

@main
struct ios_test_MornhouseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(numList: NumbersModel())
        }
    }
}
