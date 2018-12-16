//
//  MovieList.swift
//  BoxOffice
//
//  Created by Jinwoo Kim on 2018. 12. 16..
//  Copyright © 2018년 jinuman. All rights reserved.
//

import Foundation

struct MovieList: Decodable {
    let movies: [Movies]
    let orderType: Int
    
    enum CodingKeys: String, CodingKey {
        case movies = "movies"
        case orderType = "order_type"
    }
}

struct Movies: Decodable {
    let id: String
    let userRating: Double
    let reservationRate: Double
    let title: String
    let grade: Int
    let date: String
    let thumb: String
    let reservationGrade: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userRating = "user_rating"
        case reservationRate = "reservation_rate"
        case title = "title"
        case grade = "grade"
        case date = "date"
        case thumb = "thumb"
        case reservationGrade = "reservation_grade"
    }
}
