//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by Carlo Cossette on 2015-06-09.
//  Copyright (c) 2015 C Cossette. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    var tweet: Tweet?
    {
        didSet
        {
            updateUI()
        }
    }
    
    @IBOutlet weak var tweetProfileImageView: UIImageView!
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
   
    func updateUI()
    {
        tweetTextLabel?.attributedText = nil
        tweetScreenNameLabel?.text = nil
        tweetProfileImageView?.image = nil
        
        if let tweet = self.tweet
        {
            tweetTextLabel?.text = tweet.text
            if tweetTextLabel?.text != nil
            {
                for _ in tweet.media
                {
                    tweetTextLabel.text! += " 📷"
                }
            }
            tweetScreenNameLabel?.text = "\(tweet.user)"
            
            if let profileImageURL = tweet.user.profileImageURL
            {
                if let imageData = NSData(contentsOfURL: profileImageURL)
                {
                    tweetProfileImageView?.image = UIImage(data:imageData)
                }
            }
            /*
            let formatter = NSDateFormatter()
            if NSDate().timeIntervalSinceDate(tweet.created) > 24*60*60
            {
                formatter.dateStyle = NSDateFormatterStyle.ShortSyle
            
            } else {
                formatter.timeStyle = NSDateFormatterStyle.ShortStyle
            }
            tweetCreatedLabel?.text = formatter.stringFromDate(tweet.created)
        }
        */
        
    }
    
}
}