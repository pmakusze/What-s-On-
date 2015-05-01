
//
//  TheatresViewController.swift
//  What's On?
//
//  Created by Aaron Kenyon on 4/12/15.
//  Copyright (c) 2015 Makken. All rights reserved.
//


import UIKit

class TheatreViewController: UITableViewController, UITableViewDelegate {
    
    @IBOutlet weak var tV: UITableView!
        
    var textArray: NSMutableArray! = NSMutableArray()
    
    var segueResultsTheatre:[String]!
        
    func getRottenJSON(whichRotten : String){
        let mySession = NSURLSession.sharedSession()
        let url: NSURL = NSURL(string: whichRotten)!
        let networkTask = mySession.dataTaskWithURL(url, completionHandler : {data, response, error -> Void in
            var err: NSError?
            var theJSON = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSMutableDictionary
            let results : NSArray = theJSON["movies"]! as NSArray //!["children"]
                       var index: Int
            var results2 = [String?](count:15, repeatedValue: nil)
            
            for index = 0; index < 15; index++ {
            results2[index] = results[index]["title"]! as? String
            }
            let results3 = results2.filter{ $0 != nil }.map{ $0! }
            println(results3)
            self.segueResultsTheatre = results3

            dispatch_async(dispatch_get_main_queue(), {
                //  for index = 0; index < self.segueResults.count; index++ {
                self.segueResultsTheatre = results3
                //  }
                //    self.tc.titleLabel.reload()
            })
        })
        networkTask.resume()
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
       getRottenJSON("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=cghzqcwd685bsb8j8f8efwzc")
        
        self.textArray.addObject("In Theatres")
        self.textArray.addObject("Box Office Movies")
        self.textArray.addObject("New Releases")
        self.textArray.addObject("Upcoming")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tV: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tV.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = self.textArray.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
    
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var iP = self.tV.indexPathForSelectedRow()
        
        let currentCell = tableView.cellForRowAtIndexPath(iP!) as UITableViewCell!

        if(currentCell.textLabel!.text == "In Theatres") {
        

        
            var tvc: TitlesViewController = segue.destinationViewController as TitlesViewController
            
            tvc.segueResults = segueResultsTheatre
            
       //     getRottenJSON("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=cghzqcwd685bsb8j8f8efwzc")
            
        }
        
    }
    
}