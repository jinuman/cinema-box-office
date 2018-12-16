//
//  APIHandler.swift
//  BoxOffice
//
//  Created by Jinwoo Kim on 2018. 12. 16..
//  Copyright © 2018년 jinuman. All rights reserved.
//

import Foundation

class APIHandler {
    
    private let baseUrl: String = "http://connect-boxoffice.run.goorm.io"
    private let path = (movies: "/movies", movie: "/movie", comments:"/comments")
    private let query = (orderType: "?order_type=", id: "?id=", movieId:"?movie_id=")
    private let orderType = (reservationRate: 1, curation: 2, date: 3)
    
    func requestList() {
        let urlString: String = baseUrl + path.movies + query.orderType + String(orderType.reservationRate)
        guard let url = URL(string: urlString) else { fatalError("URL Invalid")}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession(configuration: .default).dataTask(with: request) { data, response, error in
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
                let result = try decoder.decode(MovieList.self, from: data)
            } catch let jsonError {
                print("Parsing Error: \(jsonError)")
            }
            
        }
    }
    
}
