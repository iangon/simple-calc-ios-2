//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by Ian on 11/1/16.
//  Copyright © 2016 Ian. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak var historyLabel: UILabel!
    var history : Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for index in 0 ... history.count - 1 {
            historyLabel.text! += history[index] + "\n"
        }
        
        historyLabel.numberOfLines = 0
        historyLabel.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newView = segue.destination as! ViewController
        
        
        if(segue.identifier == "backButton") {
            newView.history += self.history
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
