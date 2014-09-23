//
//  ModelListViewController.swift
//  SceneKitA
//
//  Created by Matthew Schmulen on 9/23/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class ModelListViewController: UIViewController, UITableViewDelegate {

    var tableData: [String] = ["Cylinder", "Sphere", "Box", "DAE Model" ]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelCurrentModel: UILabel!
    @IBAction func actionDismiss(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
            println("dismiss")
            
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.tableData[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        println("You selected cell #\(indexPath.row)!")
        
        self.labelCurrentModel.text = " \(indexPath.row) \(self.tableData[indexPath.row]) "
        
    }
    
    // MARK: - UITableViewDataSource
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
