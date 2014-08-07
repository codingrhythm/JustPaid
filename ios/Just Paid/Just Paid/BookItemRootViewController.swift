//
//  BookItemRootViewController.swift
//  Just Paid
//
//  Created by Zack Zhu on 22/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import UIKit

class BookItemRootViewController: UIViewController {
    
    var tag:BookItemTag?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - Event Handlers
    @IBAction func addTag(sender:AnyObject?){
        self.tag = BookItemTag.create("Test Tag")!
    }
    
    @IBAction func editTag(sender:AnyObject?){
        let bookItemTag = self.tag!
        bookItemTag.tag = "Updated Tag"
        let moc = CDMSharedInstance.managedObjectContext!
        moc.save(nil)
    }
    
    @IBAction func deleteTag(sender:AnyObject?){
        let bookItemTag = self.tag!
        bookItemTag.markAsDeleted()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
