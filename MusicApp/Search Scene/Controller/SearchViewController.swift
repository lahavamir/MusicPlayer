//
//  SearchViewController.swift
//  MusicApp
//
//  Created by Amir lahav on 08/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import UIKit
import Cartography

class SearchViewController: UIViewController {
    
    //MARK: - varb
    
    // closure call to coordinator
    open var didSelect:(Track)->() = { _ in }
    

    // views
    var songListCollectionView:UICollectionView? = nil
    var searchController:UISearchController? = nil
    var searchBar:UISearchBar? = nil
    
    // proporties
    let viewModel:SearchViewModel
    
    
    //MARK: - life cycle
    
    init(viewModel:SearchViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        commonInit()

    }

    deinit {
        print("deinit \(self)")
    }
    
    
    private func commonInit()
    {
        // init search bar
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.placeholder = "Search Your favorite music"
        navigationItem.titleView = searchBar
        self.searchBar = searchBar
        
        
        // standard collection view layot
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        
        
        // init resoult collection view
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(TrackCollectionViewCell.self)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        self.songListCollectionView = collectionView
        
        
        // collection view autolayot
        constrain(view, collectionView) { (view, collection) in
            
            collection.left         == view.left
            collection.right        == view.right
            collection.top          == view.top
            collection.bottom       == view.bottom

        }
        
        
        
    }

}

