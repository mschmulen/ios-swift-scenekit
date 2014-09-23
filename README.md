iOS Swift SceneKit
---

![image](/screenshots/screenshot1.png)

iOS model viewer using SceneKit and Swift.

###WHAT

###WHY 

###HOW

###NOTES


---

[About the Scene Kit Editor](https://developer.apple.com/library/mac/recipes/xcode_help-scene_kit_editor/Articles/AboutSceneKitEditor.html#//apple_ref/doc/uid/TP40012291-CH3-SW1)

Preview and edit your project’s 3D scenes using the Scene Kit editor.

The Scene Kit editor is designed to work with scenes created in 3D authoring tools and exported as Collada Data Asset Exchange (DAE) files. Using this editor, you can preview 3D scenes, inspect them for information needed for your source code, and adjust scene object parameters to enhance and fine-tune the rendering for your apps.

Note: The Scene Kit editor provides tools for you to use with the Scene Kit API. The Scene Kit API is available in OS X v10.8 and later.

https://developer.apple.com/library/mac/recipes/xcode_help-scene_kit_editor/Art/sk-editor-1a_2x.png


https://developer.apple.com/library/mac/recipes/xcode_help-scene_kit_editor/Articles/Adjusting3DScenes.html


---


##Mobile App


![image](/screenshots/screenshot1.png)


##Mobile content server


##Building and Running

###Building the iOS app

Requires XCode6-Beta6

open in XCode `open ./sceneKitA/SceneKitA.xcodeproj` and `⌘+R` to build



###Building the Node.js mobile content server

```
cd ./node-server
npm install
```

---



###Optimizing


I want to display the same SCNGeometry 1000 times, but with a specific animation (eg SCNActions for rotation, movement,...) and a different image as diffuse material.

```objc
//self is a SCNNode
//helper.getStar3D() is a SCNNode template which has been flattened
//the geometry is light (36 triangles according to scenekit statistic)

//need to copy the geometry and material so it is not shared by all nodes 
self.geometry=helper.getStar3D().geometry.copy() as SCNGeometry
self.geometry.firstMaterial = helper.getStar3D().geometry.firstMaterial.copy() as SCNMaterial

// texture has been extracted from a SKTextureAtlas 
self.geometry.firstMaterial.diffuse.contents=allTextures.firstObject as SKTexture

```

However on an iPad Air I'm only reaching 40fps (and 27 fps when animating the texture via SCNAction with a block that update firstMaterial.diffuse.contents )

I thought that using a SKTextureAtlas (so all the images are on the same texture) and use the same geometry (apparently when you copy a geometry, data are shared - cf [Building a Game with sceneKit](https://developer.apple.com/videos/wwdc/2014/)  ), I would get more fps because it should allow OpenGL optimization. I tried to play with a lot of parameters of SceneKit but with no success.

For the notice: the SceneKit statistics tells that there are 1000 draw calls, and Graphics stats in Xcode are :cpu 18ms, GPU is 22ms, tiler 18%, renderer 80%, device 88% (can't wait for the new SceneKit statistics module in Xcode!)

So my question is : Do you think it's normal performance or is there a way to optimize what I want to do in SceneKit? Thanks!

EDIT: Actually SKTextureAtlas does not seems to optimize the rendering but seems to reduce the frame rate. if I use UIImage instead of SKTexture coming from a SKTextureAtlas, I've got 25% improvement (50fps). Animating the texture (updating the texture of each object each 0.2 seconds) is really killing performance (20fps) using SKTextureAtlas or UIImages. I think I'm missing something here because SKTextureAtlas are usually used for optimization.


---



Todo:

- Select Collada model file from a tableView
- Load from the server
- Set the view frustrum to the model dimensions, for camera zoom, rotate and tap select.
- 
- 
- 
- 
- 
- 





