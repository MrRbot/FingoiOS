//
//  WinVC.swift
//  Fingo
//
//  Created by Javier on 23/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import UIKit

class WinVC: UIViewController {

    @IBOutlet weak var wonLabel: UILabel!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    @IBOutlet weak var unicornImageView: UIImageView!
    
    @IBOutlet weak var unicornHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var unicornWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        unicornHeightConstraint.constant = 20.0
        unicornWidthConstraint.constant = 30.0
        self.view.layoutIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
            self.leftConstraint.constant = 100.0
            self.unicornHeightConstraint.constant = 120.0
            self.unicornWidthConstraint.constant = 130.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playAgainPressed(_ sender: Any) {
       UserDefaults.standard.set(true, forKey: "firstTimeUnicornPressed")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
