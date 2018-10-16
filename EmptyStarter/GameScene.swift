import SpriteKit
import GameplayKit

class GameScene: SKScene {
        var scoreLabel: SKLabelNode!
        var score = 0

    override func didMove(to view: SKView) {
        //Make a repeating action that will call the method makeBox below
        let wait = SKAction.wait(forDuration: 1.5) //Make a wait
        //This block will call the function below
        let makeABox = SKAction.run {
            self.makeBox() // You must use self inside a block
        }
        let seq = SKAction.sequence([wait, makeABox]) // make a sequence
        let rep = SKAction.repeatForever(seq) //Maek a repeat forever
        
        run(rep) //Run the repeat action and the sequence runs forever
    }
    func makeBox(){
        
        let box = Box(screenSize: size)
        
        // Add the box
        addChild(box)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            let touchLocation = touch.location(in: self)
            let node = atPoint(touchLocation)
            if node.name == "box" {
                node.removeFromParent()
                score += 1
            }
            else {
                score -= 1
            }
        }
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}


