//
//  CategoriesVC.swift
//  Fingo
//
//  Created by Javier on 28/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,ItemTappedDelegate {

    @IBOutlet weak var catCollectionView: UICollectionView!
    
     let fingoText = FingoText()
     var catIndex:Int!
    var previousSelectedCell:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
    
        catCollectionView.delegate = self
        catCollectionView.dataSource = self
        catCollectionView.collectionViewLayout = layout
        catCollectionView.isScrollEnabled = false
        
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
                cell.delegate = self
            return cell
        }
        return CategoryCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: catCollectionView.frame.width / (5.2), height: catCollectionView.frame.height / 6.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        catIndex = indexPath.row
        
        if let cell = catCollectionView.cellForItem(at: indexPath) as? CategoryCell{
           
            if !cell.select {
                
                if previousSelectedCell != nil {
                    if let cellToDeselect = catCollectionView.cellForItem(at: NSIndexPath(item: previousSelectedCell, section: 0) as IndexPath) as? CategoryCell {
                        cellToDeselect.setDeSelectState(index: previousSelectedCell)
                    }
                }
                
                cell.setSelectedState(index:indexPath.row)
                previousSelectedCell = indexPath.row
            } else {
                
                
                cell.setDeSelectState(index: indexPath.row)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        self.catIndex = indexPath.row
        
        
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
    
    func itemTapped(index: Int) {
        self.catIndex = index
    }
    func itemTappedToDeSelect(index: Int) {
        self.catIndex = nil
    }
    
    func unicornTapped() {
        self.catIndex = 12
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if catIndex != nil {
            return true
        } else {
            let alert = UIAlertController(title: "", message: " You need to select one category!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            return false
        }
        
    }
    
    
    
    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "catSegue" {
            if let mainVC = segue.destination as? MainVC{
                
               
                    if catIndex == 12 {
                        mainVC.catToDisplay = "Classic"
                    } else {
                        mainVC.catToDisplay = fingoText.catArray[catIndex]
                    }
                
            }
        }
    }

}
