//
//  NewsViewController.swift
//  Trumpd
//
//  Created by Daniel Park on 4/2/17.
//  Copyright © 2017 mattkhan. All rights reserved.
//

import Foundation
import UIKit

class NewsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    //var query: String!;
    var newsNames = [
        "BBC",
        "CNN",
        "FOX",
        "NYT",
        "ABC",
        "WP",
        "NBC",
        "MSNBC"
    ]
    
    var URLs = [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""
    ]
    
    var headlines = [
        "Obama 'never ordered Trump wire-tapping'",
        "Donald Trump's baseless wiretap claim",
        "Donald Trump blasts Obama for 'wiretap' of Trump Tower",
        "Trump, Offering No Evidence, Says Obama Tapped His Phones",
        "Lawmakers stunned, baffled by Trump’s wiretap allegations",
        "Trump accuses Obama of wiretapping his phones, cites no evidence",
        "Obama Spokesman Disputes Trump's Wiretapping Claim",
        "Donald Trump: James Clapper Says No Wiretap of Trump Tower"
    ]
    
    var clipped_snippets = [
        "Barack Obama's spokesman hits back after Donald Trump calls his predecessor a ... McCarthyism, which Mr Trump referred to in one of the first posts, ...",
        "Trump accuses Obama of wiretapping him. ... This is McCarthyism!\" Trump tweeted early Saturday morning in one part of a six ...",
        "... saying he was targeted with \"Nixon/Watergate\" and \"McCarthyism\" tactics. Mr. Obama denied the allegation ... Trump blasts Obama for ‘wiretap’ of ...",
        "President Trump called former President Barack Obama a ... a court warrant to wiretap the Trump Organization or was ... The New York Times Site Index ...",
        "This is McCarthyism!” Trump’s allegations ... of any illegal wiretapping by the Obama ... the United States does not have the ...",
        "... accused White House predecessor Barack Obama of wiretapping his Trump Tower ... Joseph McCarthy, Trump compared the ...",
        "... President Barack Obama had wiretapped Trump Tower before his ... Obama Spokesman: Pres. Trump's Wiretapping Claims ... McCarthyism!\" Trump wrote as part ...",
        "Donald Trump: James Clapper Says No Wiretap of Trump Tower . ... Clapper, who served as the head of the intelligence agency under former President Barack Obama, ..."
    ]
    
    var snips = [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""
    ]
    
    var numToURL: [Int:String] = [
        0 : "www.bbc.com/news",
        1 : "www.cnn.com/",
        2 : "www.foxnews.com/",
        3 : "www.nytimes.com/",
        4 : "http://abcnews.go.com/US",
        5 : "https://www.washingtonpost.com/",
        6 : "www.nbcnews.com/",
        7 : "www.msnbc.com/"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(query)
        //for (news, URL) in numToURL {
            //print(news)
            //if let first = GetNews.getNewsArticles("\(URL) \(query)") { //
                //URLs[news] = first["url"]!
                //snips[news] = first["snippet"]!
            //}
            //            print(first["snippet"] ?? "No description")
        //}
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NewsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return number of items from csv
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.clipped_snippet.text = clipped_snippets[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.newsName.text = newsNames[indexPath.row]
        cell.headline.text = headlines[indexPath.row]
        
        
        //print ("hello \(20+indexPath.row)")
        //cell.logo?.image = UIImage(named: "\(20+indexPath.row)")
        return cell
    }
}

class NewsCell: UITableViewCell {
    @IBOutlet var logo : UIImageView?
    
    @IBOutlet var headline : UILabel!
    @IBOutlet var clipped_snippet : UILabel!
    
    
    @IBOutlet var newsName: UILabel!
    @IBOutlet var snippet: UILabel!
    
}
