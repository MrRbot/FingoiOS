//
//  ViewController.swift
//  Fingo
//
//  Created by Javier on 22/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import UIKit


class MainVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ItemTappedDelegate {

     var indexArray = [Int]()
    var numberOfRows: CGFloat!
    
    let fingoText = FingoText()
    var catToDisplay:String!
    
    var filteredRow1 = [Int]()
    var filteredRow2 = [Int]()
    var filteredRow3 = [Int]()
    var filteredRow4 = [Int]()
    var filteredRow5 = [Int]()
    
    var filteredColumn1 = [Int]()
    var filteredColumn2 = [Int]()
    var filteredColumn3 = [Int]()
    var filteredColumn4 = [Int]()
    var filteredColumn5 = [Int]()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bingoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let layout = UICollectionViewFlowLayout()
        
        bingoCollectionView.delegate = self
        bingoCollectionView.dataSource = self
        bingoCollectionView.collectionViewLayout = layout
        
    
    }
    override func viewDidAppear(_ animated: Bool) {
        loadText()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fingoText.textArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = bingoCollectionView.dequeueReusableCell(withReuseIdentifier: "bingoCell", for: indexPath) as? BingoCell {

            cell.configCell(text: fingoText.textArray, index: indexPath.row)
            cell.delegate = self
            return cell
        }
        
        return BingoCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: bingoCollectionView.layer.bounds.width / (numberOfRows + 0.2 )  , height: bingoCollectionView.layer.bounds.height / (numberOfRows + 1) )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
       
        if let cell = bingoCollectionView.cellForItem(at: indexPath) as? BingoCell{
            if !cell.select {
               cell.setSelectedState(index:indexPath.row)
            } else {
                cell.setDeSelectState(index: indexPath.row)
            }
            
            
            //cell.isUserInteractionEnabled = false
            
        }
        
        
    }
    
    func unicornTapped() {
        
        
        if let firstTime = UserDefaults.standard.value(forKey: "firstTimeUnicornPressed") as? Bool {
            if  firstTime{
                let alert = UIAlertController(title: "Katie says you are a cheater", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "No!", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)
                
                UserDefaults.standard.set(false, forKey: "firstTimeUnicornPressed")
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let winVC = storyboard.instantiateViewController(withIdentifier: "winVCId") as! WinVC
                winVC.modalPresentationStyle = .overCurrentContext
                
                present(winVC, animated: true, completion: nil)
            }
        }
       
        
        
    }
    
    func itemTappedToDeSelect(index:Int) {
    
        switch index {
        case 0...4:
            filteredRow1.removeLast()
        case 5...9:
            filteredRow2.removeLast()
        case 10...14:
            filteredRow3.removeLast()
        case 15...19:
            filteredRow4.removeLast()
        case 20...24:
            filteredRow5.removeLast()
            
        default:
            break
        }
        
        
        
    }
    
    func itemTapped(index: Int) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let winVC = storyboard.instantiateViewController(withIdentifier: "winVCId") as! WinVC
        winVC.modalPresentationStyle = .overCurrentContext
        
        let alert = UIAlertController(title: "Katie says you didn't see:  \(fingoText.textArray[index])", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yeah, i did", style: .cancel, handler: nil))
        
        
        
        
        switch index {
        

        case 0...4:
        
            filteredRow1.append(index)
            if filteredRow1.count == 3  {
               
                present(alert, animated: true, completion: nil)
                
                print("3 IN A ROW")
            } else if filteredRow1.count == 5 {
                
                
                present(winVC, animated: true, completion: nil)

            }
        case 5...9:
            
             filteredRow2.append(index)
            if filteredRow2.count == 3  {
                
                present(alert, animated: true, completion: nil)
                
                print("3 IN A ROW")
            } else if filteredRow2.count == 5 {
                
                present(winVC, animated: true, completion: nil)
            }
        case 10...14:
           
             filteredRow3.append(index)
            if filteredRow3.count == 3 {

                present(alert, animated: true, completion: nil)
                print("3 IN A ROW")
                
            } else if filteredRow3.count == 5 {
                
                present(winVC, animated: true, completion: nil)
            }
        case 15...19:
            
             filteredRow4.append(index)
            if filteredRow4.count == 3 {
                
                present(alert, animated: true, completion: nil)

                print("3 IN A ROW")
            }
            else if filteredRow4.count == 5 {
                
                present(winVC, animated: true, completion: nil)
            }
        case 20...24:
            
            filteredRow5.append(index)
            if filteredRow5.count == 3 {
                
                present(alert, animated: true, completion: nil)
                
                print("3 IN A ROW")
            } else if filteredRow5.count == 5 {
                
                present(winVC, animated: true, completion: nil)
            }

        default:
            break
        }
        
        switch index {
        case  0,5,10,15,20:
            filteredColumn1.append(index)
            if filteredColumn1.count == 3  {
                
                present(alert, animated: true, completion: nil)
                
                print("3 IN A ROW")
            } else if filteredColumn1.count == 5 {
                
                
                present(winVC, animated: true, completion: nil)
                
            }
        case  1,6,11,16,21:
            filteredColumn2.append(index)
            if filteredColumn2.count == 3  {
                
                present(alert, animated: true, completion: nil)
                
                print("3 IN A ROW")
            } else if filteredColumn2.count == 5 {
                
                
                present(winVC, animated: true, completion: nil)
                
            }
        case  2,7,17,22:
            filteredColumn3.append(index)
            if filteredColumn3.count == 3  {
                
                present(alert, animated: true, completion: nil)
                
                print("3 IN A ROW")
            } else if filteredColumn3.count == 5 {
                
                
                present(winVC, animated: true, completion: nil)
                
            }
        case  3,8,13,18,23:
            filteredColumn4.append(index)
            if filteredColumn4.count == 3  {
                
                present(alert, animated: true, completion: nil)
                
                print("3 IN A ROW")
            } else if filteredColumn4.count == 5 {
                
                
                present(winVC, animated: true, completion: nil)
                
            }
        case  4,9,14,19,24:
            filteredColumn5.append(index)
            if filteredColumn5.count == 3  {
                
                present(alert, animated: true, completion: nil)
                
                print("3 IN A ROW")
            } else if filteredColumn5.count == 5 {
                
                
                present(winVC, animated: true, completion: nil)
                
            }
        default:
            break
        }
        
        
        
        
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func loadText(){
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        fingoText.clearTextArray()
        fingoText.requestFingoText(category: catToDisplay) {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidesWhenStopped = true
            self.numberOfRows = sqrt(CGFloat(self.fingoText.textArray.count))
            self.bingoCollectionView.reloadData()
        }
    }



}



