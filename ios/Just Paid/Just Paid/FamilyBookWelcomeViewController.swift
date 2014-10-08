//
//  FamilyBookWelcomeViewController.swift
//  Just Paid
//
//  Created by Zack Zhu on 19/08/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import UIKit

class FamilyBookWelcomeViewController: UIViewController, UIAlertViewDelegate {
    
    private var pendingSegue:String!
    private var nameProvided:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func createButtonTapped(sender:AnyObject!){
        pendingSegue = "Show Family Book Detail View"
        
        if !nameProvided{
            showNameAlertView()
        }else{
            performSegueWithIdentifier(pendingSegue, sender: sender)
        }
    }
    
    @IBAction func joinButtonTapped(sender:AnyObject!){
        pendingSegue = "Show Family Book Join View"
        
        if !nameProvided{
            showNameAlertView()
        }else{
            performSegueWithIdentifier(pendingSegue, sender: sender)
        }
    }
    
    private func showNameAlertView(){
        let alertView:UIAlertView = UIAlertView(title: "Please enter your name", message: "What do you want to be called?", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "OK")
        alertView.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alertView.show()
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1{
            alertView.textFieldAtIndex(0).resignFirstResponder()
            performSegueWithIdentifier(pendingSegue, sender: nil)
        }
    }
}
