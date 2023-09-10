//
//  PokeListItemTableViewCell.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokeListItemTableViewCell: UITableViewCell {

    static let identifier = "PokeListItemTableViewCell"
    
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //MARK: - Lifecycle
    func configureWith(model: PokemonModel) {
        self.titleLabel.text = model.name?.capitalized
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}