//
//  TQYRLoginController.swift
//  news
//
//  Created by 天桥艺人 on 2017/8/28.
//  Copyright © 2017年 天桥艺人. All rights reserved.
//

import UIKit

class TQYRLoginController: UIViewController{
    @IBOutlet weak var rightSpot: UIImageView!
    @IBOutlet weak var leftSpot: UIImageView!
    @IBOutlet weak var rightHand: UIImageView!
    @IBOutlet weak var leftHand: UIImageView!
    @IBOutlet weak var usernameTextFile: UITextField!
    var leftHandFrame = CGRect.init()
    var rightHandFrame = CGRect.init()
    var leftSpotFrame = CGRect.init()
    var rightSpotFrame = CGRect.init()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.leftHandFrame = self.leftHand.frame
        self.rightHandFrame = self.rightHand.frame
        self.leftSpotFrame = self.leftSpot.frame
        self.rightSpotFrame = self.rightSpot.frame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func endInputPwd(_ sender: UITextField) {
      
        
    }

    @IBAction func changePwd(_ sender: UITextField) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func beginInputPwd(_ sender: UITextField) {
    
       
            UIView.animate(withDuration: 0.7) {
                
                self.leftSpot.frame = CGRect.init(x: -10, y: 200, width: self.leftSpot.frame.size.width, height: self.leftSpot.frame.size.height);
                
                self.rightSpot.frame = CGRect.init(x:500, y:200, width:self.rightSpot.frame.size.width, height:self.rightSpot.frame.size.height);
                
                self.leftHand.frame = CGRect.init(x:130, y:140, width:self.leftHand.frame.size.width, height:self.leftHand.frame.size.height);
                self.rightHand.frame = CGRect.init(x:200, y:140, width:self.rightHand.frame.size.width, height:self.rightHand.frame.size.height);
            }
    }
    
    @IBAction func beginInputUserName(_ sender: UITextField) {
        UIView.animate(withDuration: 0.7) {
            self.leftSpot.frame = CGRect.init(x:50, y: 150, width: self.leftSpot.frame.size.width, height: self.leftSpot.frame.size.height);
            
            self.rightSpot.frame = CGRect.init(x:230, y:150, width:self.rightSpot.frame.size.width, height:self.rightSpot.frame.size.height);
            
            self.leftHand.frame = CGRect.init(x:70, y:200, width:self.leftHand.frame.size.width, height:self.leftHand.frame.size.height);
            self.rightHand.frame = CGRect.init(x:260, y:200, width:self.rightHand.frame.size.width, height:self.rightHand.frame.size.height);
        }
    }
    

}
