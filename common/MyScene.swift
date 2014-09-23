//
//  MyScene.swift
//  SceneKitA
//
//  Created by Matthew Schmulen on 9/1/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import SceneKit

class MyScene: SCNScene {
    
    var totalVertexCount:Int = 0
    
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
        
        totalVertexCount = 0;
        
        //add some objects to the scene
        rootNode.addChildNode( loadCylinder() )
        rootNode.addChildNode ( loadSphere() )
        rootNode.addChildNode( loadBox() )
        
        rootNode.addChildNode( loadModelFile("LegoBrick.dae"))
        
        totalVertexCount = traverseForGeometryCount( rootNode )
    }
    
    func selectNode ( node:SCNNode , geometryElementIndex:Int) {
        
        // Unhighlight the previous selection.
        //[self.selectedMaterial.emission removeAllAnimations];
        
        // Clear the selection.
        //self.selectedMaterial = nil;
        
        // Highight the selection, if there is one.
        /*
        if (node != nil) {
            // Convert the geometry element index to a material index.
            index = index % [node.geometry.materials count];
        
            // Make the material unique (i.e. unshared).
            SCNMaterial *unsharedMaterial = [[node.geometry.materials objectAtIndex:index] copy];
            [node.geometry replaceMaterialAtIndex:index withMaterial:unsharedMaterial];
            
            // Select the material.
            self.selectedMaterial = unsharedMaterial;
            
            // Animate the material.
            CABasicAnimation *highlightAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
            highlightAnimation.toValue = [NSColor blueColor];
            highlightAnimation.fromValue = [NSColor blackColor];
            highlightAnimation.repeatCount = MAXFLOAT;
            highlightAnimation.autoreverses = YES;
            highlightAnimation.duration = 0.5;
            highlightAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            
            [self.selectedMaterial.emission addAnimation:highlightAnimation forKey:@"highlight"];
        }
        */
    }
    
    func highlightNodeByName( nodeName:String)
    {
        let foundNode = rootNode.childNodeWithName(nodeName, recursively: true)
        
        if ( foundNode != nil)
        {
            //set the material to the highlight color material
            
            let highlightMaterial = SCNMaterial()
            highlightMaterial.diffuse.contents = UIColor.redColor()
            highlightMaterial.specular.contents = UIColor.redColor()
            highlightMaterial.transparency = 0.5
            //geometry.materials = [highlightMaterial]
            
            // MAS TODO
            //foundNode.geometry.materials = [highlightMaterial]
            
            //camera
            
            //light
            let specialLight = SCNLight()
            
            //foundNode.light = specialLight
        }
    }
    
    func loadModelFile(fileName:String ) -> SCNNode {
        let scene = SCNScene(named: fileName)
        let sceneNode = SCNNode()
        sceneNode.addChildNode(scene.rootNode)
        //sceneNode.transform
        //scene.rootNode.addChildNode(geoScene.rootNode.childNodeWithName("Ball", recursively: true))
        return sceneNode
    }
    
    func loadModelURL(urlName:String ) -> SCNNode {
        
        let sceneNode = SCNNode()
        
        // Clear any current selection.
        //self.selectedMaterial = nil;
        /*
        
        // create a dictionary containing the options we want.
        let options = @{
        // Create normals if absent.
        SCNSceneSourceCreateNormalsIfAbsentKey : @YES,
        // Optimize the rendering by flattening the scene graph when possible. Note that this would prevent you from animating objects independantly.
        SCNSceneSourceFlattenSceneKey : @YES
        };
        */
        
        let scene = SCNScene(named: urlName)
        //SCNScene *scene = [SCNScene sceneWithURL:url options:options error:&error];
        
        sceneNode.addChildNode(scene.rootNode)
        
        return sceneNode
    }
    
    func loadPrimative() ->SCNNode
    {
        let geometry = SCNCone()
        //SCNPyramid, SCNCylinder, SCNSphere, SCNBox, SCNTube, SCNTorus, SCNPlane, SCNCapsule
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.greenColor()
        material.specular.contents = UIColor.greenColor()
        material.transparency = 0.5
        geometry.materials = [material]
        
        let sceneNode = SCNNode( geometry:geometry )
        sceneNode.name = "Primative"
        return sceneNode

    }
    
    func loadCylinder() -> SCNNode
    {
        //println(X.instance)
        
        //SceneFactory.instance.Cylinder()
        //var SF = SceneFactory.instance
        //return SF.Cylinder()
        //       return SceneFactory.Cylinder(<#SceneFactory#>())
        
        let geometry = SCNCylinder()
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.greenColor()
        material.specular.contents = UIColor.greenColor()
        material.transparency = 0.5
        geometry.materials = [material]
        
        let sceneNode = SCNNode( geometry:geometry )
        sceneNode.name = "Cylinder"
        
        if ( true )
        {
            //sceneNode.position = SCNVector3(x: 0, y: 0, z: 0)
            //sceneNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: Float(M_PI / 2))
            var spin = CABasicAnimation(keyPath: "rotation")
            spin.byValue = NSValue(SCNVector4: SCNVector4(x: 0, y: 0, z: 1, w: 2*Float(M_PI)))
            spin.duration = 3
            spin.repeatCount = HUGE
            sceneNode.addAnimation(spin, forKey: "spin around")
        }
        
        if ( false )
        {
            sceneNode.position = SCNVector3(x: 0, y: 0, z: 0)
            // Point the pyramid in the -z direction
            sceneNode.pivot = SCNMatrix4MakeRotation(Float(M_PI_2), 1, 0, 0)
            //scene.rootNode.addChildNode(sceneNode)
            
            let spin = CABasicAnimation(keyPath: "rotation")
            // Use from-to to explicitly make a full rotation around z
            spin.fromValue = NSValue(SCNVector4: SCNVector4(x: 0, y: 0, z: 1, w: 0))
            //spin.toValue = NSValue(SCNVector4: SCNVector4(x: 0, y: 0, z: 1, w: CGFloat(2 * M_PI)))
            spin.duration = 3
            spin.repeatCount = .infinity
            sceneNode.addAnimation(spin, forKey: "spin around")
        }
        
        return sceneNode
        
    }
    
    func loadSphere() -> SCNNode
    {
        let geometry = SCNSphere()
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.blueColor()
        material.specular.contents = UIColor.blueColor()
        material.transparency = 0.5
        geometry.materials = [material]
        
        let sceneNode = SCNNode(geometry:geometry);
        sceneNode.name = "Sphere"
        return sceneNode;
    }
    
    func loadBox()->SCNNode
    {
        let geometry = SCNBox(width: 10.0, height: 3.0, length: 3.0, chamferRadius:1.0)
        //let geometry = SCNBox()
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.yellowColor()
        material.specular.contents = UIColor.yellowColor()
        material.transparency = 0.5
        geometry.materials = [material]
        
        let sceneNode = SCNNode(geometry:geometry);
        sceneNode.name = "Box"
        return sceneNode;
    }
    
    func loadStressTest() -> SCNNode
    {
        let sphere = SCNSphere(radius:0.5)
        
        /*
        for (int i=0; i<10; i++) {
            for(int j=0; j<10; j++){
                for(int k=0; k<10; k++){
                    SCNNode *myNode = [SCNNode nodeWithGeometry:sphere];
                    myNode.position = SCNVector3Make(i,j,k);
                    [root addChildNode:myNode];
                }
            }
        }
        */
        
        let sceneNode = SCNNode(geometry:sphere);
        sceneNode.name = "StressTest"
        return sceneNode;
    }
    
    //rootNode.getBoundingBoxMin(<#min: UnsafeMutablePointer<SCNVector3>#>, max: <#UnsafeMutablePointer<SCNVector3>#>)
    
    func getVertCount() -> Int
    {
        return totalVertexCount
    }
    
    //Traversers
    func traverseForGeometryCount( root:SCNNode ) -> Int
    {
        var returnValue = 0;
        
        for childNode in root.childNodes {
            //let yack = childNode.getVertCount()
            println("Node")// \(childNode.) !")
            returnValue += traverseForGeometryCount(childNode as SCNNode)
        }
        
        //SCNGeometryElement element = [node.geometry geometryElementAtIndex:0];
        //let vCount = scene.rootNode.geometry.geometryElementCount
        //totalVertexCount += vCount
        
        //let node = SCNNode(geometry: SCNGeometry( ..??.. "myModel.dae" ..??.. ))
        return returnValue
    }
    
}