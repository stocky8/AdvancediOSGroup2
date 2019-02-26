//
//  ImageViewController.swift
//  AdvancediOSGroup2
//
//  Created by Benjamin Miles on 2/24/19.
//  Copyright © 2019 Benjamin Miles. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ImageCell"
private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
private let itemsPerRow: CGFloat = 3
private var images: [UIImage] = []
private let SegueLargeImageViewController = "LargeImageViewController"

class ImageViewController: UICollectionViewController {
    
    struct imageData {
        let imagesArray: [UIImage]
        let selected: Int
    }
    
    
    @IBAction func photoButton(_ sender: UIBarButtonItem) {
        takePhotoWithCamera()
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == SegueLargeImageViewController {
            
             let destinationViewController = segue.destination as! LargeImageViewController
            destinationViewController.images = images

            let indexes = collectionView.indexPathsForSelectedItems?.first
            destinationViewController.index = indexes?.row
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = images.remove(at: sourceIndexPath.item)
        images.insert(temp, at: destinationIndexPath.item)
    }
    
}

extension ImageViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK:- Image helper Methods
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType  = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        images.append(info[UIImagePickerController.InfoKey.editedImage] as! UIImage)
        dismiss(animated: true, completion: nil)
        self.collectionView?.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension ImageViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
        
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! ImagePhotoCell
        
        let image = photo(for: indexPath)
        cell.backgroundColor = .white

        cell.imageView.image = image
        
        return cell
    }
    
}

// MARK: - Private
private extension ImageViewController {
    func photo(for indexPath: IndexPath) -> UIImage {

        return images[indexPath.row]
    
    }
}

// MARK: - Collection View Flow Layout Delegate
extension ImageViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}


