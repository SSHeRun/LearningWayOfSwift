//
//  ViewController.swift
//  tableView
//
//  Created by LiWei on 2016/11/13.
//  Copyright © 2016年 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let LAYOUTTOP = CGFloat(20.0)
    var myTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let y = self.view.layoutMargins.top + LAYOUTTOP
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height - LAYOUTTOP - self.view.layoutMargins.top - self.view.layoutMargins.bottom
        
        // 创建一个TableView并添加到主视图
        let myTableView = UITableView(frame: CGRect(x: 0, y: y, width: width, height: height), style: .plain)
        
        myTableView.delegate = self                 // 设置TableView委托
        myTableView.dataSource = self               // 设置TableView数据源委托
        
        self.view.addSubview(myTableView)
    }

    // 设置行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // 设置每个行cell的内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let initIndentifier = "Cell"
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: initIndentifier)
        cell.accessoryType = .detailDisclosureButton
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "中国银行"                                       // 设置cell标题
            cell.imageView?.image = UIImage(named: "中国银行")                      // 设置cell图片
            cell.detailTextLabel?.text = "【中国银行】您有一笔100000.00元收入..."       // 设置cell详细信息
        }
        else if indexPath.row == 1 {
            cell.textLabel?.text = "微信运动"
            cell.imageView?.image = UIImage(named: "微信")
            cell.detailTextLabel?.text = "[应用信息]"
        }
        else if indexPath.row == 2 {
            cell.textLabel?.text = "华西第二医院"
            cell.imageView?.image = UIImage(named: "华西医院")
            cell.detailTextLabel?.text = "孕宝视频直播课程|四川大学华西第二医院..."
        } else if indexPath.row == 3 {
            cell.textLabel?.text = "订阅号"
            cell.imageView?.image = UIImage(named: "订阅号")
            cell.detailTextLabel?.text = "学术中国：高校替课成产业链：规模化经营震惊..."
        } else if indexPath.row == 4 {
            cell.textLabel?.text = "文件传输助手"
            cell.imageView?.image = UIImage(named: "文件传输助手")
            cell.detailTextLabel?.text = "[小视频]"
        }
        
        return cell
    }
    
    // 设置行选择的动作Action方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
    
    // 设置删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.myTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // 设置每行高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
}

