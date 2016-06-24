
///弹簧效果

import UIKit

class TransverseViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    ///布局
    lazy var transverseLayout: TransverseLayout = {
        let transverseLayout = TransverseLayout.init()
        return transverseLayout
    }()
    
    let cellID = "cellID"

    var dataArray : [String] = [String]()

    
    lazy var collectionView : UICollectionView = {
    
        let collectionView = UICollectionView.init(frame: CGRect.init(origin: CGPoint.zero, size: self.view.bounds.size), collectionViewLayout: self.transverseLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.gray()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: self.cellID)
        
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for var i in 0...3 {
            dataArray.append("a00" + "\(i)" + ".jpg")
        }
        
        self.view.addSubview(self.collectionView)
    
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        let imageView = UIImageView.init(frame: cell.contentView.bounds)
        cell.contentView.addSubview(imageView)
        imageView.image = UIImage.init(named: dataArray[indexPath.row])
        imageView.backgroundColor = UIColor.white()
        return cell
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
}
