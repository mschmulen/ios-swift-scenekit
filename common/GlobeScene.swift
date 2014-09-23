//
//  SceneGlobe.swift
//  SceneKitA
//
//  Created by Matthew Schmulen on 9/2/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import SceneKit

class GlobeScene: SCNScene {
    
    //var ambientLightNode: SCNNode
    //var globeNode: SCNNode
    
    // MARK: init
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init() {
        super.init()
        setup()
    }
    
    // MARK: setup
    func setup() {
        
        /*
        self.camera = SCNCamera()
        self.camera.zNear = 0.01
        self.cameraNode = SCNNode()
        self.cameraNode.position = SCNVector3(x: 0.0, y: 0.0, z: 1.5)
        self.cameraNode.camera = self.camera
        
        self.camera.focalBlurRadius = 0;
        //        CABasicAnimation *theFocusAnimation = [CABasicAnimation animationWithKeyPath:"focalBlurRadius"];
        //        theFocusAnimation.fromValue = @(100);
        //        theFocusAnimation.toValue = @(0);
        //        theFocusAnimation.duration = 2.0;
        //        theFocusAnimation.removedOnCompletion = YES;
        //        [self.camera addAnimation:theFocusAnimation forKey:@"focus"];
        
        let theAmbientLight = SCNLight()
        theAmbientLight.type = SCNLightTypeAmbient
        theAmbientLight.color = UIColor(white: 0.5, alpha: 1.0)
        self.ambientLightNode = SCNNode()
        self.ambientLightNode.light = theAmbientLight
        
        self.globeNode = SCNNode()
        let theGlobeGeometry = SCNSphere(radius: 0.5)
        theGlobeGeometry.firstMaterial.diffuse.contents = UIImage(named:"earth_diffuse.jpg")
        theGlobeGeometry.firstMaterial.ambient.contents = UIImage(named:"earth_ambient2.jpeg")
        //		theGlobeGeometry.firstMaterial.ambient.contents = UIImage(named:"earth_ambient.jpg")
        theGlobeGeometry.firstMaterial.specular.contents = UIImage(named:"earth_specular.jpg")
        theGlobeGeometry.firstMaterial.emission.contents = nil
        theGlobeGeometry.firstMaterial.transparent.contents = nil
        theGlobeGeometry.firstMaterial.reflective.contents = nil
        theGlobeGeometry.firstMaterial.multiply.contents = nil
        theGlobeGeometry.firstMaterial.normal.contents = UIImage(named:"earth_normal.jpg")
        
        let theGlobeModelNode = SCNNode(geometry: theGlobeGeometry)
        self.globeNode.addChildNode(theGlobeModelNode)
        
        let theCloudGeometry = SCNSphere(radius:0.501)
        theCloudGeometry.firstMaterial.diffuse.contents = nil
        theCloudGeometry.firstMaterial.ambient.contents = nil
        theCloudGeometry.firstMaterial.specular.contents = nil
        theCloudGeometry.firstMaterial.emission.contents = nil
        theCloudGeometry.firstMaterial.transparent.contents = UIImage(named:"earth_clouds.png")
        theCloudGeometry.firstMaterial.reflective.contents = nil
        theCloudGeometry.firstMaterial.multiply.contents = nil
        theCloudGeometry.firstMaterial.normal.contents = nil
        
        let theCloudModelNode = SCNNode(geometry: theCloudGeometry)
        self.globeNode.addChildNode(theCloudModelNode)
        
        // animate the 3d object
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "rotation")
        animation.toValue = NSValue(SCNVector4: SCNVector4(x: 1, y: 1, z: 0, w: Float(M_PI)*2))
        animation.duration = 5
        animation.repeatCount = MAXFLOAT //repeat forever
        globeNode.addAnimation(animation, forKey: nil)
        
        super.init()
        
        self.rootNode.addChildNode(self.cameraNode)
        self.rootNode.addChildNode(self.ambientLightNode)
        self.rootNode.addChildNode(self.globeNode)
        */
        
        
        
        
        
        /*
        totalVertexCount = 0;
        
        //add some objects to the scene
        rootNode.addChildNode( loadCylinder() )
        rootNode.addChildNode ( loadSphere() )
        rootNode.addChildNode( loadBox() )
        
        rootNode.addChildNode( loadModelFile("LegoBrick.dae"))
        
        totalVertexCount = traverseForGeometryCount( rootNode )
        */
    }

    

}