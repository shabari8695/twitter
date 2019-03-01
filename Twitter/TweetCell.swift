//
//  TweetCell.swift
//  Twitter
//
//  Created by Shabari Girish Ganapathy on 2/10/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var favorited : Bool = false
    var tweetId : Int = -1
    var retweeted : Bool = false
    
    func is_favorited(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            likeButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }else{
            likeButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
        
    }
    
    func set_retweeted(_ isRetweeted:Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func favTweet(_ sender: Any) {
        let tobefavorited = !favorited
        if (tobefavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: self.tweetId, success: {
                self.is_favorited(true)
            }, failure: { (error) in
                print("something wrong")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: self.tweetId, success: {
                self.is_favorited(false)
            }, failure: { (error) in
                print("something wrong")
            })
        }
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.set_retweeted(true)
        }, failure: { (error) in
            print("something wrong in retweeting")
        })
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
