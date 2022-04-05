//
//  ImagePickerDelegate.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/05.
//

import UIKit

public protocol ImagePickerDelegate: AnyObject{
    func imageDidSelect(_ image : UIImage)
}

public final class ImagePickerDelegateProxy : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    public weak var delegate: ImagePickerDelegate?
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let possible = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            delegate?.imageDidSelect(possible)
        }else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            delegate?.imageDidSelect(possibleImage)
        }
        picker.dismiss(animated: true)
    }
}

