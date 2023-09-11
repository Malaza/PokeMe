//
//  PokeDescriptionViewController.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeDescriptionViewProtocol {
    func fetchPokeDescription()
    func showData()
}

class PokeDescriptionViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Variables
    var presenter: PokeDescriptionPresenterProtocol?
    var url: String?
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: PokeListItemTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: PokeListItemTableViewCell.identifier)
    }
    
    
    //MAARK: - Lifecycle
    convenience init(url: String?) {
        self.init()
        self.url = url
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchPokeDescription()
    }
}


extension PokeDescriptionViewController: PokeDescriptionViewProtocol {
    
    func fetchPokeDescription() {
        Task.init {
            let request = PokeDescriptionRequest(url: self.url)
            await self.presenter?.fetchPokeDescription(request: request)
        }
    }
    
    func showData() {
        self.tableView.reloadData()
    }
}


extension PokeDescriptionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: PokeDescriptionTableViewCell.identifier) as? PokeDescriptionTableViewCell {
//            if let model = self.presenter?.pokemonAtIndex(index: indexPath.row) {
//                cell.configureWith(model: model)
                return cell
//            }
        }
        return UITableViewCell()
    }
}
