//
//  ViewController.swift
//  Trumpd
//
//  Created by Matthew K on 4/2/17.
//  Copyright © 2017 mattkhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var row : Int?
    let tweets = [
        "Terrible! Just found out that Obama had my 'wires tapped' in Trump Tower just before the victory. Nothing found. This is McCarthyism!",
        "Russia talk is FAKE NEWS put out by the Dems, and played up by the media, in order to mask the big election defeat and the illegal leaks!",
        "Arnold Schwarzenegger isn't voluntarily leaving the Apprentice, he was fired by his bad (pathetic) ratings, not by me. Sad end to great show!",
        "If Chicago doesn't fix the horrible 'carnage' going on, 228 shootings in 2017 with 42 killings (up 24% from 2016), I will send in the Feds!",
        "The same people who did the phony election polls, and were so wrong, are now doing approval rating polls. They are rigged just like before.",
        "I win an election easily, a great 'movement' is verified, and crooked opponents try to belittle our victory with FAKE NEWS. A sorry state!",
        "The opinion of this so-called judge, which essentially takes law-enforcement away from our country, is ridiculous and will be overturned!",
        "Watched Saturday Night Live hit job on me.Time to retire the boring and unfunny show. Alec Baldwin portrayal stinks. Media rigging election!",
        "In addition to winning the Electoral College in a landslide, I won the popular vote if you deduct the millions of people who voted illegally.",
        "I settled the Trump University lawsuit for a small fraction of the potential award because as President I have to focus on our country.",
        "Great meetings will take place today at Trump Tower concerning the formation of the people who will run our government for the next 8 years.",
        "Congratulations to Rex Tillerson on being sworn in as our new Secretary of State. He will be a star!",
        "Campaigning for votes under the Electoral College system is much more difficult, and different, than the popular vote.",
        "Wow, television ratings just out: 31 million people watched the Inauguration, 11 million more than the very good ratings from 4 years ago!",
        "That was really exciting. Made all of my points. MAKE AMERICA GREAT AGAIN!",
        "Merry Christmas and a very, very, very , very Happy New Year to everyone!"]
    let dates = [
        "2017-03-04 11:35:20",
        "2017-02-26 18:16:41",
        "2017-03-04 13:19:29",
        "2017-01-25 02:25:40",
        "2017-01-17 13:11:56",
        "2017-01-11 12:44:06",
        "2017-02-04 13:12:02",
        "2016-10-16 11:14:00",
        "2016-11-27 20:30:43",
        "2016-11-19 13:34:38",
        "2016-11-22 11:46:57",
        "2017-02-02 11:18:22",
        "2016-12-21 12:54:23",
        "2017-01-22 12:51:36",
        "2016-10-20 02:59:27",
        "2016-12-25 17:48:48"
        
    ]
        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let sentiment = Request.sentiment(forText: "test")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //         Create a variable that you want to send
        let object = tweets[row!]
        //         Create a new variable to store the instance of PlayerTableViewController
        let destinationVC = segue.destination as! NewsViewController
        //destinationVC.query = object
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let vc = NewsChoiceViewController()
        //present(vc, animated: true, completion: nil)
        //let tweet = tweets[indexPath.row]
        
        row = indexPath.row
        performSegue(withIdentifier: "NewsSegue", sender:self)

    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return number of items from csv
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        cell.tweet.text = tweets[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        print("\(dates[indexPath.row])")
        cell.date.text = dates[indexPath.row]
        
        cell.trumpPic?.image = UIImage(named: "\(indexPath.row)")
        return cell
    }
}

class NewsChoiceViewController: UIViewController {
    
    //NSURL goes here
}



//
class TweetCell: UITableViewCell {

    @IBOutlet var trumpPic: UIImageView?
    @IBOutlet var tweet: UILabel!
    @IBOutlet var date: UILabel!
    
}
