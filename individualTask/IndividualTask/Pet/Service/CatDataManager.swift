//
//  CatDataManager.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/09.
//

import Foundation
class CatDataManager{
    static let shared = CatDataManager()
    func getCatData(completion: @escaping (Result<[CatData],Error>) -> Void){
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search")else {
            print("Url error")
            return
        }
        URLSession(configuration: .default).dataTask(with: url) { data, response, error in
            if let error = error{
                print("Error:\(error.localizedDescription)")
                completion(.failure(NetworkError.unKnown(error.localizedDescription)))
            }
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else{
                print("Error : invalid response")
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            guard let data = data else{
                print("Error : no data")
                completion(.failure(NetworkError.emptyResponse))
                return
            }
            guard let catData = try? JSONDecoder().decode([CatData].self, from: data) else{
                completion(.failure(NetworkError.decodeError))
                return
            }
            completion(.success(catData))
        }.resume()
    }
    
}
