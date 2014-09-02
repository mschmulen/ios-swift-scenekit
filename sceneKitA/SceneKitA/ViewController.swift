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
        scnView.showsStatistics = true
        
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
        //camera.zNear = 0.01
        camera.xFov = 45
        camera.yFov = 45
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        myScene.rootNode.addChildNode(cameraNode)
        
        
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
        let gestureRecognizers = NSMutableArray()
        gestureRecognizers.addObject(tapGesture)
        gestureRecognizers.addObjectsFromArray(scnView.gestureRecognizers)
        scnView.gestureRecognizers = gestureRecognizers
        
        
        
        labelATitle.text = "Vertex count"
        updateHUD()
        
        //initialize the eventLoop
        //timer = CADisplayLink(target: self, selector: Selector("eventloop"))
        //timer.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        
    }
    
    func handleTap(gestureRecognize: UIGestureRecognizer) {
        
        // retrieve the SCNView
        let scnView = myView//self.view as SCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.locationInView(scnView)
        let hitResults = scnView.hitTest(p, options: nil)
        
        // check that we touched on at least one object
        if hitResults.count > 0 {
            
            let result: AnyObject! = hitResults[0]
            let material = result.node!.geometry.firstMaterial
            
            // highlight animate it
            SCNTransaction.begin()
            SCNTransaction.setAnimationDuration(0.6)
            
            // on completion - unhighlight it
            SCNTransaction.setCompletionBlock {
                SCNTransaction.begin()
                SCNTransaction.setAnimationDuration(1.1)
                material.emission.contents = UIColor.blackColor()
                SCNTransaction.commit()
            }
            material.emission.contents = UIColor.redColor()
            SCNTransaction.commit()
        }
        
    }
    
    func updateCameraToViewScene()
    {
        
    }
    
    func updateHUD() {
        labelA.text = "\(myScene.getVertCount())"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

