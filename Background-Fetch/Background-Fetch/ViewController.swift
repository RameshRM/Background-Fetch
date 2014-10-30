//
//  ViewController.swift
//  Background-Fetch
//
//  Created by Mahadevan, Ramesh on 10/29/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func onMessageReceived(helloWorldText: NSString){
        sendMessage(helloWorldText);

    }
    
    func sendMessage(now: NSString){
        var encodedString = now.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) as NSString!;
        var url = "http://citypageapp.com/messages.retrieve?to=jane";
        var request = NSURLRequest(URL: NSURL(string: url)!);
        
        NSURLConnection.sendAsynchronousRequest(request,queue: NSOperationQueue.mainQueue()) {
            (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var receivedMessage = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary;
            self.helloLabel.text = receivedMessage["body"] as NSString!;
        }
    }
    
}

