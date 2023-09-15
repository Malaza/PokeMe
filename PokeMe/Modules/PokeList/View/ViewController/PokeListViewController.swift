//
//  PokeListViewController.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeListViewProtocol {
    func showData()
}


class PokeListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var presenter: PokeListPresenterProtocol?
    
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorColor = .clear
        self.tableView.register(UINib(nibName: PokeListItemTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: PokeListItemTableViewCell.identifier)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PokeMe"
        self.setupTableView()
        self.fetchPokeList()
    }
    
    func fetchPokeList() {
        self.showLoadingView()
        self.presenter?.fetchPokeList(from: Constants.url)
    }
}


extension PokeListViewController: PokeListViewProtocol {
    
    func showData() {
        DispatchQueue.main.async {
            self.hideLoadingView()
            self.tableView.reloadData()
        }
    }
}


extension PokeListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: PokeListItemTableViewCell.identifier) as? PokeListItemTableViewCell {
            if let model = self.presenter?.pokemonAtIndex(index: indexPath.row) {
                cell.configureWith(model: model, index: indexPath.row + 1)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let model = self.presenter?.pokemonAtIndex(index: indexPath.row) {
            self.presenter?.router?.presentPokeDescriptionViewController(with: model.url ?? "")
        }
    }
}
