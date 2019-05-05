//
//  ViewController.swift
//  MovieTrailer-500782152
//
//  Created by Jasdeep on 04-05-19.
//  Copyright © 2019 Tanveer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Title", comment: "");
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTableView();
        fetchTrailers();
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    private var MovieTrailers: [MovieTrailer] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchTrailers() {
        TrailerAPI.getTrailers()
            .responseData(completionHandler: { [weak self] (response) in
                guard let jsonData = response.data else {
                    //self?.pendingNetworkRequest = false
                    return
                }
                
                let decoder = JSONDecoder()
                guard let newTrailers = try? decoder.decode([MovieTrailer].self, from: jsonData) else {
                    //self?.pendingNetworkRequest = false
                    return
                }
                self?.MovieTrailers += newTrailers;
            })
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieTrailers.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as!
        MovieTableViewCell;
        cell.trailer = MovieTrailers[indexPath.row];
        return cell
}
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
       
        detailVC.movieTrailer = MovieTrailers[indexPath.row];
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

