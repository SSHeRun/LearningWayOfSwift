//
//  VCContacter.swift
//  Contacter
//
//  Created by 李巍 on 2018/11/29.
//  Copyright © 2018年 LW. All rights reserved.
//

import UIKit

class VCContacter: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // 学生数据
    var stuData: [String: String] = ["2014110232":"宋天刚", "2015110230":"秦先雨", "2015110255":"赵艺蓬", "2016070740":"肖益成", "2016080417":"何润", "2016090441":"魏琴", "2016110201":"奥布力亚森·奥布力", "2016110202":"曹俊", "2016110203":"陈波", "2016110204":"陈鸿琦", "2016110205":"陈加兰", "2016110208":"迪丽娜依·特麦尔江", "2016110209":"董雅蓓", "2016110210":"范晓翠", "2016110211":"韩家辉", "2016110212":"何强", "2016110214":"胡兰雨", "2016110215":"黄薛蓉", "2016110216":"蒋海兵", "2016110218":"雷华洪", "2016110219":"冷佳泞", "2016110220":"李晨雪", "2016110221":"李露", "2016110222":"李竹", "2016110223":"刘丹", "2016110224":"刘珈銘", "2016110225":"刘瑞", "2016110226":"刘颜", "2016110227":"刘雨", "2016110228":"刘雨霜", "2016110230":"马洁", "2016110231":"马若兰", "2016110232":"努尔古·阿卜杜热西提", "2016110233":"潘俊池", "2016110234":"潘俊宏", "2016110235":"邱洁琳", "2016110236":"邵天友", "2016110237":"沈怡", "2016110238":"史茜茜", "2016110239":"宋清云", "2016110241":"唐玉贤", "2016110242":"文莉", "2016110243":"吴唐美", "2016110245":"肖粮", "2016110246":"肖硕", "2016110247":"徐琪", "2016110248":"颜兆洁", "2016110249":"杨苹", "2016110250":"姚俊青", "2016110251":"余江垚", "2016110252":"余鑫", "2016110253":"袁政伟", "2016110254":"曾辛", "2016110255":"翟越", "2016110256":"詹梦芸", "2016110257":"张洪瑞", "2016110258":"赵双红", "2016110259":"仲治宇", "2016110260":"周萌", "2016110261":"周茜梅", "2016110262":"邹鑫"
    ]
    var arrLastNameAlphabet = ["A", "C", "D", "F", "H", "J", "L", "M", "N", "P", "Q", "S", "T", "W", "X", "Y", "Z"]
    
    var dicMapID: [String: [String]] = ["A": ["2016110201"], "C": ["2016110202", "2016110203", "2016110204", "2016110205"], "D":["2016110208", "2016110209"], "F": ["2016110210"], "H": ["2016080417", "2016110211", "2016110212", "2016110214", "2016110215"], "J": ["2016110216"], "L": ["2016110218", "2016110219", "2016110220", "2016110221", "2016110222", "2016110223", "2016110224", "2016110225", "2016110226", "2016110227", "2016110228"], "M":["2016110230", "2016110231"], "N":["2016110232"], "P":["2016110233", "2016110234"], "Q": ["2015110230", "2016110235"], "S": ["2014110232", "2016110236", "2016110237", "2016110238", "2016110239"], "T": ["2016110241"], "W": ["2016090441", "2016110242", "2016110243"], "X": ["2016070740", "2016110245", "2016110246", "2016110247"], "Y": ["2016110248", "2016110249", "2016110250", "2016110251", "2016110252", "2016110253"], "Z": ["2015110255", "2016110254", "2016110255", "2016110256", "2016110257", "2016110258", "2016110259", "2016110260", "2016110261", "2016110262"]]
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建表视图
        tableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        // 设置导航控制器
        // 设置导航控制器标题
        self.navigationItem.title = "通讯录"
        
        // 修改导航控制器背景颜色为黑色
        //self.navigationController?.navigationBar.barStyle = .black  // 设置导航条背景为黑色风格
        //self.navigationController?.navigationBar.barTintColor = UIColor.black       // 设置导航条背景为黑色
        //self.navigationController?.navigationBar.titleTextAttributes = {[NSAttributedString.Key.foregroundColor: UIColor.white]}()  // 设置文字为白色
        
        // 构造导航元素项按钮
        let btnNCAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ncAddBtnAction))
        // 设置导航元素项右侧按钮
        self.navigationItem.rightBarButtonItem = btnNCAdd
    }
    
    // 构造导航元素项按钮目标动作方法
    @objc func ncAddBtnAction() {
        dicMapID["L"]?.append("20150015")
        stuData["20150015"] = "李巍"
        tableView.reloadData()
    }
    
    
    // MARK: Data source delegate
    // Section数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrLastNameAlphabet.count
    }
    
    // 每节标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrLastNameAlphabet[section]
    }
    
    // 每节行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = arrLastNameAlphabet[section]
        return dicMapID[key]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cell_id"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        
        let lastNameAlphabet = arrLastNameAlphabet[indexPath.section]
        let arrIDs = dicMapID[lastNameAlphabet]!
        let strID = arrIDs[indexPath.row]
        let strName = stuData[strID]
        
        cell?.textLabel?.text = strName
        cell?.detailTextLabel?.text = strID
        
        cell?.accessoryType = .disclosureIndicator
        
        let strImageIndex = String(strID.suffix(2))
        let imageHeader = UIImage(named: strImageIndex)
        cell?.imageView?.image = imageHeader
        
        return cell!
        
    }
    
    // 节高
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // 选中某行
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 获取联系人所需的信息
        let lastNameAlphabet = arrLastNameAlphabet[indexPath.section]
        let arrIDs = dicMapID[lastNameAlphabet]!
        let strID = arrIDs[indexPath.row]
        let strName = stuData[strID]
        
        let strImageIndex = String(strID.suffix(2))
        let imageHeader = UIImage(named: strImageIndex)
        
        // 构造联系人详情视图控制器VCContacterDetail对象
        let vcContacterDetail = VCContacterDetail()
        vcContacterDetail.strName = strName
        vcContacterDetail.strID = strID
        vcContacterDetail.imageHeader = imageHeader
        self.navigationController?.pushViewController(vcContacterDetail, animated: true)
    }
}
