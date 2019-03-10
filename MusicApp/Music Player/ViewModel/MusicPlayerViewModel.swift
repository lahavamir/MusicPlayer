//
//  MusicPlayerViewModel.swift
//  MusicApp
//
//  Created by Amir lahav on 09/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import Foundation

class MusicPlayerViewModel: NSObject {
    
    private let musicModel:MusicModel
    
    init(musicModel:MusicModel) {
        self.musicModel = musicModel
    }
    
    private var trackUrl: String? {
        get {
            return "https://api.soundcloud.com/tracks/" + "\(musicModel.getTrackId())" + "/stream?client_id=\(clientId)"
        }
    }
    
    func getTrackURL() -> URL?
    {
        guard let url = trackUrl, let trackURL = URL(string: url) else { return nil }
        return trackURL
    }
    
    func getImageURL() -> URL?
    {
        
       let imageURL = musicModel.track.artworkURL ?? ""
       let url = URL(string: imageURL)
        
       return url
    }
}
