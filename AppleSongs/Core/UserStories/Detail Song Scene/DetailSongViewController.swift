//
//  DetailSongViewController.swift
//  AppleSongs
//
//  Created by Petryk Dima on 03.09.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import UIKit
import Nuke

class DetailSongViewController: UIViewController, Xibbed {
    
    internal weak var coordinator: ListCoordinator?
    var viewModel: DetailViewModelProtocol = DetailViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songArtworkImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSongInfoUI()
    }
    
    func setupSongInfoUI() {
        songTitleLabel.text = viewModel.song?.collectionName ?? "No Name"
        
        setupArtwork()
    }
    
    func setupArtwork() {
        
        songArtworkImageView.contentMode = .scaleAspectFill
        songArtworkImageView.image = ImageLoadingOptions.shared.failureImage
        
        guard let artworkURL = URL.init(string: viewModel.song?.artwork ?? "") else {
            return
        }

        ImagePipeline.shared.loadImage(with: artworkURL, completion: { [weak self] response in
            switch response {
            case .failure:
                self?.songArtworkImageView.image = ImageLoadingOptions.shared.failureImage
            case let .success(imageResponse):
                self?.songArtworkImageView.image = imageResponse.image
            }
        })
    }
    
}
