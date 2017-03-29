//
//  CategoryCell.swift
//  Fingo
//
//  Created by Javier on 28/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    func configCell(text:[String], index: Int){
       
        self.categoryLabel.text = text[index]
        
        
    }
    
}
