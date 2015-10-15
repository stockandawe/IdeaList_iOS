//
//  ViewController.swift
//  Idea List
//
//  Created by Rutul Dave on 9/29/15.
//  Copyright © 2015 Rutul Dave. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.rowHeight = 60.0

        NSUserDefaultsManager.initializeDefault()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IdeaManager.ideas.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customcell", forIndexPath: indexPath) as! customcell
        
        let idea = IdeaManager.ideas[indexPath.item]
        cell.textLabel?.lineBreakMode = .ByWordWrapping
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = idea.title
        cell.idea = idea
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == .Delete) {
            IdeaManager.DeleteIdea(indexPath.item)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detailview") {
            let cell = sender as! customcell
            let detailview = segue.destinationViewController as! DetailViewController
            detailview.ideaDetail = cell.idea
        }
    }
}

