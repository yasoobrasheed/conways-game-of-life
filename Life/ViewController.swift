//
//  ViewController.swift
//  Life
//
//  Created by Yasoob Rasheed on 5/2/18.
//  Copyright © 2018 Yasoob Rasheed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var grid: Grid!
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        grid = Grid(width: self.view.frame.width, height: self.view.frame.height, view: self.view)
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (timer) in
            self.runLife()
        })
    }
    
    func runLife() {
        for i in 0...9 {
            for j in 0...9 {
                grid.gridArray[i][j].applyRulesToGridBlock()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

