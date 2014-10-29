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


    func setHelloLabel(helloWorldText: NSString){
        helloLabel.text = helloWorldText;
    }
    
}

