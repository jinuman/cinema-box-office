//
//  ListTableViewController.swift
//  BoxOffice
//
//  Created by Jinwoo Kim on 2018. 12. 14..
//  Copyright © 2018년 jinuman. All rights reserved.
//

import UIKit

class ListTableViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    private var movies: [Movies] = []
    
    let apiHandler = APIHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        fetchMovieList(order: 0)
    }
    
    func fetchMovieList(order: Int) {
        apiHandler.requestList(order: order) { [weak self] movieList, error in
            guard let movieList = movieList else { return }
            self?.movies = movieList.movies
            DispatchQueue.main.async {
                self?.listTableView.reloadData()
            }
        }
    }

}

extension ListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell
            else { fatalError("Cell Cast Invalid") }
        cell.movies = movies[indexPath.row]
        
        return cell
    }

}
