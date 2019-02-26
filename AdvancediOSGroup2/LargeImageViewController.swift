//
//  LargeImageViewController.swift
//  AdvancediOSGroup2
//
//  Created by Benjamin Miles on 2/25/19.
//  Copyright © 2019 Benjamin Miles. All rights reserved.
//

import UIKit

class LargeImageViewController: UIViewController {
    
    var images : [UIImage]!
    var index : Int!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .scaleAspectFit
        
        if index != nil {
            imageView.image = images[index]
        }

    }

}
