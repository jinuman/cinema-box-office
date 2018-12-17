//
//  DetailInfoTableViewCell.swift
//  BoxOffice
//
//  Created by Jinwoo Kim on 2018. 12. 17..
//  Copyright © 2018년 jinuman. All rights reserved.
//

import UIKit

class DetailInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gradeImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var reservationRankLabel: UILabel!
    @IBOutlet weak var userRatingLabel: UILabel!
    @IBOutlet var starImageView: [UIImageView]!
    
    @IBOutlet weak var audienceLabel: UILabel!
    
    var movie: MovieDetail? {
        didSet {
            guard let movie = movie else { return }
            setupCell(with: movie)
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupCell(with movie: MovieDetail) {
        let imageUrl = URL(string: movie.image)
        thumbImageView.kf.setImage(with: imageUrl)
        
        switch movie.grade {
        case 12:
            gradeImageView.image = #imageLiteral(resourceName: "ic_12")
        case 15:
            gradeImageView.image = #imageLiteral(resourceName: "ic_15")
        case 19:
            gradeImageView.image = #imageLiteral(resourceName: "ic_19")
        default:
            gradeImageView.image = #imageLiteral(resourceName: "ic_allages")
        }
        
        titleLabel.text = movie.title
        dateLabel.text = movie.releaseDateText
        genreLabel.text = movie.genreAndDurationText
        reservationRankLabel.text = movie.reservationRankText
        userRatingLabel.text = String(movie.userRating)
        audienceLabel.text = movie.audienceNumberText
    }
    
}
