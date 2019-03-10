//
//  ListCoordinator.swift
//
//  Created by Amir lahav on 31/01/2019.
//  Copyright © 2019 Amir lahav. All rights reserved.
//

import Foundation
import UIKit

class SearchCoordinator: Coordinator {
    
    var pressenter: UINavigationController
    private var searchContorller:SearchViewController?
    private var musicPlayerCooridnator:MusicPlayerCoordiantor?
    
    init(pressenter:UINavigationController) {
        self.pressenter = pressenter
    }
    
    private func setupNavigationBar()
    {
        
        // navigation bar properties
        pressenter.navigationBar.topItem?.title = "Search"
    }
    
    func start() {
        
//        // fake APIService can be inject to model
//        let mockService = MockAPIService()
//
        // real APIService
        let apiService = APIService()

        // api service injected to Model
        let tracks = TracksModel(apiService: apiService)

        // model Injected to View Model
        let searchViewModel = SearchViewModel(dataModel: tracks)
        
        // View Model inject to View Controller
        let search = SearchViewController(viewModel:searchViewModel)
        search.didSelect = didSelct
        
        // controller to pressenter
        pressenter.pushViewController(search, animated: false)

        // setup navigation properties
        setupNavigationBar()

        searchContorller = search
        
    }
    
    private func didSelct(track:Track)
    {
        // user select track from collection view
        // inject track to music player controller
        let musicCoordiantor = MusicPlayerCoordiantor(pressenter: pressenter, track:track)
        
        musicCoordiantor.start()
        
        self.musicPlayerCooridnator = musicCoordiantor
    }
        
}
