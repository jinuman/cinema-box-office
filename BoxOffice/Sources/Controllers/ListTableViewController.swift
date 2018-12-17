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
    
    private var movies = [Movies]()
    private let apiHandler = APIHandler()
    private var orderType = APIHandler.orderNumber {
        didSet {
            switch orderType {
            case .reservationRate:
                navigationItem.title = "예매율순"
            case .curation:
                navigationItem.title = "큐레이션"
            case .date:
                navigationItem.title = "개봉일순"
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case "showDetail":
            guard
                let detailVC = segue.destination as? DetailViewController,
                let selectedIndexPath = listTableView.indexPathForSelectedRow
                else { return }
            detailVC.id = movies[selectedIndexPath.row].id
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderType = APIHandler.orderNumber
        fetchMovieList(order: orderType)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }
    
    func fetchMovieList(order: OrderType) {
        apiHandler.requestList(order: order) { [weak self] movieList, error in
            guard let movieList = movieList else { return }
            self?.movies = movieList.movies
            DispatchQueue.main.async {
                self?.orderType = OrderType(rawValue: movieList.orderType) ?? .reservationRate
                self?.listTableView.reloadData()
            }
        }
    }
    @IBAction func settingButton(_ sender: Any) {
        showActionSheet()
    }
    
    private func showActionSheet() {
        let alertController = UIAlertController(title: "정렬방식 선택",
                                                message: "영화를 어떤 순서로 정렬할까요?",
                                                preferredStyle: .actionSheet)
        
        let reservationAction = UIAlertAction(title: "예매율", style: .default) { _ in
            self.reorderMovieList(orderNumber: .reservationRate)
        }
        let curationAction = UIAlertAction(title: "큐레이션", style: .default) { _ in
            self.reorderMovieList(orderNumber: .curation)
        }
        let dateAction = UIAlertAction(title: "개봉일", style: .default) { _ in
            self.reorderMovieList(orderNumber: .date)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(reservationAction)
        alertController.addAction(curationAction)
        alertController.addAction(dateAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func reorderMovieList(orderNumber: OrderType) {
        if orderNumber != orderType {
            fetchMovieList(order: orderNumber)
        }
    }
    
}

extension ListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListTableViewCell
            else { fatalError("Cell Cast Invalid") }
        cell.movies = movies[indexPath.row]
        
        return cell
    }

}
