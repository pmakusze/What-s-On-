//
//  DVDViewController.swift
//  What's On?
//
//  Created by Aaron Kenyon on 4/12/15.
//  Copyright (c) 2015 Makken. All rights reserved.
//

/*
import UIKit



class DVDViewController: UITableViewController {
    
    var DVDs:[DVD] = DVDData
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return DVDs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DVDCell", forIndexPath: indexPath) as DVDCell
        
        let dvd = DVDs[indexPath.row] as DVD
        cell.nameLabel.text = dvd.nameDVD
        return cell
    }
} */