//
//  NewCategoryCVView.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import Foundation
import UIKit

class NewCategoryCVViewController:UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout {
    
    var collectionView          : UICollectionView!
    var flowLayout              : ColumnFlowLayout!
    var onSelectColumn : ((_ indexPath: IndexPath) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func setUp(){
        flowLayout = ColumnFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionView.center           = self.view.center
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(collectionView)
        
        self.collectionView.register(UINib(nibName: NewsCategoryView.className, bundle: nil), forCellWithReuseIdentifier: NewsCategoryView.className)
        self.collectionView.register(NewsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NewsHeaderView.className)
      
        
        collectionView.delegate        = self
        collectionView.dataSource      = self
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: NewsCategoryView.className, for: indexPath) as! NewsCategoryView
        cell.imageVw = UIImageView()
        cell.layerView.tag = 999 + indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.onSelectColumn?(indexPath)
        selectAnimate(indexPath)
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: DetailedNewsViewController.className) as! DetailedNewsViewController
        self.navigationController?.pushViewController(vc, animated:true)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/2 - 16, height: 190.0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NewsHeaderView.className, for: indexPath) as! NewsHeaderView
             sectionHeader.label.text = "Daily FX News"
             return sectionHeader
        } else { //No footer in this case but can add option for that
             return UICollectionReusableView()
        }
    }
    
  
   
    fileprivate func selectAnimate(_ indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3, animations: {
            self.collectionView.cellForItem(at: indexPath)?.viewWithTag(999 + indexPath.row)?.backgroundColor = UIColor.gray
        }) { (true) in
            UIView.animate(withDuration: 0.3, animations: {
                self.collectionView.cellForItem(at: indexPath)?.viewWithTag(999 + indexPath.row)?.backgroundColor = UIColor.white
            })
        }
    }
}

