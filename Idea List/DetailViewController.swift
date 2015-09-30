//
//  DetailViewController.swift
//  Idea List
//
//  Created by Rutul Dave on 9/30/15.
//  Copyright © 2015 Rutul Dave. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var ideaDetail:String?

    @IBOutlet weak var detailContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.title = ideaDetail
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
