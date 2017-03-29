//
//  CategoryCell.swift
//  Fingo
//
//  Created by Javier on 28/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    
    var size:CGSize!
    
    var unicornIndex: Int!
    var select = false
    var delegate: ItemTappedDelegate?
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    func configCell(text:[String], index: Int){
       
        self.categoryLabel.text = text[index]
        
         unicornIndex = 12
         if index == unicornIndex {
         setUnicornImage()
         
         }
        
    }
    
    func setSelectedState(index: Int) {
        if !select {
            select = true
            
            size = self.frame.size
            self.categoryLabel.textColor = UIColor.white
            self.backgroundColor = UIColor(red: 66/255, green: 28/255, blue: 82/255, alpha: 1.0)
            
            
            UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
                
                self.frame.size = CGSize(width: self.size.width + 2.0, height: self.size.height + 2.0)
                self.layoutIfNeeded()
            }) { (true) in
                self.frame.size = self.size
            }
            
            
            
            
            
            
            delegate?.itemTapped(index: index)
            
        }
        
    }
    
    func setDeSelectState(index: Int){
        if select  {
            select = false
            size = self.frame.size
            self.categoryLabel.textColor = UIColor(red: 66/255, green: 28/255, blue: 82/255, alpha: 1.0)
            self.backgroundColor = UIColor.white
            
            
            UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
                
                self.frame.size = CGSize(width: self.size.width + 2.0, height: self.size.height + 2.0)
                self.layoutIfNeeded()
            }) { (true) in
                self.frame.size = self.size
            }
            
            delegate?.itemTappedToDeSelect(index: index)
        }
        
        
    }
    
     func setUnicornImage() {
     let unicornImg = UIImage(named: "unicorn")
     let imageView = UIImageView(image: unicornImg)
     imageView.contentMode = .scaleToFill
     
     let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(tapGestureRecognizer:)))
     imageView.isUserInteractionEnabled = true
     imageView.addGestureRecognizer(tapGestureRecognizer)
     
     imageView.translatesAutoresizingMaskIntoConstraints = false
     
     
     
     self.addSubview(imageView)
     
     imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
     imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
     imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
     imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
     
     
     
     
     
     }
    
    func handleTap(tapGestureRecognizer: UITapGestureRecognizer) {
        
        delegate?.unicornTapped()
    }
    
}
