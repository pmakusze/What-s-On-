//
//  TheatresViewController.swift
//  What's On?
//
//  Created by Aaron Kenyon on 4/12/15.
//  Copyright (c) 2015 Makken. All rights reserved.
//


import UIKit

class TheatreViewController: UITableViewController, UITableViewDelegate {
    
    var theatres:[Theatre] = theatresData
    
    var segueResults = []
   
    @IBOutlet weak var tbv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRottenJSON("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=cghzqcwd685bsb8j8f8efwzc")
    }

    func getRottenJSON(whichRotten : String){
        greet()
        let mySession = NSURLSession.sharedSession()
        let url: NSURL = NSURL(string: whichRotten)!
        let networkTask = mySession.dataTaskWithURL(url, completionHandler : {data, response, error -> Void in
            var err: NSError?
            var theJSON = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSMutableDictionary
            let results : NSArray = theJSON["movies"]! as NSArray //!["children"]
            
            dispatch_async(dispatch_get_main_queue(), {
                self.segueResults = results
             // self.TheatreCell!.reloadData()
            })
        })
        networkTask.resume()
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
        return theatres.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TheatreCell", forIndexPath: indexPath) as TheatreCell
 //       let redditEntry : NSMutableDictionary = self.tableData[indexPath.row] as NSMutableDictionary
        let theatre = theatres[indexPath.row] as Theatre
        cell.nameLabel.text = theatre.name
        return cell
    }
    
}