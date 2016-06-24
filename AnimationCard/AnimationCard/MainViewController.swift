//
//  MainViewController.swift
//  AnimationCard
//
//  Created by 刘海东 on 16/6/20.
//  Copyright © 2016年 simon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    
    var tableView = UITableView()
    var vcArray = ["TableViewController","ZoomOutViewController","TransverseViewController"]
    var vcNameArray = ["普通效果","卡片效果","横向效果"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView = UITableView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: SCREEN_WINDTH, height: SCREEN_HEIGHT)), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vcArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "cellID"
        
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        cell.textLabel?.text = vcNameArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc:AnyClass? = NSClassFromString(getNamespace() + "." + vcArray[indexPath.row])
        
        guard let vcClass = vc as? UIViewController.Type else {
            
            return
        }
        
        let viewController = vcClass.init()
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
