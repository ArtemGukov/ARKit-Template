//
//  ViewController+Methods.swift
//  ARKit Template
//
//  Created by Артем on 31/03/2019.
//  Copyright © 2019 Gukov.space. All rights reserved.
//

import ARKit

extension ViewController {
    
    func createFloor(anchor: ARPlaneAnchor) -> SCNNode {
        let extent = anchor.extent
        let width = CGFloat(extent.x)
        let height = CGFloat(extent.z)
        
        let mainNode = SCNNode()
        let node = SCNNode(geometry: SCNPlane(width: width, height: height))
            
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        node.eulerAngles.x = -.pi / 2
        node.name = "floor"
        node.opacity = 0.25
        
        if let tree = addTree(x: anchor.center.x, y: 0.01, z: anchor.center.z) {
            mainNode.addChildNode(tree)
        }
        
        mainNode.addChildNode(node)
        
        return mainNode
    }
    
    func addTree(x: Float, y: Float, z: Float) -> SCNNode? {
        guard let scene = SCNScene(named: "art.scnassets/tree.dae") else { return nil }
        
        let node = scene.rootNode
        
        node.position = SCNVector3(x, y, z)
        
        sceneView.scene.rootNode.enumerateChildNodes { node, _ in
            if node.name == "floor" {
                node.removeFromParentNode()
            }
        }
        
        sceneView.scene.rootNode.addChildNode(node)
        
        return node
    }
}
