//
//  PokeListViewController.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeListViewProtocol {
    func fetchPokeList()
    func reloadData()
}


class PokeListViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //MARK: - Variables
    var presenter: PokeListPresenterProtocol?
    
    
    //MARK: - Setup
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: PokeListItemTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: PokeListItemTableViewCell.identifier)
    }
    
    private func setupSearchBar() {
        self.searchBar.delegate = self
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.fetchPokeList()
    }
}


extension PokeListViewController: PokeListViewProtocol {
    
    func fetchPokeList() {
        Task.init {
            let request = PokeListRequest(url: Constants.pokemon, limit: 100)
            await self.presenter?.fetchPokeList(request: request)
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
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
                cell.configureWith(model: model)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Transition to detail screen
    }
}


extension PokeListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count > 2 {
            self.presenter?.searchWithQuery(query: searchText)
        }
    }
}
