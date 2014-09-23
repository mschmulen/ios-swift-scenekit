//
//  SceneFactory.swift
//  SceneKitA
//
//  Created by Matthew Schmulen on 9/5/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation
import SceneKit

class SceneFactory
{
    struct Static {
        static var instance : SceneFactory?
        static var token: dispatch_once_t = 0
    }
    
    class var instance : SceneFactory {
        dispatch_once(&Static.token) { Static.instance = SceneFactory() }
        return Static.instance!
    }
    
    init()
    {
        assert(Static.instance == nil, "Singleton already initialized")
    }
    
    func Cylinder() -> SCNNode
    {
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
    
    func Sphere() -> SCNNode
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
    
    func Box()->SCNNode
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
    
}