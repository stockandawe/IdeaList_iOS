//
//  ViewController.swift
//  Idea List
//
//  Created by Rutul Dave on 9/29/15.
//  Copyright © 2015 Rutul Dave. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let array = ["idea I", "idea II", "idea III"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customcell", forIndexPath: indexPath) as! customcell
        cell.textLabel?.text = array[indexPath.item]
        cell.Idea = cell.textLabel?.text
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detailview") {
            let cell = sender as! customcell
            let detailview = segue.destinationViewController as! DetailViewController
            detailview.ideaDetail = cell.Idea
        }
    }
}

