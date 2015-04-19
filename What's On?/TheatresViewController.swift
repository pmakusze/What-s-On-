//
//  TheatresViewController.swift
//  What's On?
//
//  Created by Aaron Kenyon on 4/12/15.
//  Copyright (c) 2015 Makken. All rights reserved.
//


import UIKit

class TheatreViewController: UITableViewController {
    
    var theatres:[Theatre] = theatresData
    
    @IBOutlet weak var tbv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRottenJSON("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=cghzqcwd685bsb8j8f8efwzc")
        
/*        // Indicates url for api call to In Theatre movies
        let urlAsString = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=cghzqcwd685bsb8j8f8efwzc"
        let url = NSURL(string: urlAsString)!
        let urlSession = NSURLSession.sharedSession()
        //-----------------
        let jsonQuery = urlSession.dataTaskWithURL(url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                println(error.localizedDescription)
            }
        var err: NSError?
        //-----------------
        var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
        if (err != nil) {
            println("JSON Error \(err!.localizedDescription)")
        }

//        let jsonTitle: String! = jsonResult["Title"] as NSString
//        let jsonTime: String! = jsonResult["time"] as NSString
            
//        dispatch_async(dispatch_get_main_queue(), {
//            nameLabel.text = jsonTitle
  //          timeLabel.text = jsonTime
//            })
        })
        //----------------
        jsonQuery.resume() */
    }
    
    func getRottenJSON(whichRotten : String){
        let mySession = NSURLSession.sharedSession()
        let url: NSURL = NSURL(string: whichRotten)!
        let networkTask = mySession.dataTaskWithURL(url, completionHandler : {data, response, error -> Void in
            var err: NSError?
            var theJSON = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSMutableDictionary
            let results : NSArray = theJSON["data"]!["children"] as NSArray
            dispatch_async(dispatch_get_main_queue(), {
             //   self.tableData = results
             //   self.redditListTableView!.reloadData()
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
        
        let theatre = theatres[indexPath.row] as Theatre
        cell.nameLabel.text = theatre.name
        return cell
    }    
}