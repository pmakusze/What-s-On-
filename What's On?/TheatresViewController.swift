
//
//  TheatresViewController.swift
//  What's On?
//
//  Created by Paul Makuszewski on 4/12/15.
//  Copyright (c) 2015 Makken. All rights reserved.
//


import UIKit

class TheatreViewController: UITableViewController, UITableViewDelegate {
    
    @IBOutlet weak var tV: UITableView!
        
    var textArray: NSMutableArray! = NSMutableArray()
    
    var inTheatres:[String]!
    var boxOfficeMovies:[String]!
    var opening:[String]!
    var upcoming:[String]!
    
    var counter: Int = 1
    
    // Stores movies in variables
    func getRottenJSON(whichRotten : String){
        let mySession = NSURLSession.sharedSession()
        let url: NSURL = NSURL(string: whichRotten)!
        let networkTask = mySession.dataTaskWithURL(url, completionHandler : {data, response, error -> Void in
            var err: NSError?
            var theJSON = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSMutableDictionary
            let results : NSArray = theJSON["movies"]! as NSArray //!["children"]
            var results2 = [String?](count:10, repeatedValue: nil)
            var index: Int
            for index = 0; index < 10; index++ {
                results2[index] = results[index]["title"]! as? String
            }
            let results3 = results2.filter{ $0 != nil }.map{ $0! }
 //           println(results3)
            if(self.counter == 1) {
                self.inTheatres = results3}
            if(self.counter == 2) {
                self.boxOfficeMovies = results3}
            if(self.counter == 3) {
                self.opening = results3}
            if(self.counter == 4) {
                self.upcoming = results3}

            self.counter++
        })
        networkTask.resume()
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        getRottenJSON("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=cghzqcwd685bsb8j8f8efwzc&limit=10")
        getRottenJSON("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=cghzqcwd685bsb8j8f8efwzc&limit=10")
        getRottenJSON("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/opening.json?apikey=cghzqcwd685bsb8j8f8efwzc&limit=10")
        getRottenJSON("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/upcoming.json?apikey=cghzqcwd685bsb8j8f8efwzc&limit=10")

        
        self.textArray.addObject("In Theatres")
        self.textArray.addObject("Box Office Movies")
        self.textArray.addObject("Opening")
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
        var tvc: TitlesViewController = segue.destinationViewController as TitlesViewController

        
        if(currentCell.textLabel!.text == "In Theatres") {
            tvc.segueResults = inTheatres
        }
        
        if(currentCell.textLabel!.text == "Box Office Movies") {
            tvc.segueResults = boxOfficeMovies
        }
        
        if(currentCell.textLabel!.text == "Opening") {
            tvc.segueResults = opening
        }
        
        if(currentCell.textLabel!.text == "Upcoming") {
            tvc.segueResults = upcoming

        }
    }
}