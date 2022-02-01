//
//  MainViewController.swift
//  RxDrill
//
//  Created by Idan Boadana on 01/02/2022.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    @IBOutlet private var searchTextField: UITextField!
    @IBOutlet private var resultsTableView: UITableView!
    @IBOutlet private var logoutButton: UIButton!
    
    fileprivate var results: [String] = [] {
        didSet {
            resultsTableView.reloadData()
        }
    }
    
    private let viewModel = MainViewModel(userService: DI.userService, searchService: DI.searchService)
    private let throttler = Throttler()
    private let reuseId = "SimpleCell"
    
    // Comment out
    // private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
        setupRx()
    }
    
    private func setupUi() {
        resultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseId)
        navigationItem.setHidesBackButton(true, animated: false)
        title = "Hello \(viewModel.userName ?? "N/A")"
    }
    
    private func setupRx() {
        // Perform viewModel bindings here
    }
    
    @IBAction func searchFieldDidType(_ sender: UITextField) {
        throttler.throttle { [weak self] in
            guard let self = self else { return }
            print("Throttled search..")
            self.results = self.viewModel.search(query: sender.text)
        }
    }
    
    @IBAction func didPressLogout(_ sender: UIButton) {
        viewModel.logout(completion: { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        })
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultsTableView.dequeueReusableCell(withIdentifier: reuseId) ?? UITableViewCell()
        cell.textLabel?.text = results[indexPath.row]
        
        return cell
    }
}
