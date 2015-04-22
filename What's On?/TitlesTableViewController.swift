//
//  TitlesTableViewController.swift
//  What's On?
//
//  Created by Aaron Kenyon on 4/21/15.
//  Copyright (c) 2015 Makken. All rights reserved.
//

import UIKit

class TitlesViewController: UITableViewController, UITableViewDelegate {
    
    var titles:[Title] = TitleData
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TitleCell", forIndexPath: indexPath) as TitleCell
        //       let redditEntry : NSMutableDictionary = self.tableData[indexPath.row] as NSMutableDictionary
        let title = titles[indexPath.row] as Title
        cell.titleLabel.text = title.name
        return cell
    }
    
}
