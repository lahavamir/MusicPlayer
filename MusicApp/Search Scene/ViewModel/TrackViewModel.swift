//
//  PresentTrackViewModel.swift
//  MusicApp
//
//  Created by Amir lahav on 08/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewModelProtocol:class {
    func update()
}

class SearchViewModel: NSObject {
    
    private let dataModel:TracksModel
    private var tracks:[Track] = []
    
    var numberOfTracks:Int = 0

    weak var delegate:SearchViewModelProtocol?
    
    private var presentableTracks:[PresentTrackViewModel] = []
    {
        didSet{
            delegate?.update()
            numberOfTracks = presentableTracks.count
        }
    }
    
    init(dataModel:TracksModel) {
        self.dataModel = dataModel
    }
    
    func fetchTracks(userInput:String)
    {
        
        // search parameters
        let param:[String:String] = ["client_id":"7447cc9b363c40c4bd203aef5f0410e6",
                                     "q":"\(userInput)"]
        
        // build data request
        let requestData = RequestData(baseURL:  baseURL, path: trackPath, method: .get, headers: [:], param: RequesParametres.url(param))
        
        // quary tracks from soundcloud services
        dataModel.fetchTracks(request: requestData, complition: {[weak self] (tracks) in
            self?.tracks = tracks.map { return $0 }
            self?.parse(tracks: tracks)
        }) { (error) in
            // update user ui with error
        }
        
    }
    
    // convarte track struct to presentable data
    private func parse(tracks:[Track])
    {
        self.presentableTracks = tracks.map({ (track)  in
            return PresentTrackViewModel(title: track.title, imageURL: track.artworkURL ?? "", duration: track.duration.msToSeconds.minuteSecondMS)
        })
    }
    
    // get track for player controller
    func getTrack(at indexPath:IndexPath) -> Track?
    {
        if indexPath.row < tracks.count {
            return tracks[indexPath.row]
        }else{
            return nil
        }
    }
    
    // get presentable track data at indexpath
    func getPresentableTrack(at indexPath:IndexPath) -> PresentTrackViewModel?
    {
        if indexPath.row < tracks.count {
            return presentableTracks[indexPath.row]
        }else{
            return nil
        }
    }
    
}








struct PresentTrackViewModel {
    let title:String
    let imageURL:String
    let duration:String
}
