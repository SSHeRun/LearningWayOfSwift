//
//  ViewController.swift
//  SQLite
//
//  Created by 李巍 on 2017/12/11.
//  Copyright © 2017年 李巍. All rights reserved.
//

import UIKit

struct StuInfo {
  var stuID: String
  var stuName: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tfStuID: UITextField!
  @IBOutlet weak var tfStuName: UITextField!
  @IBOutlet weak var tableView: UITableView!
  
  private var db: SQLiteDB!             // 数据库对象
  private var arrStu = [StuInfo]()      // 保存所有学生数据
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 打开数据库
    db = SQLiteDB.shared        // 获取数据库单例对象
    _ = db.openDB()             // 打开数据库
    
    readStuData()
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrStu.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let strCell = "cell"
    var cell = tableView.dequeueReusableCell(withIdentifier: strCell)
    if cell == nil {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: strCell)
    }
    
    cell?.textLabel?.text = arrStu[indexPath.row].stuName
    cell?.detailTextLabel?.text = arrStu[indexPath.row].stuID
    
    return cell!
  }
  
  @IBAction func btnAddAction(_ sender: UIButton) {
    let name = tfStuName.text!
    let id = tfStuID.text!
    
    if name == "" || id == "" {
      return
    }
    
    let sql = "insert into student(stuID, stuName) values('\(id)', '\(name)')"
    _ = db.execute(sql: sql)
    
    readStuData()
    tableView.reloadData()
  }
  
  func readStuData() {
    arrStu.removeAll()
    // 读取文件
    let sql = "select * from student"
    let data = db.query(sql: sql)
    for item in data {
      let id = item["stuID"] as! String
      let name = item["stuName"] as! String
      let si = StuInfo(stuID: id, stuName: name)
      arrStu.append(si)
    }
  }
}

