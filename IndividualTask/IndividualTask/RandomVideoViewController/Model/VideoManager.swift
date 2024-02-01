//
//  VideoManager.swift
//  IndividualTask
//
//  Created by 원동진 on 2/1/24.
//

import Foundation
class VideoManager{
    static let shared = VideoManager()
    func getVideoUrl(completion:@escaping([Movie]) -> Void){
        guard let url = URL(string: "https://gist.githubusercontent.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/14a27bd0bcd0cd323b35ad79cf3b493dddf6216b/videos.json")else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession(configuration: .default).dataTask(with: request) { data, response, error in
            if let error = error{
                print("Error : \(error.localizedDescription)")
                return
            }
            guard let data = data else{
                return
            }
            do{
                let movieData : [Movie] = try JSONDecoder().decode([Movie].self, from: data)
                completion(movieData)
            }catch{
                print("Decode Eeror :\(String(describing: error.localizedDescription))")
            }
        }.resume()
    }
}
