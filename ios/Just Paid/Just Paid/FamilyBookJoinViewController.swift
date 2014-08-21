//
//  FamilyBookJoinViewController.swift
//  Just Paid
//
//  Created by Zack Zhu on 13/08/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import UIKit

class FamilyBookJoinViewController: UIViewController {
    
    @IBOutlet var invitaionCodeField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        invitaionCodeField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func dismissButtonTapped(sender:AnyObject!){
        invitaionCodeField.resignFirstResponder()
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
