//
//  ViewController+Delegate.swift
//  ARKit Template
//
//  Created by Артем on 27/03/2019.
//  Copyright © 2019 Gukov.space. All rights reserved.
//

import ARKit

extension ViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let anchor = anchor as? ARPlaneAnchor else { return }
        node.addChildNode(createFloor(anchor: anchor))
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let anchor = anchor as? ARPlaneAnchor else { return }
        guard let planeNode = node.childNodes.first else { return }
        guard let plane = planeNode.geometry as? SCNPlane else { return }
        guard planeNode.name == "floor" else { return }
        
        planeNode.position = SCNVector3(anchor.center.x, 0, anchor.center.z)
        let extent = anchor.extent
        plane.width = CGFloat(extent.x)
        plane.height = CGFloat(extent.z)
        
    }
}




