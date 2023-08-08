//
//  RootViewController.swift
//  Lab2week3
//
//  Created by Afrah Faisal on 22/01/1445 AH.
//

import Foundation
import UIKit
import SnapKit
class RootViewController :UIViewController  {
    
    var collectionView : UICollectionView = .init(frame: .zero , collectionViewLayout: UICollectionViewLayout())
    
    let myarray : Array<String> = [
        "U.S Politics",
        "Tech Campanies",
        "TV & Movies",
        "Recipes",
        "Travel",
        "Celebs",
        "Resturants"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
       
        self.title = "Personalize your feed "
    }
  
    
    func configurecategoriesBar(){
        let layout = UICollectionViewFlowLayout()
        collectionView = .init(frame: .zero , collectionViewLayout : layout)
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        layout.scrollDirection = .horizontal
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self , forCellWithReuseIdentifier: "cell")
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.top.equalTo(50)
            $0.width.equalTo(self.view.frame.width-32)
            $0.height.equalTo(50)
            $0.leading.equalTo(16)
        }
    }
    
}

extension RootViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
   func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myarray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath)
        let lable = UILabel()
                lable.text = myarray[indexPath.item]
                lable.textAlignment = .center
                //        lable.tintColor = .blue
                //        lable.backgroundColor = .orange
                cell.addSubview(lable)
                lable.snp.makeConstraints {
                    $0.leading.top.trailing.bottom.equalTo(cell)
                }
                cell.backgroundColor = .gray.withAlphaComponent(0.2)
                cell.layer.cornerRadius = 5
        return cell
    }
}
