//
//  APIHandler.swift
//  BoxOffice
//
//  Created by Jinwoo Kim on 2018. 12. 16..
//  Copyright © 2018년 jinuman. All rights reserved.
//

import Foundation

enum OrderType: Int {
    case reservationRate = 0
    case curation = 1
    case date = 2
}

class APIHandler {
    
    private let baseUrl: String = "http://connect-boxoffice.run.goorm.io"
    private let path = (movies: "/movies", movie: "/movie", comments:"/comments")
    private let query = (orderType: "?order_type=", id: "?id=", movieId:"?movie_id=")
    
    static var orderNumber: OrderType = .reservationRate
    
    func requestList(order: OrderType, completion: @escaping (MovieList?, Error?) -> Void) {
        let urlString: String = "\(baseUrl)\(path.movies)\(query.orderType)\(String(order.rawValue))"
        guard let url = URL(string: urlString) else { fatalError("URL Invalid") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error occur: \(String(describing: error))")
                return
            }
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let data = try decoder.decode(MovieList.self, from: data)
                completion(data, nil)
            } catch let jsonError {
                print("Parsing Error: \(jsonError)")
                completion(nil, error)
            }
        }.resume()
    }
    
}


