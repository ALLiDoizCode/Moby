//
//  IDScannerViewController.swift
//  Moby
//
//  Created by Jonathan on 3/22/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import AVFoundation

class IDScannerViewController:UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var idImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ImagePicker = UIImagePickerController()
        ImagePicker.delegate = self
        ImagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(ImagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        idImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    

}
