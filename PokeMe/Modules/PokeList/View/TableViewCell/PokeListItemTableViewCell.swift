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
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    //MARK: - Lifecycle
    func configureWith(model: PokemonItemModel, index: Int) {
        self.thumbnailImageView.loadImage(url: Constants.spriteUrl + "\(index).png")
        self.titleLabel.text = model.name?.capitalized
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
