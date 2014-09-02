//
//  ViewController.swift
//  SceneKitA
//
//  Created by Matthew Schmulen on 9/1/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelATitle: UILabel!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelBTitle: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelCTitle: UILabel!
    @IBOutlet weak var labelC: UILabel!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var myView: SCNView!
    
    var myScene: MyScene!
    
    var timer: CADisplayLink! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let scnView = myView//view as SCNView
        scnView.autoenablesDefaultLighting = true
        scnView.backgroundColor = UIColor.lightGrayColor()
        
        // Create and configure the scene.
        myScene = MyScene()
        scnView.scene = myScene
        
        // Create and configure the Lighting and Camera
        let diffuseLight = SCNLight()
        diffuseLight.color = UIColor.lightGrayColor()
        diffuseLight.type = SCNLightTypeOmni
        let lightNode = SCNNode()
        lightNode.light = diffuseLight
        lightNode.position = SCNVector3(x: -30, y:30, z:30)
        myScene.rootNode.addChildNode(lightNode)
        
        let ambientLight = SCNLight()
        ambientLight.type = SCNLightTypeAmbient
        let ambientLightNode = SCNNode()
        ambientLight.color = UIColor(white: 0.3, alpha: 1)
        ambientLightNode.light = ambientLight
        myScene.rootNode.addChildNode(ambientLightNode)
        
        let camera = SCNCamera()
        camera.xFov = 45
        camera.yFov = 45
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        myScene.rootNode.addChildNode(cameraNode)
        
        labelATitle.text = "Vertex count"
        
        updateHUD()
        
        //initialize the eventLoop
        //timer = CADisplayLink(target: self, selector: Selector("eventloop"))
        //timer.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)

    }
    
    func updateHUD() {
        labelA.text = "\(myScene.getVertCount())"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func render() {
        //var drawable = scnView.
        //var drawable = metalLayer.nextDrawable()
    }
    
    func eventloop() {
        autoreleasepool {
            self.render()
        }
    }

}

