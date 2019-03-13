//
//  ViewController.swift
//  PickerView
//
//  Created by 李巍 on 2018/10/27.
//  Copyright © 2018 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var datepickerDepart: UIDatePicker!
    @IBOutlet weak var textfieldPeopleNum: UITextField!
    @IBOutlet weak var pickerDestination: UIPickerView!
    
    // 定义所需数据
    let arrProvince = ["四川省", "辽宁省", "广东省"]
    let dicCity = [0:["成都市", "德阳市", "绵阳市"], 1:["沈阳市", "大连市", "鞍山市"], 2:["广州市", "深圳市", "珠海市"]]
    
    var arrCitysForSelectProvince: [String]!    // 保存对应省份的城市
    var provinceIndex = 0
    var cityIndex = 0
    
    
    // 定义出行人数的选择器
    var pickerPeopleNum: UIPickerView!          // 出行人数的选择器
    
    // 定义工具条
    var toolBar: UIToolbar!     // 创建工具条
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置日期选择器
        datepickerDepart.locale = Locale(identifier: "zh")      // 设置时区
        //datepickerDepart.maximumDate
        datepickerDepart.datePickerMode = .date     // 指定日期选择器模式
        
        
        // 设置目标地点的代理
        pickerDestination.delegate = self
        pickerDestination.dataSource = self
        arrCitysForSelectProvince = dicCity[provinceIndex]
        
        // 创建工具条
        toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 40))
        let bbiPVDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pickerViewDone))
        let bbiFlexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [bbiFlexible, bbiPVDone]
        
        // 创建选择器
        pickerPeopleNum = UIPickerView(frame: CGRect(x: 0, y: Int(self.view.bounds.size.height) - 220, width: Int(self.view.bounds.size.width), height: 220))
        pickerPeopleNum.delegate = self
        pickerPeopleNum.dataSource = self
        
        
        // 设置文本域
        textfieldPeopleNum.inputView = pickerPeopleNum      // 输入视图为选择器
        textfieldPeopleNum.inputAccessoryView = toolBar     // 辅助输入视图
        textfieldPeopleNum.tintColor = UIColor.clear         // 清除光标
        
        
        
    }
    
    
    // MARK: Picker View datasource
    // 选择器列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == pickerDestination {        // 目标地点选择器
            return 2
        }
        
        if pickerView == pickerPeopleNum {          // 出行人数选择器
            return 1
        }
        
        return 1
    }
    
    // 设置每列行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerDestination {
            return 3
        }
        
        if pickerView == pickerPeopleNum {
            return 5
        }
        
        return 0
    }
    
    // 设置每行内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerDestination {    // 是目标地点选择器
            if component == 0 { // 设置第一列内容
                return arrProvince[row]
            } else if component == 1 {  // 设置第二列内容
                return arrCitysForSelectProvince[row]
            }
        }
        
        if pickerView == pickerPeopleNum {
            return "\(row + 1)"
        }
        
        return ""
    }
    
    // MARK: picker view delegate
    // 选中某行的回调方法
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerDestination {
            if component == 0 {         // 第一列省份
                provinceIndex = row     // 保存用户选择的省份索引
                arrCitysForSelectProvince = dicCity[row]        // 更新省份对应的城市数组
                pickerDestination.selectRow(0, inComponent: 1, animated: true)  // 将第二列行设为第一行
                pickerDestination.reloadComponent(1)    // 重新加载第二列
            } else if component == 1 {  // 第二列城市
                cityIndex = row         // 保存用户选择的城市索引
            }
        }
        
        if pickerView == pickerPeopleNum {
            textfieldPeopleNum.text = "\(row + 1)"
        }
    }
    
    // MARK: TextField Delegate
    
    
    // MARK: Toolbar functions
    @objc func pickerViewDone() {
        textfieldPeopleNum.resignFirstResponder()
    }
    
    
    // 完成按钮的目标动作方法
    @IBAction func btnDone(_ sender: Any) {
        var strInfo = "计划"  // 动作表提示信息
        
        // 格式化日期
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日"
        strInfo += df.string(from: datepickerDepart.date)
        
        strInfo += textfieldPeopleNum.text!
        
        strInfo += "人去"
        strInfo += arrProvince[provinceIndex]
        strInfo += arrCitysForSelectProvince[cityIndex]
        
        
        // 使用动作表和提醒显示，显示出行计划
        let alertCtrl = UIAlertController(title: "出行计划", message: strInfo, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "好", style: .cancel, handler: nil)
        alertCtrl.addAction(cancelAction)
        present(alertCtrl, animated: true, completion: nil)
    }
}

