//
//  DetailViewController.swift
//  MovieTrailer-500782152
//
//  Created by Jasdeep on 04-05-19.
//  Copyright © 2019 Tanveer. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
import Kingfisher

class DetailViewController: UIViewController {
    @IBOutlet weak var titel: UILabel!
    
    @IBOutlet weak var watchButtom: UIButton!
    @IBOutlet weak var stillImage: UIImageView!
    
    @IBOutlet weak var posterPicture: UIImageView!
    @IBOutlet weak var omsch: UILabel!
    
    
    var movieTrailer: MovieTrailer?;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titel.text = movieTrailer?.title;
        watchButtom.setTitle(NSLocalizedString("Watch the trailer", comment: "") , for: .normal )
        omsch.text = movieTrailer?.description;
        let url = URL(string: (movieTrailer?.stillImage)!)
        stillImage.kf.setImage(with: url)
        
        let posterURL = URL(string: (movieTrailer?.posterImage)!)
       posterPicture.kf.setImage(with: posterURL)
    
    }
    
    @IBAction func onClick(_ sender: Any) {
        let videoURL = URL(string: (movieTrailer?.url)!)
        let player = AVPlayer(url: videoURL!);
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
  
    }
    
    @IBAction func onLongPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let activityVC = UIActivityViewController(activityItems: [movieTrailer?.url as Any], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            
            self.present(activityVC, animated: true, completion: nil)
        }
    }
}

    
    

