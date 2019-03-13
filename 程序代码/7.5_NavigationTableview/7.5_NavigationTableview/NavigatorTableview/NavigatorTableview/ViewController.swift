//
//  ViewController.swift
//  NavigatorTableview
//
//  Created by LiWei on 2016/11/25.
//  Copyright © 2016年 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var arrData: [String] = []        // 数据源数组
  var tableView: UITableView!
  
  // 定义导航元素项按钮
  var btnEdit: UIBarButtonItem!
  var btnFinish: UIBarButtonItem!
  //    var btnDelete: UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 数据源数组赋值
    for i in 1...60 {
      arrData.append("20151101\(i)")
    }
    
    // 构造TableView并设置代理
    tableView = UITableView(frame: self.view.bounds, style: .plain)
    tableView.delegate = self
    tableView.dataSource = self
    
    self.view.addSubview(tableView)
    
    //tableView.reloadData()
    
    // 构造导航元素项按钮
    btnEdit = UIBarButtonItem(title: "编辑", style: UIBarButtonItemStyle.plain, target: self, action: #selector(pressEdit))
    btnFinish = UIBarButtonItem(title: "完成", style: UIBarButtonItemStyle.plain, target: self, action: #selector(pressFinish))
    
    // 构造导航元素项，使用系统风格按钮
    let btnSys = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    
    // 设置导航元素项左侧按钮
    self.navigationItem.leftBarButtonItem = btnSys
    
    // 设置导航元素项右侧按钮
    self.navigationItem.rightBarButtonItem = btnEdit
    
    // 设置导航控制器标题
    self.navigationItem.title = "1班学生"
    
    // 修改navigationBar的背景颜色为黑色
    self.navigationController?.navigationBar.barTintColor = UIColor.black
    
    self.navigationController?.navigationBar.titleTextAttributes = {[NSForegroundColorAttributeName: UIColor.white]}()
    
    // 修改BarStyle
    self.navigationController?.navigationBar.barStyle = .blackTranslucent
  }
  
  // MARK: TableView Delegate
  // 设置TableView行数
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrData.count
  }
  
  // 设置每行单元格cell
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let strID = "Cell"      // 创建单元格ID，相同ID的单元格可以复用
    
    // 尝试复用单元格，如果复用不成功，创建新的单元格。
    var cell = tableView.dequeueReusableCell(withIdentifier: strID)
    if cell == nil {
      cell = UITableViewCell(style: .default, reuseIdentifier: strID)
    }
    
    // 设置单元格标题
    cell?.textLabel?.text = arrData[indexPath.row]
    return cell!
  }
  
  // 处于编辑状态下，单元格显示效果协议
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
    
    // 默认情况下，现实删除效果
    return UITableViewCellEditingStyle.delete
    
    // 添加状态
    //return UITableViewCellEditingStyle.insert
    
    // 空状态
    //return UITableViewCellEditingStyle.none
  }
  
  // 向右滑动显示编辑效果，只有实现这个协议，手指滑动就会弹出Delete按钮
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    // 判断是否为删除编辑
    if editingStyle == .delete {
      print("delete!")
      arrData.remove(at: indexPath.row)       // 从数据源数组中删除
      tableView.reloadData()                  // 重新加载数据
    }
    
    // 判断是否为插入编辑
    if editingStyle == .insert {
      print("insert")
      arrData.append("newData")               // 在数据源数组中添加
      tableView.reloadData()                  // 重新加载数据
    }
  }
  
  // 实现协议，当单元格被选中时执行
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = VCPerson()
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  
  // MARK: Actions
  func pressEdit() {
    self.navigationItem.rightBarButtonItem = btnFinish
    tableView.setEditing(true, animated: true)
  }
  
  func pressFinish() {
    self.navigationItem.rightBarButtonItem = btnEdit
    tableView.setEditing(false, animated: true)
  }
}

