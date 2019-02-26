//
//  PhotoGalleryCollectionViewController.swift
//  GroupProject
//
//  Created by Derik Sarauer on 2/21/19.
//  Copyright © 2019 CVTC Derik Sarauer. All rights reserved.
//

import UIKit
import AVFoundation

private let reuseIdentifier = "Cell"

class PhotoGalleryCollectionViewController: UICollectionViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

}



