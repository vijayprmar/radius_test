//
//  PropertyListTableViewCell.swift
//  Radius_test
//
//  Created by Vijay Parmar on 29/06/23.
//

import UIKit

class PropertyListTableViewCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(data:PropertyListOption?,facilityId:String,isSelected:Bool){
        imgIcon.image = UIImage(named: data?.icon ?? "")
        lblTitle.text = data?.name ?? ""
        contentView.backgroundColor = isSelected ?  UIColor.lightGray : .white
     
    }

    
    
}
