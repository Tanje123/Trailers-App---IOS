//
//  MovieTableViewCell.swift
//  MovieTrailer-500782152
//
//  Created by Jasdeep on 04-05-19.
//  Copyright © 2019 Tanveer. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import Kingfisher

final class MovieTableViewCell: UITableViewCell {
   
    @IBOutlet weak var TrailerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var trailer: MovieTrailer? {
        didSet {
            nameLabel.text = trailer?.title
            
            if let imageURLString = trailer?.posterImage {
                let url = URL(string: imageURLString)
                TrailerImage.kf.setImage(with: url)
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.text = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        TrailerImage.image = nil
    }
}


