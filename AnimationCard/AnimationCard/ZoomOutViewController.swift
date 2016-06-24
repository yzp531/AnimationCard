
///卡片效果

import UIKit

class ZoomOutViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    
    
    var dataArray : [String] = [String]()
    
    
    ///layOut
    lazy var layOut : ZoomOutLayout = {
        let layOut = ZoomOutLayout.init()
        return layOut
    }()
    
    ///瀑布流
    lazy var collectionView: UICollectionView  = {
        let collectionView = UICollectionView.init(frame: CGRect.init(origin: CGPoint.zero , size: CGSize.init(width: SCREEN_WINDTH, height: SCREEN_HEIGHT)), collectionViewLayout: self.layOut)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.backgroundColor = UIColor.gray()
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for var i in 0...19 {
            dataArray.append("00" + "\(i)" + ".jpg")
        }
        
        
        self.view.addSubview(collectionView)
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        let imageView = UIImageView.init(frame: cell.contentView.bounds)
        cell.contentView.addSubview(imageView)
        imageView.image = UIImage.init(named: dataArray[indexPath.row])
        imageView.contentMode = .scaleAspectFit
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
