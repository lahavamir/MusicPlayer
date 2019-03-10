//
//  MusicModel.swift
//  MusicApp
//
//  Created by Amir lahav on 09/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import Foundation

class MusicModel: NSObject {
    
    let track:Track
    
    init(track:Track) {
        self.track = track
    }
    
    func getTrackId() -> String
    {
        return String(track.id)
    }
    
}
