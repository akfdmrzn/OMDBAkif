//
//  FilmDetailTableViewCell.swift
//  OMDBAkif
//
//  Created by Akif on 23.12.2018.
//  Copyright © 2018 Akif. All rights reserved.
//

import UIKit

class FilmDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDirector: UILabel!
    
    
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
    func configureWithItem(data : ResponseModelFilm){
        self.labelGenre.text = data.genre ?? ""
        self.labelTitle.text = data.title ?? ""
        self.labelDirector.text = data.director ?? ""
    }
    
    
}
