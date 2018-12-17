//
//  MovieDetail.swift
//  BoxOffice
//
//  Created by Jinwoo Kim on 2018. 12. 17..
//  Copyright © 2018년 jinuman. All rights reserved.
//

import Foundation

struct MovieDetail: Decodable {
    
    let grade: Int
    let date: String
    let reservationRate: Double
    let audience: Int
    let synopsis: String
    let reservationGrade: Int
    let title: String
    let genre: String
    let id: String
    let userRating: Double
    let image: String
    let actor: String
    let director: String
    let duration: Int

    enum CodingKeys: String, CodingKey {
        case grade, date, audience, synopsis, title
        case genre, id, image, actor, director, duration
        case reservationGrade = "reservation_grade"
        case reservationRate = "reservation_rate"
        case userRating = "user_rating"
    }
    
    var releaseDateText: String {
        return "\(date)개봉"
    }
    
    var genreAndDurationText: String {
        return "\(genre)/\(String(duration))분"
    }
    
    var reservationRankText: String {
        return "\(String(reservationGrade))위 \(String(format: "%.1f", reservationRate))%"
    }
    
    var audienceNumberText: String {
        return audience.withCommas()
    }
}
