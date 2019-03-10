//
//  SearchViewController + DataSource.swift
//
//  Created by Amir lahav on 08/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import UIKit

extension SearchViewController:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let track = viewModel.getTrack(at:indexPath) else {
            return
        }
        // user select track
        // callback to coordinator with closure
        didSelect(track)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scroll")
        
        // remove keyboard when user start scrolling
        searchBar?.resignFirstResponder()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // adjust cell size
        return CGSize(width: view.frame.width, height: 60)
        
    }
    

}
