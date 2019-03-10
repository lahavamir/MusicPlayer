//
//  MusicPlayerCoordiantor.swift
//  MusicApp
//
//  Created by Amir lahav on 09/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import Foundation
import UIKit


class  MusicPlayerCoordiantor: Coordinator {
    
    var pressenter: UINavigationController
    weak var musicPlayerViewController:MusicPlayerViewController?
    let track:Track
    
    init(pressenter:UINavigationController, track:Track) {
        self.pressenter = pressenter
        self.track      = track
    }
    
    
    func start() {
        
        let musicModel = MusicModel(track:track)
        
        let musicViewModel = MusicPlayerViewModel(musicModel:musicModel)
        
        let vc = MusicPlayerViewController(viewModel: musicViewModel)
        vc.title = track.title
        
        pressenter.pushViewController(vc, animated: true)
        
        self.musicPlayerViewController = vc
        
    }
    
    
}
