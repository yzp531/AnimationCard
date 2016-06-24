//
//  ZoomOutLayout.swift
//  AnimationCard
//
//  Created by 刘海东 on 16/6/20.
//  Copyright © 2016年 simon. All rights reserved.
//

import UIKit

class ZoomOutLayout: UICollectionViewFlowLayout {

    let intervalY:CGFloat = 50.0
    let navBarMaxY:CGFloat = 64.0
    
    var itemWidth: CGFloat = 0.0
    var itemHeight: CGFloat = 0.0
    
    override func prepare() {
        itemWidth = SCREEN_WINDTH - 2 * 20.0
        ///计算高度 一屏显示三个、
        itemHeight = (SCREEN_HEIGHT - 4 * intervalY - navBarMaxY)/3.0
        
        self.itemSize = CGSize.init(width:itemWidth, height:itemHeight)
        ///行距
        self.minimumLineSpacing = intervalY
        ///间距
        self.minimumInteritemSpacing = 20
        self.sectionInset = UIEdgeInsetsMake(50, 20, 50,  20)
        super.prepare()

    }

    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        ///获取屏幕上可见cell的rect
        let superAttributes = super.layoutAttributesForElements(in: rect)
        
        ///可见的矩阵
        var visiableRect = CGRect.init()
        visiableRect.origin = (self.collectionView?.contentOffset)!
        visiableRect.size = (self.collectionView?.bounds.size)!
        let midY = visiableRect.midY
        
        //对当前屏幕中的UICollectionViewLayoutAttributes逐个与屏幕中心进行比较计算
        for attributes in superAttributes! {
            //找出在屏幕显示的才计算 减少不必要的消耗
            if visiableRect.intersects(attributes.frame) {

                ///如果是存在导航条时候，屏幕的center会下降。所以就要减去导航条的一半。偏移多少
                let distance = attributes.center.y - midY - (navBarMaxY/2.0)
                ///比例大小
                let scale = distance/(itemHeight)
                ///宽度的比例大小
                let scaleX = 1 - 0.1 * fabs(scale)
                ///缩放函数 x，y，z缩放
                attributes.transform3D = CATransform3DMakeScale(scaleX, scaleX, 1)
                var alpha = CGFloat()
                if fabs(scale)>1 {
                    alpha = 0.4
                }else{
                    alpha = 1.0
                }
                attributes.alpha = alpha
            
            }
        }
        return superAttributes
        
    }
    ///告诉collection view滚动时，调用prepareLayout()来重新计算每一个item的位置。
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        
        return true
    }
    
    ///实现中间的item总会停留在垂直中间
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let value = (proposedContentOffset.y + navBarMaxY)/(itemHeight + intervalY)
        var tempProposedContentOffset = proposedContentOffset
        tempProposedContentOffset.y = ( -navBarMaxY) + (itemHeight + intervalY) * round(value)
        return tempProposedContentOffset
    }

}
