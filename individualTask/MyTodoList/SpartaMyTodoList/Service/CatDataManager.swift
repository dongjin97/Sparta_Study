//
//  CatDataManager.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/09.
//

import Foundation
class CatDataManager{
    static let shared = CatDataManager()
    func getCatData(completion: @escaping([CatData]) -> Void){
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search")else {
            print("Url error")
            return
        }
        URLSession(configuration: .default).dataTask(with: url) { data, response, error in
            if let error = error{
                print("Error:\(error)")
            }else if let data = data{
                do {
                    let CatData : [CatData] = try JSONDecoder().decode([CatData].self, from: data) // 데이터 디코딩
                    completion(CatData) // Completion @escaping
                }catch{
                    print("Decoding Error") // 디코딩 에러발생시 표출
                    print("\(String(describing: error.localizedDescription))")
                }
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)") //response 상태코드
            }
        }.resume()
    }
    
}
