//
//  PokeDescriptionTableViewCell.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/11.
//

import UIKit

class PokeDescriptionTableViewCell: UITableViewCell {

    static let identifier = "PokeDescriptionTableViewCell"
    
    
    //MARK: - Outlets
    @IBOutlet weak var pokeimageView: UIImageView!
    
    @IBOutlet weak var attributeZero: UILabel! {
        didSet {
            attributeZero.numberOfLines = 0
            attributeZero.font = UIFont.systemFont(ofSize: 30)
        }
    }
    
    @IBOutlet weak var attributeOne: UILabel! {
        didSet {
            attributeOne.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var attributeTwo: UILabel! {
        didSet {
            attributeTwo.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var attributeThree: UILabel! {
        didSet {
            attributeThree.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var attributeFour: UILabel! {
        didSet {
            attributeFour.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var attributeFive: UILabel! {
        didSet {
            attributeFive.numberOfLines = 0
        }
    }
    
    
    //MARK: - Lifecycle
    func configureWithModel(model: PokemonModel) {
        self.pokeimageView.loadImage(url: model.spriteUrl ?? "")
        self.attributeZero.text = model.name?.capitalized
        self.attributeOne.attributedText = self.attributedStringForTitle(title: "Order", subTitle: model.order)
        self.attributeTwo.attributedText = self.attributedStringForTitle(title: "Height", subTitle: model.height)
        self.attributeThree.attributedText = self.attributedStringForTitle(title: "weight", subTitle: model.weight)
        self.attributeFour.attributedText = self.attributedStringForTitle(title: "Base Experience", subTitle: model.baseExperience)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK: - Helper methods
    func attributedStringForTitle(title:String, subTitle:String?) -> NSAttributedString {

        let attrHeading:NSMutableAttributedString
        let attrContent:NSMutableAttributedString
        let mainAttributedString = NSMutableAttributedString()

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.paragraphSpacing = 4.0

        attrHeading = NSMutableAttributedString(string: title)
        let range = NSRange.init(location: 0, length: title.count)
        attrHeading.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15.0, weight: .semibold), range: range)
        attrHeading.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range)
        mainAttributedString.append(attrHeading)

        if let subTitle = subTitle {
            let stringFormat = String(format: "\n\(subTitle)")
            attrContent = NSMutableAttributedString(string: stringFormat)
            let thisRange = NSRange.init(location: 0, length: stringFormat.count)
            attrContent.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 13.0, weight: .medium), range: thisRange)
            attrContent.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: thisRange)
            mainAttributedString.append(attrContent)
        }
        mainAttributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle,
                                          range: NSRange.init(location: 0, length: mainAttributedString.length))

        return mainAttributedString
    }
}
