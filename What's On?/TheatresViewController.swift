
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
    
//    var theatres:[Theatre] = theatresData
    
    var textArray: NSMutableArray! = NSMutableArray()
    
    var segueResults:[String]!
    
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
            self.segueResults = results3

            //        self.segueResults = results2
            dispatch_async(dispatch_get_main_queue(), {
                //  for index = 0; index < self.segueResults.count; index++ {
                            self.segueResults = results3
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
    
  /*  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "In Theatres") {
            
            var vc = segue.destinationViewController as TitlesViewController
            
            getRottenJSON("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=cghzqcwd685bsb8j8f8efwzc")
            
            TitleData = [
                Title(name: self.segueResults[0]),
                Title(name: self.segueResults[1]),
                Title(name: self.segueResults[2]),
                Title(name: self.segueResults[3]),
                Title(name: self.segueResults[4]),
                Title(name: self.segueResults[5]),
                Title(name: self.segueResults[6]),
                Title(name: self.segueResults[7]),
                Title(name: self.segueResults[8]),
                Title(name: self.segueResults[9]),
                Title(name: self.segueResults[10]),
                Title(name: self.segueResults[11]),
                Title(name: self.segueResults[12]),
                Title(name: self.segueResults[13]),
                Title(name: self.segueResults[14]),
            ]
            
        }
        
    }*/
    
}