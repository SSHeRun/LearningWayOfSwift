//
//  ViewController.swift
//  TableViewMultiSections
//
//  Created by LiWei on 2016/11/18.
//  Copyright © 2016年 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        //隐藏多余的cell分割线
        myTableView.tableFooterView = UIView()
        
        // 设置背景颜色
        myTableView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    }
    
    // 设置TableView的节（Section）数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    // 设置节高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    // 分别设置每节的cell数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    
    // 返回每个行的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "朋友圈"
            cell.imageView?.image = UIImage(named: "朋友圈")
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "扫一扫"
                cell.imageView?.image = UIImage(named: "扫一扫")
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "摇一摇"
                cell.imageView?.image = UIImage(named: "摇一摇")
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "附近的人"
                cell.imageView?.image = UIImage(named: "附近的人")
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "漂流瓶"
                cell.imageView?.image = UIImage(named: "漂流瓶")
            }
        } else if indexPath.section == 3 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "购物"
                cell.imageView?.image = UIImage(named: "购物")
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "游戏"
                cell.imageView?.image = UIImage(named: "游戏")
            }
        }
        return cell
    }
    
    //添加每节标题
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "社交"
//        } else if section == 1 {
//            return "发现"
//        } else if section == 2 {
//            return "交友"
//        } else {
//            return "生活"
//        }
//    }
    
    // 设置每行高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35.0
    }
}

