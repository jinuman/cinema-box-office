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
        case movies
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
        case id, title, grade, date, thumb
        case userRating = "user_rating"
        case reservationRate = "reservation_rate"
        case reservationGrade = "reservation_grade"
    }
    
    var listTableInfoLabelText: String {
        return "평점 : \(String(format: "%.2f", userRating)) 예매순위 : \(String(reservationGrade)) 예매율 : \(String(format: "%.1f", reservationRate))"
    }
    
    var listTableDateLabelText: String {
        return "개봉일 : \(date)"
    }
    
   
}
