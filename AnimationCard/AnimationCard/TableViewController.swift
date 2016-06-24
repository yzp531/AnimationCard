//
//  TableViewController.swift
//  AnimationCard
//
//  Created by 刘海东 on 16/6/22.
//  Copyright © 2016年 simon. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    //图片数据源
    var dataArray : [String] = [String]()

    ///懒加载瀑布流
    lazy var tableView : UITableView = {
        
        let tableView = UITableView.init(frame: CGRect.init(origin: CGPoint.zero, size: self.view.bounds.size), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor =  UIColor.white()
        return tableView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white()
        
        for var i in 0...13 {
            dataArray.append("00" + "\(i)" + ".jpg")
        }
        
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "cellID"
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        let backImageView = UIImageView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: SCREEN_WINDTH, height: 130.0)))
        cell.contentView.addSubview(backImageView)
        backImageView.image = UIImage.init(named: dataArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    


}
