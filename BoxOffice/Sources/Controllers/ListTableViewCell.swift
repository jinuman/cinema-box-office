//
//  ListTableViewCell.swift
//  BoxOffice
//
//  Created by Jinwoo Kim on 2018. 12. 14..
//  Copyright © 2018년 jinuman. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var gradeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var movies: Movies? {
        didSet {
            setupCell(with: movies)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(with movies: Movies?) {
        thumbImageView.image = #imageLiteral(resourceName: "img_placeholder")
        gradeImageView.image = #imageLiteral(resourceName: "ic_12")
        titleLabel.text = movies?.title
        infoLabel.text = movies?.listTableInfoLabelText
        dateLabel.text = movies?.listTableDateLabelText
    }
}
