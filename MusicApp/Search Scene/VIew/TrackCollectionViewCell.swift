//
//  TrackCollectionViewCell.swift
//  MusicApp
//
//  Created by Amir lahav on 08/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var trackImg: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackDesc: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
        commonInit()
    }

    
    private func commonInit()
    {
        trackImg.layer.cornerRadius = 22
        trackImg.clipsToBounds = true
    }
    
    func bind(data:PresentTrackViewModel)
    {
        // bind PresentTrackViewModel object
        trackTitle.text = data.title
        trackDesc.text = data.duration
    }
    
    
    override func prepareForReuse() {
        trackTitle.text = ""
        trackDesc.text = ""
        trackImg.image = nil
    }
    
}
