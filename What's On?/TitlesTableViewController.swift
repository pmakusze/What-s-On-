//
//  TitlesTableViewController.swift
//  What's On?
//
//  Created by Aaron Kenyon on 4/21/15.
//  Copyright (c) 2015 Makken. All rights reserved.
//

import UIKit

class TitlesViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var segueResults:[String]!
    
    var theatreArray: NSMutableArray! = NSMutableArray()
    
    @IBOutlet weak var theatreView: UITableView!
    
    override func viewDidLoad() {
        var index: Int
        
        for index = 0; index < self.segueResults.count; index++ {
            self.theatreArray.addObject(self.segueResults[index])
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theatreArray.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.theatreView.dequeueReusableCellWithIdentifier("theatreCell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = self.theatreArray.objectAtIndex(indexPath.row) as? String
    
        return cell
    }
    
}
