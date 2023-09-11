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
        self.tableView.separatorColor = .clear
        self.tableView.register(UINib(nibName: PokeDescriptionTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: PokeDescriptionTableViewCell.identifier)
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
        self.setUpNavigationBar(title: Constants.appTitle, backButton: true)
        self.setupTableView()
        self.fetchPokeDescription()
    }
}


extension PokeDescriptionViewController: PokeDescriptionViewProtocol {
    
    func fetchPokeDescription() {
        Task.init {
            self.showLoadingView()
            let request = PokeDescriptionRequest(url: self.url)
            await self.presenter?.fetchPokeDescription(request: request)
        }
    }
    
    func showData() {
        DispatchQueue.main.async {
            self.hideLoadingView()
            self.tableView.reloadData()
        }
    }
}


extension PokeDescriptionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: PokeDescriptionTableViewCell.identifier) as? PokeDescriptionTableViewCell {
            if let model = self.presenter?.pokemonObject() {
                cell.configureWithModel(model: model)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
