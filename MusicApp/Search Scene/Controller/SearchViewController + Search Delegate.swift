//
//  SearchViewController + Search Delegate.swift
//  MusicApp
//
//  Created by Amir lahav on 09/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController:UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        // make sure we not searching empty string
        if !searchText.isEmpty {
            viewModel.fetchTracks(userInput: searchText)
        }
    }
}
