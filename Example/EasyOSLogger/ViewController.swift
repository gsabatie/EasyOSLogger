//
//  ViewController.swift
//  EasyOSLogger
//
//  Created by gsabatie on 03/17/2019.
//  Copyright (c) 2019 gsabatie. All rights reserved.
//

import UIKit
import EasyOSLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Log.debug("just a debug message")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

}

