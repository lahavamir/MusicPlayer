//
//  MusicPlayerViewController + Player.swift
//  MusicApp
//
//  Created by Amir lahav on 09/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import Foundation
import AVFoundation


// responable for audio player
extension MusicPlayerViewController
{
    
    private func isPlaying() -> Bool {
        return player?.rate != nil && player?.rate != 0
    }
    
    // imageview delegate
    // user press on image
    // music should start
    func didTap() {
        play()
    }
    
    func loadTrack() {
        
        // load player with track url
        if let url = viewModel.getTrackURL() {
            player = AVPlayer(url: url)
            addObserver()
        }
    }
    
    func reset()
    {
        self.player?.pause()
        self.playBtn?.setTitle("Play", for: .normal)
        self.player?.seek(to: CMTime.zero)
    }

    
    @objc func play()
    {
        if isPlaying() {
            self.playBtn?.setTitle("Play", for: .normal)
            player?.pause()
        } else {
            self.playBtn?.setTitle("Pause", for: .normal)
            player?.play()
        }
    }
    
    
    func addObserver() {
        
        let intervel : CMTime = CMTimeMake(value: 1, timescale: 1)
        observer = player?.addPeriodicTimeObserver(forInterval: intervel, queue: DispatchQueue.main) { [weak self] time in
            
            guard let `self` = self, let playerItem = self.player?.currentItem else { return }
            
            let currentTime : Float64 = CMTimeGetSeconds(time)
            let totalDuration = CMTimeGetSeconds(playerItem.asset.duration)
            
            // slider value update.
            let sliderValue = (currentTime/totalDuration)
            
            if currentTime >= totalDuration {
                // reseting the song to begining
                self.reset()
            }
            
            let playbackLikelyToKeepUp = self.player?.currentItem?.isPlaybackLikelyToKeepUp
            if playbackLikelyToKeepUp == false{
                
                //start the activity indicator
                self.indicator?.startAnimating()
            } else {
                
                //stop the activity indicator, and updating slider
                self.indicator?.stopAnimating()
                self.slider?.setValue(Float(sliderValue), animated: false)
            }
        }
    }
}
