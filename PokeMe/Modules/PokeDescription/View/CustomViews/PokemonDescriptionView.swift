//
//  PokemonDescriptionView.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/15.
//

import UIKit

class PokemonDescriptionView: UIView {
    
    let identifier = "PokemonDescriptionView"
    
    @IBOutlet weak var pokeimageView: UIImageView!
    
    @IBOutlet weak var attributeOne: UILabel! {
        didSet {
            attributeOne.numberOfLines = 0
            attributeOne.font = UIFont.systemFont(ofSize: 30)
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
    
    
    var contentView: UIView?

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.identifier, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func configureDescriptionView(model: PokemonModel) {
        self.pokeimageView.loadImage(url: model.spriteUrl ?? "")
        self.attributeOne.text = model.name?.capitalized
        self.attributeTwo.attributedText = self.attributedStringForTitle(title: "Order", subTitle: model.order)
        self.attributeThree.attributedText = self.attributedStringForTitle(title: "Height", subTitle: model.height)
        self.attributeFour.attributedText = self.attributedStringForTitle(title: "weight", subTitle: model.weight)
        self.attributeFive.attributedText = self.attributedStringForTitle(title: "Base Experience", subTitle: model.baseExperience)
    }
    
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
