//
//  TracksModel.swift
//
//  Created by Amir lahav on 08/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import Foundation


class TracksModel: NSObject {
    
    let service:APIServiceProtocol
    
    init(apiService:APIServiceProtocol) {
        service = apiService
    }
    
    func fetchTracks(request:RequestData, complition:@escaping (([Track])->()), errorHandler:@escaping ((APIError)->()))
    {
        
        service.fetch(request: request, type: Track.self) {[weak self] (resulat) in
            switch resulat{
            case .succes(let tracks):
                complition(tracks)
            case .error(let error):
                errorHandler(error)
            }
        }
    }
}
