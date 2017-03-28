//
//  ViewController.swift
//  Fingo
//
//  Created by Javier on 22/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ItemTappedDelegate {

     var indexArray = [Int]()
    var numberOfRows: CGFloat!
    
    let fingoText = FingoText()
    
    var filteredRow1 = [Int]()
    var filteredRow2 = [Int]()
    var filteredRow3 = [Int]()
    var filteredRow4 = [Int]()
    var filteredRow5 = [Int]()
    
    @IBOutlet weak var BingoCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        BingoCollectionView.delegate = self
        BingoCollectionView.dataSource = self
        BingoCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
       
        
        fingoText.requestFingoText {
            self.numberOfRows = sqrt(CGFloat(self.fingoText.textArray.count))
            self.BingoCollectionView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fingoText.textArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = BingoCollectionView.dequeueReusableCell(withReuseIdentifier: "bingoCell", for: indexPath) as? BingoCell {

            cell.configCell(text: fingoText.textArray, index: indexPath.row)
            cell.delegate = self
            return cell
        }
        
        return BingoCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: BingoCollectionView.layer.bounds.width / (numberOfRows + 0.1 )  , height: BingoCollectionView.layer.bounds.height / (numberOfRows + 1) )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
       
        if let cell = BingoCollectionView.cellForItem(at: indexPath) as? BingoCell{
            cell.setSelectedState(index:indexPath.row)
            cell.isUserInteractionEnabled = false
            
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
        
        
        
        
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }



}



