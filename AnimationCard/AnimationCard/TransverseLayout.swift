//
//  TransverseLayout.swift
//  AnimationCard
//
//  Created by 刘海东 on 16/6/22.
//  Copyright © 2016年 simon. All rights reserved.
//

import UIKit

class TransverseLayout: UICollectionViewFlowLayout {

    
    
    let intervalX:CGFloat = 50.0
    let navBarMaxY:CGFloat = 64.0
    
    var itemWidth: CGFloat = SCREEN_WINDTH - 100
    var itemHeight: CGFloat = SCREEN_HEIGHT - 100 - 64
    
    
    override func prepare() {
        super.prepare()
        self.itemSize = CGSize.init(width: self.itemWidth, height:  self.itemHeight)
        self.sectionInset = UIEdgeInsetsMake(50, 50, 50, 50)
        self.minimumLineSpacing = 50
        self.minimumInteritemSpacing = 50
        self.scrollDirection = .horizontal
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        ///获取屏幕上可见cell的rect
        let superAttributes = super.layoutAttributesForElements(in: rect)
        ///可见的矩阵
        var visiableRect = CGRect.init()
        visiableRect.origin = (self.collectionView?.contentOffset)!
        visiableRect.size = (self.collectionView?.bounds.size)!
        let midX = visiableRect.midX
        
        for attributes in superAttributes! {
            
            if visiableRect.intersects(attributes.frame) {
                ///如果是存在导航条时候，屏幕的center会下降。
                let distance = attributes.center.x - midX - (64.0/2.0)
                let scale = distance/(itemWidth)
                let scaleX = 1 - 0.3 * fabs(scale)
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
    
    
    ///实现中间的item总会停留在垂直中间
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        //获取对应的index
        let value = (proposedContentOffset.x)/(itemWidth + intervalX)
        var tempProposedContentOffset = proposedContentOffset
        tempProposedContentOffset.x = (itemWidth + intervalX) * round(value)
        return tempProposedContentOffset
    }
}
