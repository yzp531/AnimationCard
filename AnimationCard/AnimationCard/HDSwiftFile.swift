//
//  HDSwiftFile.swift
//  WeiBo
//
//  Created by 刘海东 on 16/6/7.
//  Copyright © 2016年 simon. All rights reserved.
//

import Foundation
import UIKit

/// 宽度
let SCREEN_WINDTH = UIScreen.main().bounds.size.width
/// 高度
let SCREEN_HEIGHT = UIScreen.main().bounds.size.height

/// Dlog
public func Dlog<T>(message:T,fileName: String = #file,methodName: String = #function, lineNumber:Int = #line){
    #if DEBUG
    print("\([ (fileName as NSString).pathComponents.last!])  \(methodName) \([lineNumber]): \(message)")
    #endif
}

public func getNamespace() -> String{
    guard let name = Bundle.main().infoDictionary!["CFBundleExecutable"] as? String else{
        return "命名空间失败"
    }
    return name
}
