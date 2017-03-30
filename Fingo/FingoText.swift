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
   private var _catArray = [String]()
    
    var textArray: [String] {
       
      
        return _textArray
    }
    var catArray: [String] {
        
        
        return _catArray
    }
    
    
    func requestFingoText(category:String, completed:@escaping completion) {
    
        _ref = FIRDatabase.database().reference()
    
     
        
        _ref?.observe(FIRDataEventType.value, with: { (snapshot) in
            
                self.clearTextArray()
            if let dict = snapshot.value as? Dictionary<String,AnyObject> {
                    self._textArray = []
                if let items = dict[category] as? Dictionary<String,AnyObject> {
                    var i = 0
                    for _ in items {
                        if let itm = items["\(i)"] as? String {
                            self._textArray.append(itm)
                            
                            i += 1
                            
                        }
                    }
                    if let unicorn = items["unicorn"] as? String {
                        self._textArray.shuffle()
                        self._textArray.insert(unicorn, at: 12)
                        print(unicorn)
                    }
                    
                    print(self._textArray)
                    print(self._textArray.count)
                    
                    completed()
                }
                
            }
            

           
        })
    
    }
    
    func requestCategories(completed:@escaping completion) {
        _ref = FIRDatabase.database().reference()
        
        
        
        _ref?.observe(FIRDataEventType.value, with: { (snapshot) in
                self.clearCatArray()
           
            for group in snapshot.children {
                self._catArray.append((group as AnyObject).key)
            }
            print(self._catArray)
                    
                    completed()
            
            
            
            
        })
    }
    
    
    func clearTextArray() {
        _textArray = []
    }
    func clearCatArray() {
        _catArray = []
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
