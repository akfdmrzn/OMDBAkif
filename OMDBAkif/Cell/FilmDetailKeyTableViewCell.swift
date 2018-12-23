//
//  FilmDetailKeyTableViewCell.swift
//  OMDBAkif
//
//  Created by Akif on 23.12.2018.
//  Copyright © 2018 Akif. All rights reserved.
//

import UIKit

class FilmDetailKeyTableViewCell: UITableViewCell {

    @IBOutlet weak var labelKey: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    
    
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil)   }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureWithItem(keys : String, value : String){
        self.labelKey.text = keys
        self.labelValue.text = value
    }
    
}
