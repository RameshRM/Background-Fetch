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
    var messageId: NSString!;
    let _MESSAGE_FROM = "background.poll";
    let _MESSAGE_POSTBOX = "pobox"
    let _MESSAGE_PROCESSING_API = "http://citypageapp.com/messages.retrieve?to=";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.send();
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func onMessageReceived(messageArgs: NSString){
        println(messageArgs);
        self.helloLabel.text = messageArgs;
        processMessage(messageArgs);
    }
    
    
    func processMessage(messageArgs: NSString){
        var encodedMessageArgs = messageArgs.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) as NSString!;
        var url = "\(self._MESSAGE_PROCESSING_API)\(self.messageId)";
        var request = NSURLRequest(URL: NSURL(string: url)!);
        NSURLConnection.sendAsynchronousRequest(request,queue: NSOperationQueue.mainQueue()) {
            (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            self.send();
            var receivedMessage = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary;
            self.helloLabel.text = receivedMessage["body"] as NSString!;
        }
    }
    
    
    func getNow() -> NSTimeInterval{
        return NSDate().timeIntervalSince1970 * 1000;
    }
    
    func sendMessage(from: NSString, to: NSString, body: NSString) -> Void{
        var url = "http://citypageapp.com/messages.send?from=\(from)&to=\(to)&body=\(body)";
        var request = NSURLRequest(URL: NSURL(string: url)!);
        NSURLConnection.sendAsynchronousRequest(request,queue: NSOperationQueue.mainQueue()) {
            (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
        }
    }
    
    func getAndSetMessageId() -> NSString{
        return "\(_MESSAGE_POSTBOX).\(self.getNow())";
    }
    
    
    func messageBody() -> NSString{
        var message = "Hello, Current Time in Milli Seconds is : \(getNow())";
        return message.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) as NSString!;
    }
    
    func send() -> Void{
        self.messageId = self.getAndSetMessageId();
        self.sendMessage(_MESSAGE_FROM, to: self.messageId, body: self.messageBody())
    }
    
}

