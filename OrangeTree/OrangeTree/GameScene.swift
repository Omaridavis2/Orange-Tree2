//
//  GameScene.swift
//  OrangeTree
//
//  Created by Omari Davis on 2/6/23.
//
var shapeNode = SKShapeNode()
import SpriteKit

class GameScene: SKScene {
    var orangeTree: SKSpriteNode!
     var orange: Orange?
    
    var touchStart: CGPoint = .zero
    
    override func didMove(to view: SKView) {
      // Connect Game Objects
      orangeTree = childNode(withName: "tree") as? SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      // Get the location of the touch on the screen
      let touch = touches.first!
      let location = touch.location(in: self)
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
          // Get the location of the touch
          let touch = touches.first!
          let location = touch.location(in: self)

          // Update the position of the Orange to the current location
          orange?.position = location
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
          // Get the location of where the touch ended
          let touch = touches.first!
          let location = touch.location(in: self)

          // Get the difference between the start and end point as a vector
          let dx = touchStart.x - location.x
          let dy = touchStart.y - location.y
          let vector = CGVector(dx: dx, dy: dy)

          // Set the Orange dynamic again and apply the vector as an impulse
          orange?.physicsBody?.isDynamic = true
          orange?.physicsBody?.applyImpulse(vector)
        }

      // Check if the touch was on the Orange Tree
      if atPoint(location).name == "tree" {
        // Create the orange and add it to the scene at the touch location
        orange = Orange()
        orange?.physicsBody?.isDynamic = false
        orange?.position = location
        addChild(orange!)
          
          // Store the location of the touch
             touchStart = location
     
        // Give the orange an impulse to make it fly!
        let vector = CGVector(dx: 100, dy: 0)
        orange?.physicsBody?.applyImpulse(vector)
      }
    }
}


    

