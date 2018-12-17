//
//  DetailViewController.swift
//  BoxOffice
//
//  Created by Jinwoo Kim on 2018. 12. 14..
//  Copyright © 2018년 jinuman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var id = ""
    private var movie: MovieDetail?
    private let apiHandler = APIHandler()
    
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieDetail()
    }
    
    func fetchMovieDetail() {
        apiHandler.requestDetail(id: id) { [weak self] movie, error in
            guard let movie = movie else { return }
            self?.movie = movie
            DispatchQueue.main.async {
                self?.detailTableView.reloadData()
            }
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? DetailInfoTableViewCell else { fatalError("Info Cell Invalid") }
            cell.movie = movie
            return cell
        default:
            fatalError("Cell Invalid")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
