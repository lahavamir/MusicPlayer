//
//  ArtView.swift
//  MusicApp
//
//  Created by Amir lahav on 09/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import UIKit

protocol ArtViewDelegate:class {
    func didTap()
}

class ArtView: UIImageView {

    weak var delegate:ArtViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // add gesture recognizer to art work view
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.didTap))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func load(imageURL:URL?)
    {
        guard let url = imageURL else {
            return
        }
        self.downloaded(from: url)
    }
    
    
    @objc func didTap()
    {
        delegate?.didTap()
        print("tap me")
    }

}
