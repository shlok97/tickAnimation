//
//  ViewController.swift
//  Animation Done
//
//  Created by Shlok Kapoor on 01/06/17.
//  Copyright © 2017 App Gali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tickView: AnimationContainer!
    @IBAction func animate(_ sender: Any) {
        tickView.animateTickMark()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

