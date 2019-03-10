//
//  SearchViewController + Delegate.swift
//  MusicApp
//
//  Created by Amir lahav on 08/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController:UICollectionViewDataSource,SearchViewModelProtocol
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel.numberOfTracks < 11 ? 11 : viewModel.numberOfTracks
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCollectionViewCell.uniqueIdentifier, for: indexPath) as? TrackCollectionViewCell else { return UICollectionViewCell() }
        
        // get view model data and bind them to cell
        guard let track = viewModel.getPresentableTrack(at: indexPath) else {
            // return empty cell
            cell.trackImg.backgroundColor = .white
            return cell
        }
        
        cell.bind(data: track)
        if let url = URL(string: track.imageURL){
            // load track image
            cell.trackImg.downloaded(from: url)
        }
        
    
        
        return cell
    }
    

    
    
    
    
    func update() {
        // update table view with tracks result
        DispatchQueue.main.async {[weak self] in
            self?.songListCollectionView?.reloadData()
        }
    }
    
    
}
