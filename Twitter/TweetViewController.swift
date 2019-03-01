//
//  TweetViewController.swift
//  Twitter
//
//  Created by Shabari Girish Ganapathy on 2/15/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTweet(_ sender: Any) {
        
        if(!tweetTextView.text.isEmpty){
            let param = ["status:"+tweetTextView.text]
            let url = "https://api.twitter.com/1.1/statuses/update.json"
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                self.dismiss(animated: true, completion: nil)
            })
        }
        else{
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated:true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
