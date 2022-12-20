//
//  ViewModel.swift
//  ios_test_Mornhouse
//
//  Created by Andrew Boldyrev on 20.12.2022.
//

import Foundation

struct Numbers: Codable, Hashable {
    var text: String
    var number: Int
}

class ViewModel: ObservableObject {
    @Published var numbers = [Numbers]()
    
    func fetchData(n: String) {
        guard let url = URL(string: "http://numbersapi.com/\(n)/?json") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data , error == nil else { return }
            do {
                let numbersData = try JSONDecoder().decode(Numbers.self, from: data)
                print(numbersData)
                DispatchQueue.main.async {
                    self?.numbers = [numbersData]
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
