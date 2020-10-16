//
//  SongListCell.swift
//  AppleSongs
//
//  Created by Petryk Dima on 03.09.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import UIKit
import Nuke

class SongListCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artworkImageView: ImageDisplayingView!
    
    var pixelSize: CGFloat {
        return artworkImageView.frame.size.height * UIScreen.main.scale
    }
    
    var resizedImageProcessors: [ImageProcessing] {
        let imageSize = CGSize(width: pixelSize, height: pixelSize)
        return [ImageProcessors.Resize(size: imageSize, contentMode: .aspectFill)]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupData(song: Song) {
        titleLabel?.text = song.collectionName
        
        if let artworkUrl = URL.init(string: song.artwork ?? "") {
            print(artworkUrl.absoluteURL)
            let request = ImageRequest(url: artworkUrl, processors: resizedImageProcessors)

            Nuke.loadImage(with: request, into: artworkImageView)
        }
    }
}
