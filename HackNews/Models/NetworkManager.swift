//
//  NetworkManager.swift
//  HackNews
//
//  Created by Аркадий Рожков on 16.03.2022.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts: [PostData] = []
    
    func fetchData(){
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, res, error in
            guard error == nil else { print(error!); return }
            let decoder = JSONDecoder()
            guard let safeData = data else {return}
            do{
                let results = try decoder.decode(Results.self, from: safeData)
                DispatchQueue.main.async {
                    self.posts = results.hits
                }
            }catch {
                print(error)
            }
        }
        task.resume()
    }
}
