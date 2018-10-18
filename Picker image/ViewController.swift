//
//  ViewController.swift
//  Picker image
//
//  Created by Iqbal Dwi Nur Khoirul anam on 18/10/18.
//  Copyright © 2018 iqbal project. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPickImage(_ sender: UIButton) {
        // extend Imagepicker ke delegate
        let picker = UIImagePickerController()
        picker.delegate = self
        
        // menampilkan pilihan menggunakan
        // Camera atau
        // gallery
        let alert = UIAlertController(title: "Information", message: "picker the image", preferredStyle: UIAlertControllerStyle.alert)
        
        let aksiCamera = UIAlertAction(title: "Camera", style: .default) { (camera) in
            
            
            //cek kamera tersedia atau tidak
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                
                //akses kamera
                picker.sourceType = .camera
                self.present(picker, animated: true, completion: nil)
            } else {
                print("Camera not availabel")
            }
            
            
        }
        // menambahkan alert ke gallery
        let aksiGallery = UIAlertAction(title: "Galerry", style: .default) { (Gallery) in
            
            //agar bisa mengakses galerry
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
            
        }
        // menambahkan aksi ke alert
        alert.addAction(aksiCamera)
        alert.addAction(aksiGallery)
        // menampilkan alert
        present(alert, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        let hasil = info[UIImagePickerControllerOriginalImage]
        image.image = (hasil as! UIImage)
        
    }
}










