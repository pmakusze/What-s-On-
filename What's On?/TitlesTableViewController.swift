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
    
    var tableD: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
    //    getRottenJSON("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=cghzqcwd685bsb8j8f8efwzc")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  
    }
    
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
    //        self.segueResults = results2 */
            dispatch_async(dispatch_get_main_queue(), {
              //  for index = 0; index < self.segueResults.count; index++ {
                    self.segueResults = results3
              //  }
            //    self.tc.titleLabel.reload()
            })
        })
        networkTask.resume()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15;
    }
    
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //    let cell = tableView.dequeueReusableCellWithIdentifier("TitleCell", forIndexPath: indexPath) as TitleCell
          var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell

   //     let rottenEntry : NSMutableDictionary = self.tableD[indexPath.row] as NSMutableDictionary
   //     let rottenEntry : [Title] = segueResults
    //        [name: self.segueResults[0]
  //      let title = titles[indexPath.row] as Title
 //     cell.textLabel?.text = rottenEntry["title"]! as? String
     //   cell.titleLabel.text = title.name
  //      cell.textLabel?.text = self.segueResults.objectAtIndex(indexPath.row) as? String

        return cell
    }
    
}
