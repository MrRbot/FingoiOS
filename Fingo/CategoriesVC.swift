//
//  CategoriesVC.swift
//  Fingo
//
//  Created by Javier on 28/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var catCollectionView: UICollectionView!
    
     let fingoText = FingoText()
     var catIndex:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 3.0
        layout.minimumInteritemSpacing = 0.0
        catCollectionView.delegate = self
        catCollectionView.dataSource = self
        catCollectionView.collectionViewLayout = layout
        
        
        loadCategories()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fingoText.catArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = catCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCell {
                cell.configCell(text:fingoText.catArray, index: indexPath.row)
            return cell
        }
        return CategoryCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (catCollectionView.frame.width / 2)   , height: catCollectionView.frame.height - 5.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        catIndex = indexPath.row
    }
    
    func loadCategories() {
        fingoText.clearCatArray()
        fingoText.requestCategories {
            self.catCollectionView.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "catSegue" {
            if let mainVC = segue.destination as? MainVC{
                
                let indexPaths  = catCollectionView.indexPathsForSelectedItems
                let indexPath = indexPaths![0] 

                mainVC.catToDisplay = fingoText.catArray[indexPath.row]
            }
            
        }
    }

}
