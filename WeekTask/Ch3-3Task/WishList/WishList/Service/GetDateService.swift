//
//  getDateService.swift
//  WishList
//
//  Created by 원동진 on 2024/01/05.
//

import Foundation
class GetDataService {
    static let shared = GetDataService()
    func getProcudt(completion: @escaping(RemoteProdcut) -> Void){
        let productID = Int.random(in: 1...100)
        guard let url = URL(string: "https://dummyjson.com/products/\(productID)") else{
            return
        }
        URLSession(configuration: .default).dataTask(with: url) { data, response, err in
            if let err = err{
                print("Error: \(err)")
            }else if let data = data{
                do{
                    let product : RemoteProdcut = try JSONDecoder().decode(RemoteProdcut.self, from: data)
                    completion(product)
                }catch{
                    print("Decoding Error")
                    print("\(String(describing: error.localizedDescription))")
                }
            }
        }.resume()
        
    }
}
