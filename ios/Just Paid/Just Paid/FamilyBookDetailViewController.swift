//
//  FamilyBookDetailViewController.swift
//  Just Paid
//
//  Created by Zack Zhu on 3/08/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import UIKit

class FamilyBookDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var nameButton: UIButton!
    @IBOutlet var amountLabel: JPAnimatedCurrencyLabel!
    
    var members: NSMutableArray = []
    var categories: [Dictionary<String, Any>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        members = dataSource.familyBookMembers
        categories = dataSource.familyBookCategories
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        amountLabel.amount = 57612.43
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
    
    // MARK: - UITableView Delegate
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.members.count + 1
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        if indexPath.row < self.members.count{
            return 100
        }else{
            return 69
        }
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        if indexPath.row < self.members.count{
            let cell:MemeberCell = tableView.dequeueReusableCellWithIdentifier("Member Cell") as MemeberCell
            
            let member:NSMutableDictionary = self.members[indexPath.row] as NSMutableDictionary
            cell.member = member
            
            return cell
        }else{
            let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Actions Cell") as UITableViewCell
            return cell
        }
    }
    
    // MARK: - Handle Delete action
    @IBAction func deleteButtonTapped(sender:AnyObject!){
        let actionSheet:UIActionSheet = UIActionSheet(title: "All members will not be able to access this family book again. Are you sure you want to delete this family book?", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Delete")
        actionSheet.showInView(self.view)
        
    }
    
    func actionSheet(actionSheet: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int) {
        println(buttonIndex)
    }
    
    // MARK: - Rename feature
    @IBAction func nameLabelTapped(sender:AnyObject!){
        UIView.animateWithDuration(0.25, animations: {
            self.nameButton.alpha = 0
            self.nameTextField.alpha = 1
        })
        
        self.nameTextField.becomeFirstResponder()
        
    }
    
    @IBAction func dismissKeyboard(sender:AnyObject!){
        
        self.nameTextField.resignFirstResponder()
        
        UIView.animateWithDuration(0.25, animations: {
            self.nameButton.alpha = 1
            self.nameTextField.alpha = 0
        })
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.dismissKeyboard(nil)
        return true
    }
    
    // MARK: - UICollectionView Delegate
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        let cell:FamilyBookCategoryCell = collectionView.dequeueReusableCellWithReuseIdentifier("Family Book Category Cell", forIndexPath: indexPath) as FamilyBookCategoryCell
        
        cell.category = categories[indexPath.row]
        
        return cell
    }
    
    // MARK: - Button actions
    @IBAction func leftArrowButtonTapped(sender:AnyObject!){
        amountLabel.amount = 8312.09
    }
    
    @IBAction func rightArrowButtonTapped(sender:AnyObject!){
        amountLabel.amount = 57612.43
    }
    
}
