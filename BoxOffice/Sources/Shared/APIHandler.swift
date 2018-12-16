//
//  APIHandler.swift
//  BoxOffice
//
//  Created by Jinwoo Kim on 2018. 12. 16..
//  Copyright © 2018년 jinuman. All rights reserved.
//

import Foundation

class APIHandler {
    
    private let baseUrl = "http://connect-boxoffice.run.goorm.io"
    private let path = (movies: "/movies", movie: "/movie", comments:"/comments")
    private let query = (orderType: "?order_type=", id: "?id=", movieId:"?movie_id=")
    let orderType = (bookingRate: 1, curation: 2, date: 3)
    
    func requestList() {
        let urlString = baseUrl + path.movies + query.orderType + String(orderType.bookingRate)
        print(urlString)
        
    }
    
}
