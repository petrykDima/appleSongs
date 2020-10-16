//
//  NukeSetups.swift
//  AppleSongs
//
//  Created by Petryk Dima on 16.10.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import Foundation
import Nuke
import UIKit

class NukeSetups {
    
    func installOptimization() {
        
        DataLoader.sharedUrlCache.diskCapacity = 0
            
        let pipeline = ImagePipeline {
          let dataCache = try? DataCache(name: "Personal.AppleSongs.datacache")
          dataCache?.sizeLimit = 200 * 1024 * 1024
          $0.dataCache = dataCache
        }

        ImagePipeline.shared = pipeline
        
        let contentModes = ImageLoadingOptions.ContentModes(
          success: .scaleAspectFill,
          failure: .scaleAspectFit,
          placeholder: .scaleAspectFit)

        ImageLoadingOptions.shared.contentModes = contentModes
        let placeholder = UIImage(named: "ImageLoading")
        ImageLoadingOptions.shared.placeholder = placeholder
        ImageLoadingOptions.shared.failureImage = placeholder
        ImageLoadingOptions.shared.transition = .fadeIn(duration: 0.5)
        
    }

}
