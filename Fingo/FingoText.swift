//
//  FingoText.swift
//  Fingo
//
//  Created by Javier on 26/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import Foundation
import Firebase



class FingoText {
   
   private var _ref: FIRDatabaseReference?
   private var  _dataBaseHandle: FIRDatabaseHandle?
    
   private var _textArray = [String]()
    
    var textArray: [String] {
       
      
        return _textArray
    }
    
    func requestFingoText(completed:@escaping completion) {
    
        _ref = FIRDatabase.database().reference()
    
     
        
        _ref?.observe(FIRDataEventType.value, with: { (snapshot) in
            
            if let value = snapshot.value as? NSArray{
                print(value)
                
                for item in value {
                    self._textArray.append(item as! String)
                    
                }
                self._textArray.shuffle()
                self._textArray.insert("PROSTIE", at: 12)
                print(self._textArray)
                completed()
                
                
            }
           
        })
    
    }
    
    
    
    
    

}

extension Array {
    mutating func shuffle () {
        for i in (0..<self.count).reversed() {
            let ix1 = i
            let ix2 = Int(arc4random_uniform(UInt32(i+1)))
            (self[ix1], self[ix2]) = (self[ix2], self[ix1])
        }
    }
}
