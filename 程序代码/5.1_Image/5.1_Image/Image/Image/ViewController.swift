//
//  ViewController.swift
//  Image
//
//  Created by 李巍 on 2018/11/7.
//  Copyright © 2018 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageView: UIImageView!     // 声明图像视图

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Thread.sleep(forTimeInterval: 2.0)  // 休眠主线程，用于显示启动界面
        
        imageView = UIImageView(frame: CGRect(x: (self.view.bounds.size.width - 200.0) / 2.0, y: 100, width: 200, height: 200))
        imageView.layer.cornerRadius = imageView.bounds.size.width / 2.0    // 圆角矩形
        imageView.layer.masksToBounds = true
        self.view.addSubview(imageView)
        
        // 创建按钮
        let button = UIButton(frame: CGRect(x: 20, y: 350, width: self.view.bounds.size.width - 40.0, height: 30))
        button.setTitle("请选择头像", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.blue, for: UIControlState.highlighted)    // 设置按钮按下的颜色
        button.addTarget(self, action: #selector(btnSelectImage), for: UIControlEvents.touchDown)
        self.view.addSubview(button)
    }
    
    @objc func btnSelectImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        // imagePickerController.allowsEditing = true
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // ------------------------------------------------------------------------
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage  // 获取选择的图片对象
        
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)    // 关闭模态对话框
    }
}

