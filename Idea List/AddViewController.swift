//
//  AddViewController.swift
//  Idea List
//
//  Created by Rutul Dave on 9/30/15.
//  Copyright © 2015 Rutul Dave. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var detailContent: UITextView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.enabled = false
        
        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textTitleDidChange", name: UITextFieldTextDidChangeNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "detailContentDidChange", name: UITextViewTextDidChangeNotification, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textTitleDidChange() {
        handleButtonStates()
    }

    func detailContentDidChange() {
        handleButtonStates()
    }
    
    @IBAction func addButton_click(sender: AnyObject) {
        // Start an ActivityIndicator
        activityIndicator.startAnimating()

        // Call AddIdea
        IdeaManager.AddIdea(titleText.text!, detail: detailContent.text)

        // clear out the text fields.
        titleText.text = ""
        detailContent.text = ""

        NSUserDefaultsManager.synchronize()

        // Add a delay so that the ActivityIndicator shows
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5*Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.activityIndicator.stopAnimating()
        }
    }

    @IBAction func doneButton_click(sender: AnyObject) {
        detailContent.resignFirstResponder()
    }
    
    @IBAction func titleDoneButton_click(sender: AnyObject) {
        titleText.resignFirstResponder()
    }
    
    func handleButtonStates () {
        // handle 'Done' button
        if (detailContent.text != "") {
            doneButton.enabled = true
        }
        else {
            doneButton.enabled = false
        }
        
        // handle 'Add' button
        if (titleText.text != "" && detailContent.text != "") {
            addButton.enabled = true
            addButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        }
        else {
            addButton.enabled = false
            addButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)

        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
