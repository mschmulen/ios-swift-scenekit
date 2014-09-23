//
//  DetailViewController.swift
//  catalogApp
//
//  Created by Matthew Schmulen on 9/5/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBAction func actionDismiss(sender: AnyObject) {
        
        self.dismissViewControllerAnimated( true, completion: { () -> Void in
            
            println("view dismissed")
            
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
