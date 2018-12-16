//
//  ListTableViewCell.swift
//  BoxOffice
//
//  Created by Jinwoo Kim on 2018. 12. 14..
//  Copyright © 2018년 jinuman. All rights reserved.
//

import UIKit
import Kingfisher

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var gradeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var movies: Movies? {
        didSet {
            guard let movies = movies else { return }
            setupCell(with: movies)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(with movies: Movies) {
        let imageUrl = URL(string: movies.thumb)
        thumbImageView.kf.setImage(with: imageUrl)
        
        switch movies.grade {
        case 12:
            gradeImageView.image = #imageLiteral(resourceName: "ic_12")
        case 15:
            gradeImageView.image = #imageLiteral(resourceName: "ic_15")
        case 19:
            gradeImageView.image = #imageLiteral(resourceName: "ic_19")
        default:
            gradeImageView.image = #imageLiteral(resourceName: "ic_allages")
        }
        
        titleLabel.text = movies.title
        infoLabel.text = movies.listTableInfoLabelText
        dateLabel.text = movies.listTableDateLabelText
    }
}
