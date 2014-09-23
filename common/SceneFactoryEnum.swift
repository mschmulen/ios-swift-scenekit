//
//  SceneFactoryEnum.swift
//  SceneKitA
//
//  Created by Matthew Schmulen on 9/9/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation
import SceneKit

enum SCNEnum: Int{
    case Sphere = 1
    case Cylinder, Box, Globe
    
    func simpleDescription() -> String
    {
        switch self {
        case .Sphere:
            return "Sphere"
        case .Cylinder:
            return "Cylinder"
        case .Box:
            return "Box"
        case .Globe:
            return "Globe"
        default:
            return "Uknown"
        }
    }
    
    func getScene() -> SCNNode{
        switch self {
        case .Sphere, .Cylinder, .Box, .Globe :
            
            let geometry = SCNSphere()
            
            let material = SCNMaterial()
            material.diffuse.contents = UIColor.blueColor()
            material.specular.contents = UIColor.blueColor()
            material.transparency = 0.5
            geometry.materials = [material]
            
            let sceneNode = SCNNode(geometry:geometry);
            sceneNode.name = "Sphere"
            return sceneNode;
        // case  .Box, .Globe:
        default :
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
    }
    
    //return String(self.raw)
}
let currentSceneEnum  = SCNEnum.Globe
let enumRawValue = currentSceneEnum.toRaw()


