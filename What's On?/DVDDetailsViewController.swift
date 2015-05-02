//
//  DVDTitlesTableViewController.swift
//  What's On?
//
//  Created by Aaron Kenyon on 4/21/15.
//  Copyright (c) 2015 Makken. All rights reserved.
//

import UIKit

class DVDTitlesViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var segueResults:[String]!
    
    @IBOutlet weak var DVDView: UITableView!
    
    var DVDArray: NSMutableArray! = NSMutableArray()
    
    
    override func viewDidLoad() {
        var index: Int
        
        for index = 0; index < self.segueResults.count; index++ {
            self.DVDArray.addObject(self.segueResults[index])
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
        return DVDArray.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.theatreView.dequeueReusableCellWithIdentifier("DVDCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = self.DVDArray.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
    
}
