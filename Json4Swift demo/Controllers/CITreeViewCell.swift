//
//  CITreeViewCell.swift
//  Json4Swift demo
//
//  Created by Abdullah Alhaider on 3/16/18.
//

import UIKit

class CITreeViewCell: UITableViewCell {
    
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    let leadingValueForChildrenCell:CGFloat = 8
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(level:Int)
    {
        self.leadingConstraint.constant = leadingValueForChildrenCell * CGFloat(level + 1)
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.height / 2
        switch level {
        case 0:
            self.avatarImageView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        case 1:
            self.avatarImageView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case 2:
            self.avatarImageView.backgroundColor = UIColor.blue
        default:
            self.avatarImageView.backgroundColor = UIColor.black
        }
        
        self.layoutIfNeeded()
    }
    
    func getRandomColor() -> UIColor{
        
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
