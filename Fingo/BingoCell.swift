//
//  BingoCell.swift
//  Fingo
//
//  Created by Javier on 23/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import UIKit

protocol ItemTappedDelegate {
    func unicornTapped()
    func itemTapped(index: Int)
}

class BingoCell: UICollectionViewCell {
    
    @IBOutlet weak var bingoItemLabel: UILabel!
    
    var size:CGSize!
    
    var unicornIndex: Int!
    
    var delegate: ItemTappedDelegate?
    
    override func awakeFromNib() {
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 3.0
        self.layer.borderColor = UIColor(red: 66/255, green: 28/255, blue: 82/255, alpha: 1.0).cgColor
        
        UserDefaults.standard.set(true, forKey: "firstTimeUnicornPressed")
    }
    
    func configCell(text:[String], index: Int){
        unicornIndex = 12
        if index == unicornIndex {
           setUnicornImage()
          
        }
        
        self.bingoItemLabel.text = text[index]
        
        
    }
    
    func setSelectedState(index: Int) {
        
        size = self.frame.size
        self.bingoItemLabel.textColor = UIColor.white
        self.backgroundColor = UIColor(red: 66/255, green: 28/255, blue: 82/255, alpha: 1.0)
       
        
        UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            
            self.frame.size = CGSize(width: self.size.width + 2.0, height: self.size.height + 2.0)
            self.layoutIfNeeded()
        }) { (true) in
            self.frame.size = self.size
        }
       
        
        
        delegate?.itemTapped(index: index)
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
