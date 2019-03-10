//
//  MusicPlayerViewController.swift
//  MusicApp
//
//  Created by Amir lahav on 09/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import UIKit
import Cartography
import AVFoundation

class MusicPlayerViewController: UIViewController, ArtViewDelegate {
        
    // MARK: - var

    
    // properties
    var observer:Any?
    var player:AVPlayer?
    let viewModel:MusicPlayerViewModel

    
    
    // views
    fileprivate var artView: ArtView?
    var slider:UISlider?
    var playBtn:UIButton?
    var indicator:UIActivityIndicatorView?

    
    // initiation
    init(viewModel:MusicPlayerViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .white
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - life cycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
        loadTrack()
        // Do any additional setup after loading the view.
    }
    
    
    func commonInit()
    {
        
        // initiation all views and assign autolayouts
        
        /// initiation art view
        let artView = ArtView(frame: CGRect.zero)
        artView.delegate = self
        artView.backgroundColor = .gray
        view.addSubview(artView)
        artView.load(imageURL:viewModel.getImageURL())
        self.artView = artView
        
        // art view autolayout
        constrain(view,artView){(view, art) in
            
            
            art.top             == view.top + 88
            art.height          == 156
            art.width           == 156
            art.centerX         == view.centerX
        }
        
        
        // initiation play button
        let playBtn = UIButton(frame: CGRect(x: 0, y: 200, width: 50, height: 33))
        playBtn.setTitle("Play", for: .normal)
        playBtn.setTitleColor(.black, for: .normal)
        playBtn.addTarget(self, action: #selector(self.play), for: .touchUpInside)
        view.addSubview(playBtn)
        self.playBtn = playBtn

        
        // play button auto layot
        constrain(view, playBtn){ (view, btn ) in
            
            btn.bottom      == view.bottom - 48
            btn.centerX     == view.centerX
        }
        
        
        // initiation uislider
        let slider = UISlider(frame: CGRect.zero)
        // not dragable
        let image = UIImage()
        slider.setThumbImage(image, for: .normal)
        slider.isUserInteractionEnabled = false
        view.addSubview(slider)
        self.slider = slider
        
        
        
        // slider auto layout
        constrain(artView, slider) { (view, slider) in
            
            slider.top      == view.bottom + 24
            slider.width    == 250
            slider.centerX  == view.centerX
        }

        
        let indicator = UIActivityIndicatorView(style: .gray)
        view.addSubview(indicator)
        self.indicator = indicator

        
        // indicator auto layout
        constrain(view, indicator){ (view, indicator) in
            
            indicator.center    == view.center
        }
        
    }
    
    
    deinit {
        print("deinit \(self)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        observer = nil
        player?.pause()
        player = nil
    }

}



