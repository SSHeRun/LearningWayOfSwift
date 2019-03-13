//
//  ViewController.swift
//  Image
//
//  Created by 李巍 on 2017/11/2.
//  Copyright © 2017年 李巍. All rights reserved.
//

import UIKit

class VCPerson: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor.white
    
    self.navigationItem.title = "个人信息"
    
    Thread.sleep(forTimeInterval: 3.0)
    
    imageView = UIImageView(frame: CGRect(x: (self.view.bounds.size.width - 200.0) / 2.0, y: 100, width: 200, height: 200))
    imageView.layer.cornerRadius = imageView.bounds.size.width / 2.0
    imageView.layer.masksToBounds = true
    self.view.addSubview(imageView)
    
    let button = UIButton(frame: CGRect(x: 20, y: 350, width: self.view.bounds.size.width - 40.0, height: 30))
    button.setTitle("请选择头像", for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    button.setTitleColor(UIColor.blue, for: UIControlState.highlighted)
    button.addTarget(self, action: #selector(btnSelectImage), for: UIControlEvents.touchDown)
    self.view.addSubview(button)
  }
  
  @objc func btnSelectImage() {
    let imagePickerController = UIImagePickerController()
    imagePickerController.sourceType = .photoLibrary
    imagePickerController.delegate = self
    present(imagePickerController, animated: true, completion: nil)
  }
  
  // ------------------------------------------------------------------------
  // MARK: UIImagePickerControllerDelegate
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    
    imageView.image = selectedImage
    dismiss(animated: true, completion: nil)
  }
}

