//
//  GameScene.swift
//  progetto
//
//  Created by Alessandro Volpe on 02/02/21.
//

import SpriteKit

enum DataType: UInt32 {
  case string = 1
  case image = 2
  case sheet = 3
  case d2 = 4
  case d4 = 5
  case d6 = 6
  case d8 = 7
  case d10 = 8
  case d12 = 9
  case d20 = 10
  case sound = 11
  case clear = 69
}
class GameScene: SKScene {
    
    let nearbyService = NearbyService(serviceType: "game")
    var background = SKSpriteNode()
    var grid = SKSpriteNode()
    var scroll = SKShapeNode()
    var scroll2 = SKShapeNode()

    var canPlaySound = false
    
    var diceIcon = SKSpriteNode(imageNamed: "dice")
    var palla1 = SKShapeNode(circleOfRadius: 35)
    var palla2 = SKShapeNode(circleOfRadius: 35)
    var turnIcon = SKSpriteNode(imageNamed: "actions")
    
    var arrD2 = [Int]()
    var arrD4 = [Int]()
    var arrD6 = [Int]()
    var arrD8 = [Int]()
    var arrD10 = [Int]()
    var arrD12 = [Int]()
    var arrD20 = [Int]()
    
    var Player1 = SKSpriteNode()
    var Player2 = SKSpriteNode()
    var Player3 = SKSpriteNode()
    var Player4 = SKSpriteNode()
    var avatar1 = SKShapeNode()
    var avatar2 = SKShapeNode()
    var avatar3 = SKShapeNode()
    var avatar4 = SKShapeNode()
    var turnAv1 = SKShapeNode()
    var turnAv2 = SKShapeNode()
    var turnAv3 = SKShapeNode()
    var turnAv4 = SKShapeNode()
    
    var brown = UIColor()
    var yellow = UIColor()
    var infoContainer1 = SKShapeNode()
    var infoContainer2 = SKShapeNode()
    var infoContainer3 = SKShapeNode()
    var infoContainer4 = SKShapeNode()
    var infoContainerBack1 = SKShapeNode()
    var infoContainerBack2 = SKShapeNode()
    var infoContainerBack3 = SKShapeNode()
    var infoContainerBack4 = SKShapeNode()
    var turnContainer = SKShapeNode()
    
    
    var diceContainer = SKShapeNode()
    
    //MARK: DEF SEP FRONT
    var separator1 = SKSpriteNode()
    var separator2 = SKSpriteNode()
    var separator3 = SKSpriteNode()
    var separator4 = SKSpriteNode()
    var separator5 = SKSpriteNode()
    var separator6 = SKSpriteNode()
    var separator7 = SKSpriteNode()
    var separator8 = SKSpriteNode()
    //MARK: DEF SEP BACK
    var separator9 = SKSpriteNode()
    var separator10 = SKSpriteNode()
    var separator11 = SKSpriteNode()
    var separator12 = SKSpriteNode()
    var separator13 = SKSpriteNode()
    var separator14 = SKSpriteNode()
    var separator15 = SKSpriteNode()
    var separator16 = SKSpriteNode()
    var separator17 = SKSpriteNode()
    var separator18 = SKSpriteNode()
    var separator19 = SKSpriteNode()
    var separator20 = SKSpriteNode()
    var separator21 = SKSpriteNode()
    var separator22 = SKSpriteNode()
    var separator23 = SKSpriteNode()
    var separator24 = SKSpriteNode()
    var separator25 = SKSpriteNode()
    var separator26 = SKSpriteNode()
    var separator27 = SKSpriteNode()
    var separator28 = SKSpriteNode()
    
    var separator29 = SKSpriteNode()
    var separator30 = SKSpriteNode()
    var separator31 = SKSpriteNode()
    
    var playerLabel1 = SKLabelNode()
    var playerLabel2 = SKLabelNode()
    var playerLabel3 = SKLabelNode()
    var playerLabel4 = SKLabelNode()
    
    var playerLabelBack1 = SKLabelNode()
    var playerLabelBack2 = SKLabelNode()
    var playerLabelBack3 = SKLabelNode()
    var playerLabelBack4 = SKLabelNode()
    
    var diceLabel = SKLabelNode()
    
    var name1 = SKLabelNode()
    var name2 = SKLabelNode()
    var name3 = SKLabelNode()
    var name4 = SKLabelNode()
    var nameContainer1 = SKLabelNode()
    var nameContainer2 = SKLabelNode()
    var nameContainer3 = SKLabelNode()
    var nameContainer4 = SKLabelNode()
    
    var turnName1 = SKLabelNode()
    var turnName2 = SKLabelNode()
    var turnName3 = SKLabelNode()
    var turnName4 = SKLabelNode()
    
    var turnIn1 = SKLabelNode()
    var turnIn2 = SKLabelNode()
    var turnIn3 = SKLabelNode()
    var turnIn4 = SKLabelNode()
    var turnInCont1 = SKLabelNode()
    var turnInCont2 = SKLabelNode()
    var turnInCont3 = SKLabelNode()
    var turnInCont4 = SKLabelNode()
    
    var turnSp1 = SKLabelNode()
    var turnSp2 = SKLabelNode()
    var turnSp3 = SKLabelNode()
    var turnSp4 = SKLabelNode()
    var turnSpCont1 = SKLabelNode()
    var turnSpCont2 = SKLabelNode()
    var turnSpCont3 = SKLabelNode()
    var turnSpCont4 = SKLabelNode()
    
    
    var race1 = SKLabelNode()
    var race2 = SKLabelNode()
    var race3 = SKLabelNode()
    var race4 = SKLabelNode()
    var raceContainer1 = SKLabelNode()
    var raceContainer2 = SKLabelNode()
    var raceContainer3 = SKLabelNode()
    var raceContainer4 = SKLabelNode()
    
    var class1 = SKLabelNode()
    var class2 = SKLabelNode()
    var class3 = SKLabelNode()
    var class4 = SKLabelNode()
    var classContainer1 = SKLabelNode()
    var classContainer2 = SKLabelNode()
    var classContainer3 = SKLabelNode()
    var classContainer4 = SKLabelNode()
    
    var health1 = SKLabelNode()
    var health2 = SKLabelNode()
    var health3 = SKLabelNode()
    var health4 = SKLabelNode()
    var healthContainer1 = SKLabelNode()
    var healthContainer2 = SKLabelNode()
    var healthContainer3 = SKLabelNode()
    var healthContainer4 = SKLabelNode()
    
    var ac1 = SKLabelNode()
    var ac2 = SKLabelNode()
    var ac3 = SKLabelNode()
    var ac4 = SKLabelNode()
    var acContainer1 = SKLabelNode()
    var acContainer2 = SKLabelNode()
    var acContainer3 = SKLabelNode()
    var acContainer4 = SKLabelNode()
    
    var sp1 = SKLabelNode()
    var sp2 = SKLabelNode()
    var sp3 = SKLabelNode()
    var sp4 = SKLabelNode()
    var spContainer1 = SKLabelNode()
    var spContainer2 = SKLabelNode()
    var spContainer3 = SKLabelNode()
    var spContainer4 = SKLabelNode()
    
    var in1 = SKLabelNode()
    var in2 = SKLabelNode()
    var in3 = SKLabelNode()
    var in4 = SKLabelNode()
    var inContainer1 = SKLabelNode()
    var inContainer2 = SKLabelNode()
    var inContainer3 = SKLabelNode()
    var inContainer4 = SKLabelNode()
    
    var pp1 = SKLabelNode()
    var pp2 = SKLabelNode()
    var pp3 = SKLabelNode()
    var pp4 = SKLabelNode()
    var ppContainer1 = SKLabelNode()
    var ppContainer2 = SKLabelNode()
    var ppContainer3 = SKLabelNode()
    var ppContainer4 = SKLabelNode()
    
    var cr1 = SKLabelNode()
    var cr2 = SKLabelNode()
    var cr3 = SKLabelNode()
    var cr4 = SKLabelNode()
    var crContainer1 = SKLabelNode()
    var crContainer2 = SKLabelNode()
    var crContainer3 = SKLabelNode()
    var crContainer4 = SKLabelNode()

    var faceUp = true
    var InCalc = [String]()
    var playerOrder = [Sheet2]()
    
    var move = SKAction()
    var yMove = SKAction()
    var charLabel = SKLabelNode()
    var turnLabel = SKLabelNode()
    var panel = SKSpriteNode()
    var rightPanelShowed = false
    var leftPanelShowed = false
    var charactPanelShowed = false
    var constraint = SKConstraint.positionX(SKRange(lowerLimit: 730, upperLimit: 1080))
    var constraint2 = SKConstraint.positionX(SKRange(lowerLimit: -1080, upperLimit: -730))
    var constraint3 = SKConstraint.positionY(SKRange(lowerLimit: -730, upperLimit: -300))
    
    override func didMove(to view: SKView) {
        
        if let imageData = UserDefaults.standard.object(forKey: "image"),
          let im = UIImage(data: imageData as! Data) {
            background.texture = SKTexture(image: im)
       }else{
           background = SKSpriteNode(imageNamed: "background")

        }
//      if let data2 = UserDefaults.standard.data(forKey: "player1"){
//            do {
//                    // Create JSON Decoder
//                    let decoder = JSONDecoder()
//
//                    // Decode Note
//                    let note = try decoder.decode(Sheet2.self, from: data2)
//                background.texture = SKTexture(image: UIImage(data: note.image )!)
//
//                } catch {
//                    print("Unable to Decode Note (\(error))")
//                }
//        }
        background.size = CGSize(width: 1920, height: 1080)
        background.position = CGPoint(x: 0, y: 0)
        grid = SKSpriteNode(imageNamed: "grid")
        grid.size = CGSize(width: 1920, height: 1080)
        grid.position = CGPoint(x: 0, y: 0)
        grid.zPosition = 7
        grid.alpha = 0.4
        scroll = SKShapeNode(rect: CGRect(x: 820, y: -450, width: 500, height: 900), cornerRadius: 40)
        scroll.fillColor = .white
        scroll.fillTexture = SKTexture(imageNamed: "scroll")
        scroll.strokeTexture = SKTexture(imageNamed: "scroll")
        //scroll.position = CGPoint(x: 1080, y: 0)
        
        
//        scroll = childNode(withName: "scroll") as! SKSpriteNode
        scroll.zPosition = 10
       // scroll.constraints = [constraint]
        
//        scroll2 = childNode(withName: "scroll2") as! SKSpriteNode
        scroll2 = SKShapeNode(rect: CGRect(x: -2320, y: -450, width: 1500, height: 900), cornerRadius: 40)
        scroll2.fillColor = .white
        scroll2.fillTexture = SKTexture(imageNamed: "scroll")
        scroll2.strokeTexture = SKTexture(imageNamed: "scroll")
        
        scroll2.zPosition = 10
        //scroll2.constraints = [constraint2]
        
        
        //MARK: COLORS
        brown = UIColor.init(red: 47/255, green: 31/255, blue: 22/255, alpha: 1)
        yellow = UIColor.init(red: 241/255, green: 215/255, blue: 153/255, alpha: 1)
        //MARK: TURN LABEL
        turnLabel = SKLabelNode(text: "TURN ORDER")
        turnLabel.fontName = "Helvetica-bold"
        turnLabel.fontColor = brown
        turnLabel.fontSize = 32
        turnLabel.position = CGPoint(x: 1080, y: 400)
        turnLabel.zPosition = 300
        //MARK: DICE LABEL
        diceLabel = SKLabelNode(text: "DICE TABLE")
        diceLabel.fontName = "Helvetica-bold"
        diceLabel.fontColor = brown
        diceLabel.fontSize = 32
        diceLabel.position = CGPoint(x: -1480, y: 400)
        diceLabel.zPosition = 300
        // MARK: TURN CONTAINER
        turnContainer = SKShapeNode(rect: CGRect(x: 870, y: -380, width: 400, height: 750),cornerRadius: 40)
        turnContainer.fillColor = brown
        turnContainer.strokeColor = brown
        turnContainer.zPosition = 1
        
//        MARK: DICE CONTAINER
        diceContainer = SKShapeNode(rect: CGRect(x: -1970, y: -380, width: 1100, height: 750),cornerRadius: 40)
        diceContainer.fillColor = brown
        diceContainer.strokeColor = brown
        diceContainer.zPosition = 1
        
        
//        MARK: ICONE
        palla1.position = CGPoint(x:-818, y:0)
        palla1.zPosition = 1
        palla1.fillColor = brown
        palla1.strokeColor = brown
        diceIcon.position = CGPoint(x: 0, y: 0)
        diceIcon.color = .white
        diceIcon.zPosition = 2
        
        palla2.position = CGPoint(x:818, y:0)
        palla2.zPosition = 1
        palla2.fillColor = brown
        palla2.strokeColor = brown
        turnIcon.position = CGPoint(x: 0, y: 0)
        turnIcon.zPosition = 2
        
        
        
        //MARK: SEPARATOR TURN
        separator29 = SKSpriteNode(color: .lightGray, size: CGSize(width: 385, height: 1))
        separator29.position = CGPoint(x: 1070, y: -193)
        separator29.zPosition = 2
        turnContainer.addChild(separator29)
        separator30 = SKSpriteNode(color: .lightGray, size: CGSize(width: 385, height: 1))
        separator30.position = CGPoint(x: 1070, y: -5)
        separator30.zPosition = 2
        turnContainer.addChild(separator30)
        separator31 = SKSpriteNode(color: .lightGray, size: CGSize(width: 385, height: 1))
        separator31.position = CGPoint(x: 1070, y: 183)
        separator31.zPosition = 2
        turnContainer.addChild(separator31)
        
        //MARK: TURN AVATARS
        turnAv1 = SKShapeNode(circleOfRadius: 50)
        turnAv1.yScale = 1.0
        turnAv1.fillColor = .white
        turnAv1.fillTexture = SKTexture(imageNamed: "avatar")
        turnAv1.strokeColor = yellow
        turnAv1.zPosition = 2
        turnAv1.position = CGPoint(x: 950, y: 280)
        turnContainer.addChild(turnAv1)
        
        turnAv2 = SKShapeNode(circleOfRadius: 50)
        turnAv2.yScale = 1.0
        turnAv2.fillColor = .white
        turnAv2.fillTexture = SKTexture(imageNamed: "avatar")
        turnAv2.strokeColor = yellow
        turnAv2.zPosition = 2
        turnAv2.position = CGPoint(x: 950, y: 92)
        turnContainer.addChild(turnAv2)
        
        turnAv3 = SKShapeNode(circleOfRadius: 50)
        turnAv3.yScale = 1.0
        turnAv3.fillColor = .white
        turnAv3.fillTexture = SKTexture(imageNamed: "avatar")
        turnAv3.strokeColor = yellow
        turnAv3.zPosition = 2
        turnAv3.position = CGPoint(x: 950, y: -96)
        turnContainer.addChild(turnAv3)
        
        turnAv4 = SKShapeNode(circleOfRadius: 50)
        turnAv4.yScale = 1.0
        turnAv4.fillColor = .white
        turnAv4.fillTexture = SKTexture(imageNamed: "avatar")
        turnAv4.strokeColor = yellow
        turnAv4.zPosition = 2
        turnAv4.position = CGPoint(x: 950, y: -283)
        turnContainer.addChild(turnAv4)
        
        //MARK: TURN NAMES
        turnName1 = SKLabelNode(text: "NAME")
        turnName1.fontName = "Helvetica-bold"
        turnName1.fontSize = 26
        turnName1.fontColor = yellow
        turnName1.horizontalAlignmentMode = .left
        turnContainer.addChild(turnName1)
        turnName1.position = CGPoint(x: 910, y: 200 )
        turnName1.zPosition = 3
        
        turnName2 = SKLabelNode(text: "NAME")
        turnName2.fontName = "Helvetica-bold"
        turnName2.fontSize = 26
        turnName2.fontColor = yellow
        turnName2.horizontalAlignmentMode = .left
        turnContainer.addChild(turnName2)
        turnName2.position = CGPoint(x: 910, y: 12)
        turnName2.zPosition = 3
        
        turnName3 = SKLabelNode(text: "NAME")
        turnName3.fontName = "Helvetica-bold"
        turnName3.fontSize = 26
        turnName3.fontColor = yellow
        turnName3.horizontalAlignmentMode = .left
        turnContainer.addChild(turnName3)
        turnName3.position = CGPoint(x: 910, y: -176)
        turnName3.zPosition = 3
        
        turnName4 = SKLabelNode(text: "NAME")
        turnName4.fontName = "Helvetica-bold"
        turnName4.fontSize = 26
        turnName4.fontColor = yellow
        turnName4.horizontalAlignmentMode = .left
        turnContainer.addChild(turnName4)
        turnName4.position = CGPoint(x: 910, y: -363)
        turnName4.zPosition = 3
        
        // MARK: TURN IN
        turnIn1 = SKLabelNode(text: "IN")
        turnIn1.fontName = "Helvetica-bold"
        turnIn1.fontColor = yellow
        turnIn1.fontSize = 30
        turnIn1.position = CGPoint(x: 1097, y: 310)
        turnIn1.zPosition = 22
        turnContainer.addChild(turnIn1)
        
        turnIn2 = SKLabelNode(text: "IN")
        turnIn2.fontName = "Helvetica-bold"
        turnIn2.fontColor = yellow
        turnIn2.fontSize = 30
        turnIn2.position = CGPoint(x: 1097, y: 122)
        turnIn2.zPosition = 22
        turnContainer.addChild(turnIn2)
        
        turnIn3 = SKLabelNode(text: "IN")
        turnIn3.fontName = "Helvetica-bold"
        turnIn3.fontColor = yellow
        turnIn3.fontSize = 30
        turnIn3.position = CGPoint(x: 1097, y: -66)
        turnIn3.zPosition = 22
        turnContainer.addChild(turnIn3)
        
        turnIn4 = SKLabelNode(text: "IN")
        turnIn4.fontName = "Helvetica-bold"
        turnIn4.fontColor = yellow
        turnIn4.fontSize = 30
        turnIn4.position = CGPoint(x: 1097, y: -253)
        turnIn4.zPosition = 22
        turnContainer.addChild(turnIn4)
        
        turnInCont1 = SKLabelNode(text: "10")
        turnInCont1.fontName = "Helvetica-bold"
        turnInCont1.fontColor = yellow
        turnInCont1.fontSize = 55
        turnInCont1.position = CGPoint(x: 1097, y: 240)
        turnInCont1.zPosition = 22
        turnContainer.addChild(turnInCont1)
        
        turnInCont2 = SKLabelNode(text: "10")
        turnInCont2.fontName = "Helvetica-bold"
        turnInCont2.fontColor = yellow
        turnInCont2.fontSize = 55
        turnInCont2.position = CGPoint(x: 1097, y: 52)
        turnInCont2.zPosition = 22
        turnContainer.addChild(turnInCont2)
        
        turnInCont3 = SKLabelNode(text: "10")
        turnInCont3.fontName = "Helvetica-bold"
        turnInCont3.fontColor = yellow
        turnInCont3.fontSize = 55
        turnInCont3.position = CGPoint(x: 1097, y: -136)
        turnInCont3.zPosition = 22
        turnContainer.addChild(turnInCont3)
        
        turnInCont4 = SKLabelNode(text: "10")
        turnInCont4.fontName = "Helvetica-bold"
        turnInCont4.fontColor = yellow
        turnInCont4.fontSize = 55
        turnInCont4.position = CGPoint(x: 1097, y: -323)
        turnInCont4.zPosition = 22
        turnContainer.addChild(turnInCont4)
        
        //MARK: TURN SP
        turnSp1 = SKLabelNode(text: "SP")
        turnSp1.fontName = "Helvetica-bold"
        turnSp1.fontColor = yellow
        turnSp1.fontSize = 30
        turnSp1.position = CGPoint(x: 1200, y: 310)
        turnSp1.zPosition = 22
        turnContainer.addChild(turnSp1)
        
        turnSp2 = SKLabelNode(text: "SP")
        turnSp2.fontName = "Helvetica-bold"
        turnSp2.fontColor = yellow
        turnSp2.fontSize = 30
        turnSp2.position = CGPoint(x: 1200, y: 122)
        turnSp2.zPosition = 22
        turnContainer.addChild(turnSp2)
        
        turnSp3 = SKLabelNode(text: "SP")
        turnSp3.fontName = "Helvetica-bold"
        turnSp3.fontColor = yellow
        turnSp3.fontSize = 30
        turnSp3.position = CGPoint(x: 1200, y: -66)
        turnSp3.zPosition = 22
        turnContainer.addChild(turnSp3)
        
        turnSp4 = SKLabelNode(text: "SP")
        turnSp4.fontName = "Helvetica-bold"
        turnSp4.fontColor = yellow
        turnSp4.fontSize = 30
        turnSp4.position = CGPoint(x: 1200, y: -253)
        turnSp4.zPosition = 22
        turnContainer.addChild(turnSp4)
        
        turnSpCont1 = SKLabelNode(text: "10")
        turnSpCont1.fontName = "Helvetica-bold"
        turnSpCont1.fontColor = yellow
        turnSpCont1.fontSize = 55
        turnSpCont1.position = CGPoint(x: 1200, y: 240)
        turnSpCont1.zPosition = 22
        turnContainer.addChild(turnSpCont1)
        
        turnSpCont2 = SKLabelNode(text: "10")
        turnSpCont2.fontName = "Helvetica-bold"
        turnSpCont2.fontColor = yellow
        turnSpCont2.fontSize = 55
        turnSpCont2.position = CGPoint(x: 1200, y: 52)
        turnSpCont2.zPosition = 22
        turnContainer.addChild(turnSpCont2)
        
        turnSpCont3 = SKLabelNode(text: "10")
        turnSpCont3.fontName = "Helvetica-bold"
        turnSpCont3.fontColor = yellow
        turnSpCont3.fontSize = 55
        turnSpCont3.position = CGPoint(x: 1200, y: -136)
        turnSpCont3.zPosition = 22
        turnContainer.addChild(turnSpCont3)
        
        turnSpCont4 = SKLabelNode(text: "10")
        turnSpCont4.fontName = "Helvetica-bold"
        turnSpCont4.fontColor = yellow
        turnSpCont4.fontSize = 55
        turnSpCont4.position = CGPoint(x: 1200, y: -323)
        turnSpCont4.zPosition = 22
        turnContainer.addChild(turnSpCont4)
        
        // MARK: PLAYERS
        Player1 = childNode(withName: "Player1") as! SKSpriteNode
        Player1.zPosition = 10
        Player1.constraints = [constraint3]
        Player1.texture = SKTexture(image: UIImage(named: "scroll")!)
        Player1.drawBorder(color: .red, width: 5)
        Player2 = childNode(withName: "Player2") as! SKSpriteNode
        Player2.zPosition = 10
        Player2.constraints = [constraint3]
        Player2.texture = SKTexture(image: UIImage(named: "scroll")!)
        Player2.drawBorder(color: .red, width: 5)
        Player3 = childNode(withName: "Player3") as! SKSpriteNode
        Player3.zPosition = 10
        Player3.constraints = [constraint3]
        Player3.texture = SKTexture(image: UIImage(named: "scroll")!)
        Player3.drawBorder(color: .red, width: 5)
        Player4 = childNode(withName: "Player4") as! SKSpriteNode
        Player4.zPosition = 10
        Player4.constraints = [constraint3]
        Player4.texture = SKTexture(image: UIImage(named: "scroll")!)
        Player4.drawBorder(color: .red, width: 5)
        
        // MARK: CARD ITEMS
       
        avatar1 = SKShapeNode(circleOfRadius: 40)
        avatar1.yScale = 0.85
        avatar1.fillColor = .white
        avatar1.fillTexture = SKTexture(imageNamed: "avatar")
        avatar1.strokeColor = UIColor.init(red: 47/255, green: 31/255, blue: 22/255, alpha: 1)
        
        Player1.addChild(avatar1)
        avatar1.position = CGPoint(x: 0, y: 25)
        avatar1.zPosition = 10
        
        avatar2 = SKShapeNode(circleOfRadius: 40)
        avatar2.yScale = 0.85
        avatar2.fillColor = .white
        avatar2.fillTexture = SKTexture(imageNamed: "avatar")
        avatar2.strokeColor = UIColor.init(red: 47/255, green: 31/255, blue: 22/255, alpha: 1)
        
        Player2.addChild(avatar2)
        avatar2.position = CGPoint(x: 0, y: 25)
        avatar2.zPosition = 10
        
        avatar3 = SKShapeNode(circleOfRadius: 40)
        avatar3.yScale = 0.85
        avatar3.fillColor = .white
        avatar3.fillTexture = SKTexture(imageNamed: "avatar")
        avatar3.strokeColor = UIColor.init(red: 47/255, green: 31/255, blue: 22/255, alpha: 1)
        
        Player3.addChild(avatar3)
        avatar3.position = CGPoint(x: 0, y: 25)
        avatar3.zPosition = 10
        
        avatar4 = SKShapeNode(circleOfRadius: 40)
        avatar4.yScale = 0.85
        avatar4.fillColor = .white
        avatar4.fillTexture = SKTexture(imageNamed: "avatar")
        avatar4.strokeColor = UIColor.init(red: 47/255, green: 31/255, blue: 22/255, alpha: 1)
        
        Player4.addChild(avatar4)
        avatar4.position = CGPoint(x: 0, y: 25)
        avatar4.zPosition = 10
        
        infoContainer1 = SKShapeNode(rect: CGRect(x: -50, y: -85, width: 100, height: 70), cornerRadius: 10)
        infoContainer1.zPosition = 10
        infoContainer1.fillColor = brown
        infoContainer1.strokeColor = brown
        Player1.addChild(infoContainer1)
        
        infoContainer2 = SKShapeNode(rect: CGRect(x: -50, y: -85, width: 100, height: 70), cornerRadius: 10)
        infoContainer2.zPosition = 10
        infoContainer2.fillColor = brown
        infoContainer2.strokeColor = brown
        Player2.addChild(infoContainer2)
        
        infoContainer3 = SKShapeNode(rect: CGRect(x: -50, y: -85, width: 100, height: 70), cornerRadius: 10)
        infoContainer3.zPosition = 10
        infoContainer3.fillColor = brown
        infoContainer3.strokeColor = brown
        Player3.addChild(infoContainer3)
        
        infoContainer4 = SKShapeNode(rect: CGRect(x: -50, y: -85, width: 100, height: 70), cornerRadius: 10)
        infoContainer4.zPosition = 10
        infoContainer4.fillColor = brown
        infoContainer4.strokeColor = brown
        Player4.addChild(infoContainer4)
        
        infoContainerBack1 = SKShapeNode(rect: CGRect(x: -50, y: -85, width: 100, height: 140), cornerRadius: 10)
        infoContainerBack1.zPosition = 10
        infoContainerBack1.fillColor = brown
        infoContainerBack1.strokeColor = brown
        Player1.addChild(infoContainerBack1)
        infoContainerBack1.isHidden = true
        infoContainerBack2 = SKShapeNode(rect: CGRect(x: -50, y: -85, width: 100, height: 140), cornerRadius: 10)
        infoContainerBack2.zPosition = 10
        infoContainerBack2.fillColor = brown
        infoContainerBack2.strokeColor = brown
        Player2.addChild(infoContainerBack2)
        infoContainerBack2.isHidden = true
        
        infoContainerBack3 = SKShapeNode(rect: CGRect(x: -50, y: -85, width: 100, height: 140), cornerRadius: 10)
        infoContainerBack3.zPosition = 10
        infoContainerBack3.fillColor = brown
        infoContainerBack3.strokeColor = brown
        Player3.addChild(infoContainerBack3)
        infoContainerBack3.isHidden = true
        
        infoContainerBack4 = SKShapeNode(rect: CGRect(x: -50, y: -85, width: 100, height: 140), cornerRadius: 10)
        infoContainerBack4.zPosition = 10
        infoContainerBack4.fillColor = brown
        infoContainerBack4.strokeColor = brown
        Player4.addChild(infoContainerBack4)
        infoContainerBack4.isHidden = true
        
        
        
        //MARK: SEPARATORS FRONT
        separator1 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator1.position = CGPoint(x: -0, y: -38)
        separator1.zPosition = 20
        infoContainer1.addChild(separator1)
        separator2 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator2.position = CGPoint(x: -0, y: -63)
        separator2.zPosition = 20
        infoContainer1.addChild(separator2)
        separator3 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator3.position = CGPoint(x: -0, y: -38)
        separator3.zPosition = 20
        infoContainer2.addChild(separator3)
        separator4 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator4.position = CGPoint(x: -0, y: -63)
        separator4.zPosition = 20
        infoContainer2.addChild(separator4)
        separator5 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator5.position = CGPoint(x: -0, y: -38)
        separator5.zPosition = 20
        infoContainer3.addChild(separator5)
        separator6 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator6.position = CGPoint(x: -0, y: -63)
        separator6.zPosition = 20
        infoContainer3.addChild(separator6)
        separator7 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator7.position = CGPoint(x: -0, y: -38)
        separator7.zPosition = 20
        infoContainer4.addChild(separator7)
        separator8 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator8.position = CGPoint(x: -0, y: -63)
        separator8.zPosition = 20
        infoContainer4.addChild(separator8)
        //MARK: SEPARATORS BACK
        separator9 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator9.position = CGPoint(x: -0, y: 29)
        separator9.zPosition = 20
        infoContainerBack1.addChild(separator9)
        separator10 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator10.position = CGPoint(x: -0, y: 6)
        separator10.zPosition = 20
        infoContainerBack1.addChild(separator10)
        separator11 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator11.position = CGPoint(x: -0, y: -17)
        separator11.zPosition = 20
        infoContainerBack1.addChild(separator11)
        separator12 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator12.position = CGPoint(x: -0, y: -40)
        separator12.zPosition = 20
        infoContainerBack1.addChild(separator12)
        separator13 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator13.position = CGPoint(x: -0, y: -63)
        separator13.zPosition = 20
        infoContainerBack1.addChild(separator13)
        separator14 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator14.position = CGPoint(x: -0, y: 29)
        separator14.zPosition = 20
        infoContainerBack2.addChild(separator14)
        separator15 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator15.position = CGPoint(x: -0, y: 6)
        separator15.zPosition = 20
        infoContainerBack2.addChild(separator15)
        separator16 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator16.position = CGPoint(x: -0, y: -17)
        separator16.zPosition = 20
        infoContainerBack2.addChild(separator16)
        separator17 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator17.position = CGPoint(x: -0, y: -40)
        separator17.zPosition = 20
        infoContainerBack2.addChild(separator17)
        separator18 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator18.position = CGPoint(x: -0, y: -63)
        separator18.zPosition = 20
        infoContainerBack2.addChild(separator18)
        separator19 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator19.position = CGPoint(x: -0, y: 29)
        separator19.zPosition = 20
        infoContainerBack3.addChild(separator19)
        separator20 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator20.position = CGPoint(x: -0, y: 6)
        separator20.zPosition = 20
        infoContainerBack3.addChild(separator20)
        separator21 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator21.position = CGPoint(x: -0, y: -17)
        separator21.zPosition = 20
        infoContainerBack3.addChild(separator21)
        separator22 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator22.position = CGPoint(x: -0, y: -40)
        separator22.zPosition = 20
        infoContainerBack3.addChild(separator22)
        separator23 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator23.position = CGPoint(x: -0, y: -63)
        separator23.zPosition = 20
        infoContainerBack3.addChild(separator23)
        separator24 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator24.position = CGPoint(x: -0, y: 29)
        separator24.zPosition = 20
        infoContainerBack4.addChild(separator24)
        separator25 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator25.position = CGPoint(x: -0, y: 6)
        separator25.zPosition = 20
        infoContainerBack4.addChild(separator25)
        separator26 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator26.position = CGPoint(x: -0, y: -17)
        separator26.zPosition = 20
        infoContainerBack4.addChild(separator26)
        separator27 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator27.position = CGPoint(x: -0, y: -40)
        separator27.zPosition = 20
        infoContainerBack4.addChild(separator27)
        separator28 = SKSpriteNode(color: .lightGray, size: CGSize(width: 90, height: 1))
        separator28.position = CGPoint(x: -0, y: -63)
        separator28.zPosition = 20
        infoContainerBack4.addChild(separator28)
//        MARK: HIDE
//        infoContainer1.isHidden = true
//        infoContainer2.isHidden = true
//        infoContainer3.isHidden = true
//        infoContainer4.isHidden = true
//        avatar1.isHidden = true
//        avatar2.isHidden = true
//        avatar3.isHidden = true
//        avatar4.isHidden = true
        
        
        
        //MARK: LABELS
        playerLabel1 = SKLabelNode(text: "PLAYER I")
        playerLabel1.fontName = "Helvetica-bold"
        playerLabel1.fontSize = 16
        playerLabel1.fontColor = brown
        Player1.addChild(playerLabel1)
        playerLabel1.position = CGPoint(x: 0, y: 75)
        playerLabel1.zPosition = 20
        
        playerLabel2 = SKLabelNode(text: "PLAYER II")
        playerLabel2.fontName = "Helvetica-bold"
        playerLabel2.fontSize = 16
        playerLabel2.fontColor = brown
        Player2.addChild(playerLabel2)
        playerLabel2.position = CGPoint(x: 0, y: 75)
        playerLabel2.zPosition = 20
        
        playerLabel3 = SKLabelNode(text: "PLAYER III")
        playerLabel3.fontName = "Helvetica-bold"
        playerLabel3.fontSize = 16
        playerLabel3.fontColor = brown
        Player3.addChild(playerLabel3)
        playerLabel3.position = CGPoint(x: 0, y: 75)
        playerLabel3.zPosition = 20
        
        playerLabel4 = SKLabelNode(text: "PLAYER IV")
        playerLabel4.fontName = "Helvetica-bold"
        playerLabel4.fontSize = 16
        playerLabel4.fontColor = brown
        Player4.addChild(playerLabel4)
        playerLabel4.position = CGPoint(x: 0, y: 75)
        playerLabel4.zPosition = 20
        
        playerLabelBack1 = SKLabelNode(text: "PLAYER I")
        playerLabelBack1.fontName = "Helvetica-bold"
        playerLabelBack1.fontSize = 16
        playerLabelBack1.fontColor = brown
        Player1.addChild(playerLabelBack1)
        playerLabelBack1.position = CGPoint(x: 0, y: 75)
        playerLabelBack1.zPosition = 20
        
        playerLabelBack2 = SKLabelNode(text: "PLAYER II")
        playerLabelBack2.fontName = "Helvetica-bold"
        playerLabelBack2.fontSize = 16
        playerLabelBack2.fontColor = brown
        Player2.addChild(playerLabelBack2)
        playerLabelBack2.position = CGPoint(x: 0, y: 75)
        playerLabelBack2.zPosition = 20
        
        playerLabelBack3 = SKLabelNode(text: "PLAYER III")
        playerLabelBack3.fontName = "Helvetica-bold"
        playerLabelBack3.fontSize = 16
        playerLabelBack3.fontColor = brown
        Player3.addChild(playerLabelBack3)
        playerLabelBack3.position = CGPoint(x: 0, y: 75)
        playerLabelBack3.zPosition = 20
        
        playerLabelBack4 = SKLabelNode(text: "PLAYER IV")
        playerLabelBack4.fontName = "Helvetica-bold"
        playerLabelBack4.fontSize = 16
        playerLabelBack4.fontColor = brown
        Player4.addChild(playerLabelBack4)
        playerLabelBack4.position = CGPoint(x: 0, y: 75)
        playerLabelBack4.zPosition = 20
        
        //MARK: NAMES
        name1 = SKLabelNode(text: "Name")
        name1.fontName = "Helvetica"
        name1.fontSize = 8
        name1.fontColor = yellow
        name1.horizontalAlignmentMode = .left
        infoContainer1.addChild(name1)
        name1.position = CGPoint(x: -42, y: -25)
        name1.zPosition = 22
        
        name2 = SKLabelNode(text: "Name")
        name2.fontName = "Helvetica"
        name2.fontSize = 8
        name2.fontColor = yellow
        name2.horizontalAlignmentMode = .left
        infoContainer2.addChild(name2)
        name2.position = CGPoint(x: -42, y: -25)
        name2.zPosition = 22
        
        name3 = SKLabelNode(text: "Name")
        name3.fontName = "Helvetica"
        name3.fontSize = 8
        name3.fontColor = yellow
        name3.horizontalAlignmentMode = .left
        infoContainer3.addChild(name3)
        name3.position = CGPoint(x: -42, y: -25)
        name3.zPosition = 22
        
        name4 = SKLabelNode(text: "Name")
        name4.fontName = "Helvetica"
        name4.fontSize = 8
        name4.fontColor = yellow
        name4.horizontalAlignmentMode = .left
        infoContainer4.addChild(name4)
        name4.position = CGPoint(x: -42, y: -25)
        name4.zPosition = 22
        
        nameContainer1 = SKLabelNode(text: "Name".maxLength(length: 13))
        nameContainer1.fontName = "Helvetica-bold"
        nameContainer1.fontSize = 11
        nameContainer1.horizontalAlignmentMode = .left
        nameContainer1.fontColor = yellow
        infoContainer1.addChild(nameContainer1)
        nameContainer1.position = CGPoint(x: -42, y: -35)
        nameContainer1.zPosition = 22
        
        nameContainer2 = SKLabelNode(text: "Name".maxLength(length: 13))
        nameContainer2.fontName = "Helvetica-bold"
        nameContainer2.fontSize = 11
        nameContainer2.horizontalAlignmentMode = .left
        nameContainer2.fontColor = yellow
        infoContainer2.addChild(nameContainer2)
        nameContainer2.position = CGPoint(x: -42, y: -35)
        nameContainer2.zPosition = 22
        
        nameContainer3 = SKLabelNode(text: "Name".maxLength(length: 13))
        nameContainer3.fontName = "Helvetica-bold"
        nameContainer3.fontSize = 11
        nameContainer3.horizontalAlignmentMode = .left
        nameContainer3.fontColor = yellow
        infoContainer3.addChild(nameContainer3)
        nameContainer3.position = CGPoint(x: -42, y: -35)
        nameContainer3.zPosition = 22
        
        nameContainer4 = SKLabelNode(text: "Name".maxLength(length: 13))
        nameContainer4.fontName = "Helvetica-bold"
        nameContainer4.fontSize = 11
        nameContainer4.horizontalAlignmentMode = .left
        nameContainer4.fontColor = yellow
        infoContainer4.addChild(nameContainer4)
        nameContainer4.position = CGPoint(x: -42, y: -35)
        nameContainer4.zPosition = 22
        
        //MARK: RACE
        race1 = SKLabelNode(text: "Race")
        race1.fontName = "Helvetica"
        race1.fontSize = 8
        race1.fontColor = yellow
        race1.horizontalAlignmentMode = .left
        infoContainer1.addChild(race1)
        race1.position = CGPoint(x: -42, y: -50)
        race1.zPosition = 30
        
        race2 = SKLabelNode(text: "Race")
        race2.fontName = "Helvetica"
        race2.fontSize = 8
        race2.fontColor = yellow
        race2.horizontalAlignmentMode = .left
        infoContainer2.addChild(race2)
        race2.position = CGPoint(x: -42, y: -50)
        race2.zPosition = 30
        
        race3 = SKLabelNode(text: "Race")
        race3.fontName = "Helvetica"
        race3.fontSize = 8
        race3.fontColor = yellow
        race3.horizontalAlignmentMode = .left
        infoContainer3.addChild(race3)
        race3.position = CGPoint(x: -42, y: -50)
        race3.zPosition = 30
        
        race4 = SKLabelNode(text: "Race")
        race4.fontName = "Helvetica"
        race4.fontSize = 8
        race4.fontColor = yellow
        race4.horizontalAlignmentMode = .left
        infoContainer4.addChild(race4)
        race4.position = CGPoint(x: -42, y: -50)
        race4.zPosition = 30
        
        raceContainer1 = SKLabelNode(text: "Race".maxLength(length: 13))
        raceContainer1.fontName = "Helvetica-bold"
        raceContainer1.fontSize = 11
        raceContainer1.horizontalAlignmentMode = .left
        raceContainer1.fontColor = yellow
        infoContainer1.addChild(raceContainer1)
        raceContainer1.position = CGPoint(x: -42, y: -60)
        raceContainer1.zPosition = 30
        
        raceContainer2 = SKLabelNode(text: "Race".maxLength(length: 13))
        raceContainer2.fontName = "Helvetica-bold"
        raceContainer2.fontSize = 11
        raceContainer2.horizontalAlignmentMode = .left
        raceContainer2.fontColor = yellow
        infoContainer2.addChild(raceContainer2)
        raceContainer2.position = CGPoint(x: -42, y: -60)
        raceContainer2.zPosition = 30
        
        raceContainer3 = SKLabelNode(text: "Race".maxLength(length: 13))
        raceContainer3.fontName = "Helvetica-bold"
        raceContainer3.fontSize = 11
        raceContainer3.horizontalAlignmentMode = .left
        raceContainer3.fontColor = yellow
        infoContainer3.addChild(raceContainer3)
        raceContainer3.position = CGPoint(x: -42, y: -60)
        raceContainer3.zPosition = 30
        
        raceContainer4 = SKLabelNode(text: "Race".maxLength(length: 13))
        raceContainer4.fontName = "Helvetica-bold"
        raceContainer4.fontSize = 11
        raceContainer4.horizontalAlignmentMode = .left
        raceContainer4.fontColor = yellow
        infoContainer4.addChild(raceContainer4)
        raceContainer4.position = CGPoint(x: -42, y: -60)
        raceContainer4.zPosition = 30
        
        //MARK: CLASS
        class1 = SKLabelNode(text: "Class")
        class1.fontName = "Helvetica"
        class1.fontSize = 8
        class1.fontColor = yellow
        class1.horizontalAlignmentMode = .left
        infoContainer1.addChild(class1)
        class1.position = CGPoint(x: -42, y: -75)
        class1.zPosition = 30
        
        class2 = SKLabelNode(text: "Class")
        class2.fontName = "Helvetica"
        class2.fontSize = 8
        class2.fontColor = yellow
        class2.horizontalAlignmentMode = .left
        infoContainer2.addChild(class2)
        class2.position = CGPoint(x: -42, y: -75)
        class2.zPosition = 30
        
        class3 = SKLabelNode(text: "Class")
        class3.fontName = "Helvetica"
        class3.fontSize = 8
        class3.fontColor = yellow
        class3.horizontalAlignmentMode = .left
        infoContainer3.addChild(class3)
        class3.position = CGPoint(x: -42, y: -75)
        class3.zPosition = 30
        
        class4 = SKLabelNode(text: "Class")
        class4.fontName = "Helvetica"
        class4.fontSize = 8
        class4.fontColor = yellow
        class4.horizontalAlignmentMode = .left
        infoContainer4.addChild(class4)
        class4.position = CGPoint(x: -42, y: -75)
        class4.zPosition = 30
        
        classContainer1 = SKLabelNode(text: "Class".maxLength(length: 13))
        classContainer1.fontName = "Helvetica-bold"
        classContainer1.fontSize = 11
        classContainer1.horizontalAlignmentMode = .left
        classContainer1.fontColor = yellow
        infoContainer1.addChild(classContainer1)
        classContainer1.position = CGPoint(x: -42, y: -85)
        classContainer1.zPosition = 30
        
        classContainer2 = SKLabelNode(text: "Class".maxLength(length: 13))
        classContainer2.fontName = "Helvetica-bold"
        classContainer2.fontSize = 11
        classContainer2.horizontalAlignmentMode = .left
        classContainer2.fontColor = yellow
        infoContainer2.addChild(classContainer2)
        classContainer2.position = CGPoint(x: -42, y: -85)
        classContainer2.zPosition = 30
        
        classContainer3 = SKLabelNode(text: "Class".maxLength(length: 13))
        classContainer3.fontName = "Helvetica-bold"
        classContainer3.fontSize = 11
        classContainer3.horizontalAlignmentMode = .left
        classContainer3.fontColor = yellow
        infoContainer3.addChild(classContainer3)
        classContainer3.position = CGPoint(x: -42, y: -85)
        classContainer3.zPosition = 30
        
        classContainer4 = SKLabelNode(text: "Class".maxLength(length: 13))
        classContainer4.fontName = "Helvetica-bold"
        classContainer4.fontSize = 11
        classContainer4.horizontalAlignmentMode = .left
        classContainer4.fontColor = yellow
        infoContainer4.addChild(classContainer4)
        classContainer4.position = CGPoint(x: -42, y: -85)
        classContainer4.zPosition = 30
        
        //MARK: HEALTH POINTS
        health1 = SKLabelNode(text: "Health Points")
        health1.fontName = "Helvetica"
        health1.fontSize = 8
        health1.fontColor = yellow
        health1.horizontalAlignmentMode = .center
        infoContainerBack1.addChild(health1)
        health1.position = CGPoint(x: 0, y: 45)
        health1.zPosition = 30
        
        health2 = SKLabelNode(text: "Health Points")
        health2.fontName = "Helvetica"
        health2.fontSize = 8
        health2.fontColor = yellow
        health2.horizontalAlignmentMode = .center
        infoContainerBack2.addChild(health2)
        health2.position = CGPoint(x: 0, y: 45)
        health2.zPosition = 30
        
        health3 = SKLabelNode(text: "Health Points")
        health3.fontName = "Helvetica"
        health3.fontSize = 8
        health3.fontColor = yellow
        health3.horizontalAlignmentMode = .center
        infoContainerBack3.addChild(health3)
        health3.position = CGPoint(x: 0, y: 45)
        health3.zPosition = 30
        
        health4 = SKLabelNode(text: "Health Points")
        health4.fontName = "Helvetica"
        health4.fontSize = 8
        health4.fontColor = yellow
        health4.horizontalAlignmentMode = .center
        infoContainerBack4.addChild(health4)
        health4.position = CGPoint(x: 0, y: 45)
        health4.zPosition = 30
        
        healthContainer1 = SKLabelNode(text: "100")
        healthContainer1.fontName = "Helvetica-bold"
        healthContainer1.fontSize = 11
        healthContainer1.fontColor = yellow
        healthContainer1.horizontalAlignmentMode = .center
        infoContainerBack1.addChild(healthContainer1)
        healthContainer1.position = CGPoint(x: 0, y: 32)
        healthContainer1.zPosition = 30
        
        healthContainer2 = SKLabelNode(text: "100")
        healthContainer2.fontName = "Helvetica-bold"
        healthContainer2.fontSize = 11
        healthContainer2.fontColor = yellow
        healthContainer2.horizontalAlignmentMode = .center
        infoContainerBack2.addChild(healthContainer2)
        healthContainer2.position = CGPoint(x: 0, y: 32)
        healthContainer2.zPosition = 30
        
        healthContainer3 = SKLabelNode(text: "100")
        healthContainer3.fontName = "Helvetica-bold"
        healthContainer3.fontSize = 11
        healthContainer3.fontColor = yellow
        healthContainer3.horizontalAlignmentMode = .center
        infoContainerBack3.addChild(healthContainer3)
        healthContainer3.position = CGPoint(x: 0, y: 32)
        healthContainer3.zPosition = 30
        
        healthContainer4 = SKLabelNode(text: "100")
        healthContainer4.fontName = "Helvetica-bold"
        healthContainer4.fontSize = 11
        healthContainer4.fontColor = yellow
        healthContainer4.horizontalAlignmentMode = .center
        infoContainerBack4.addChild(healthContainer4)
        healthContainer4.position = CGPoint(x: 0, y: 32)
        healthContainer4.zPosition = 30
        
        // MARK: ARMOR CLASS
        ac1 = SKLabelNode(text: "Armor Class")
        ac1.fontName = "Helvetica"
        ac1.fontSize = 8
        ac1.fontColor = yellow
        ac1.horizontalAlignmentMode = .center
        infoContainerBack1.addChild(ac1)
        ac1.position = CGPoint(x: 0, y: 20)
        ac1.zPosition = 30
        
        ac2 = SKLabelNode(text: "Armor Class")
        ac2.fontName = "Helvetica"
        ac2.fontSize = 8
        ac2.fontColor = yellow
        ac2.horizontalAlignmentMode = .center
        infoContainerBack2.addChild(ac2)
        ac2.position = CGPoint(x: 0, y: 20)
        ac2.zPosition = 30
        
        ac3 = SKLabelNode(text: "Armor Class")
        ac3.fontName = "Helvetica"
        ac3.fontSize = 8
        ac3.fontColor = yellow
        ac3.horizontalAlignmentMode = .center
        infoContainerBack3.addChild(ac3)
        ac3.position = CGPoint(x: 0, y: 20)
        ac3.zPosition = 30
        
        ac4 = SKLabelNode(text: "Armor Class")
        ac4.fontName = "Helvetica"
        ac4.fontSize = 8
        ac4.fontColor = yellow
        ac4.horizontalAlignmentMode = .center
        infoContainerBack4.addChild(ac4)
        ac4.position = CGPoint(x: 0, y: 20)
        ac4.zPosition = 30
        
        acContainer1 = SKLabelNode(text: "0")
        acContainer1.fontName = "Helvetica-bold"
        acContainer1.fontSize = 11
        acContainer1.fontColor = yellow
        acContainer1.horizontalAlignmentMode = .center
        infoContainerBack1.addChild(acContainer1)
        acContainer1.position = CGPoint(x: 0, y: 9)
        acContainer1.zPosition = 30
        
        acContainer2 = SKLabelNode(text: "0")
        acContainer2.fontName = "Helvetica-bold"
        acContainer2.fontSize = 11
        acContainer2.fontColor = yellow
        acContainer2.horizontalAlignmentMode = .center
        infoContainerBack2.addChild(acContainer2)
        acContainer2.position = CGPoint(x: 0, y: 9)
        acContainer2.zPosition = 30
        
        acContainer3 = SKLabelNode(text: "0")
        acContainer3.fontName = "Helvetica-bold"
        acContainer3.fontSize = 11
        acContainer3.fontColor = yellow
        acContainer3.horizontalAlignmentMode = .center
        infoContainerBack3.addChild(acContainer3)
        acContainer3.position = CGPoint(x: 0, y: 9)
        acContainer3.zPosition = 30
        
        acContainer4 = SKLabelNode(text: "0")
        acContainer4.fontName = "Helvetica-bold"
        acContainer4.fontSize = 11
        acContainer4.fontColor = yellow
        acContainer4.horizontalAlignmentMode = .center
        infoContainerBack4.addChild(acContainer4)
        acContainer4.position = CGPoint(x: 0, y: 9)
        acContainer4.zPosition = 30
        
        //MARK: SPEED
        
        sp1 = SKLabelNode(text: "Speed")
        sp1.fontName = "Helvetica"
        sp1.fontSize = 8
        sp1.fontColor = yellow
        sp1.horizontalAlignmentMode = .center
        infoContainerBack1.addChild(sp1)
        sp1.position = CGPoint(x: 0, y: -3)
        sp1.zPosition = 30
        
        sp2 = SKLabelNode(text: "Speed")
        sp2.fontName = "Helvetica"
        sp2.fontSize = 8
        sp2.fontColor = yellow
        sp2.horizontalAlignmentMode = .center
        infoContainerBack2.addChild(sp2)
        sp2.position = CGPoint(x: 0, y: -3)
        sp2.zPosition = 30
        
        sp3 = SKLabelNode(text: "Speed")
        sp3.fontName = "Helvetica"
        sp3.fontSize = 8
        sp3.fontColor = yellow
        sp3.horizontalAlignmentMode = .center
        infoContainerBack3.addChild(sp3)
        sp3.position = CGPoint(x: 0, y: -3)
        sp3.zPosition = 30
        
        sp4 = SKLabelNode(text: "Speed")
        sp4.fontName = "Helvetica"
        sp4.fontSize = 8
        sp4.fontColor = yellow
        sp4.horizontalAlignmentMode = .center
        infoContainerBack4.addChild(sp4)
        sp4.position = CGPoint(x: 0, y: -3)
        sp4.zPosition = 30
        
        spContainer1 = SKLabelNode(text: "0")
        spContainer1.fontName = "Helvetica-bold"
        spContainer1.fontSize = 11
        spContainer1.fontColor = yellow
        spContainer1.horizontalAlignmentMode = .center
        infoContainerBack1.addChild(spContainer1)
        spContainer1.position = CGPoint(x: 0, y: -14)
        spContainer1.zPosition = 30
        
        spContainer2 = SKLabelNode(text: "0")
        spContainer2.fontName = "Helvetica-bold"
        spContainer2.fontSize = 11
        spContainer2.fontColor = yellow
        spContainer2.horizontalAlignmentMode = .center
        infoContainerBack2.addChild(spContainer2)
        spContainer2.position = CGPoint(x: 0, y: -14)
        spContainer2.zPosition = 30
        
        spContainer3 = SKLabelNode(text: "0")
        spContainer3.fontName = "Helvetica-bold"
        spContainer3.fontSize = 11
        spContainer3.fontColor = yellow
        spContainer3.horizontalAlignmentMode = .center
        infoContainerBack3.addChild(spContainer3)
        spContainer3.position = CGPoint(x: 0, y: -14)
        spContainer3.zPosition = 30
        
        spContainer4 = SKLabelNode(text: "0")
        spContainer4.fontName = "Helvetica-bold"
        spContainer4.fontSize = 11
        spContainer4.fontColor = yellow
        spContainer4.horizontalAlignmentMode = .center
        infoContainerBack4.addChild(spContainer4)
        spContainer4.position = CGPoint(x: 0, y: -14)
        spContainer4.zPosition = 30
        
        //MARK: INITIATIVE
        in1 = SKLabelNode(text: "Initiative")
        in1.fontName = "Helvetica"
        in1.fontSize = 8
        in1.fontColor = yellow
        in1.horizontalAlignmentMode = .center
        infoContainerBack1.addChild(in1)
        in1.position = CGPoint(x: 0, y: -26)
        in1.zPosition = 30
        
        in2 = SKLabelNode(text: "Initiative")
        in2.fontName = "Helvetica"
        in2.fontSize = 8
        in2.fontColor = yellow
        in2.horizontalAlignmentMode = .center
        infoContainerBack2.addChild(in2)
        in2.position = CGPoint(x: 0, y: -26)
        in2.zPosition = 30
        
        in3 = SKLabelNode(text: "Initiative")
        in3.fontName = "Helvetica"
        in3.fontSize = 8
        in3.fontColor = yellow
        in3.horizontalAlignmentMode = .center
        infoContainerBack3.addChild(in3)
        in3.position = CGPoint(x: 0, y: -26)
        in3.zPosition = 30
        
        in4 = SKLabelNode(text: "Initiative")
        in4.fontName = "Helvetica"
        in4.fontSize = 8
        in4.fontColor = yellow
        in4.horizontalAlignmentMode = .center
        infoContainerBack4.addChild(in4)
        in4.position = CGPoint(x: 0, y: -26)
        in4.zPosition = 30
        
        inContainer1 = SKLabelNode(text: "0")
        inContainer1.fontName = "Helvetica-bold"
        inContainer1.fontSize = 11
        inContainer1.fontColor = yellow
        inContainer1.horizontalAlignmentMode = .center
        infoContainerBack1.addChild(inContainer1)
        inContainer1.position = CGPoint(x: 0, y: -37)
        inContainer1.zPosition = 30
        
        inContainer2 = SKLabelNode(text: "0")
        inContainer2.fontName = "Helvetica-bold"
        inContainer2.fontSize = 11
        inContainer2.fontColor = yellow
        inContainer2.horizontalAlignmentMode = .center
        infoContainerBack2.addChild(inContainer2)
        inContainer2.position = CGPoint(x: 0, y: -37)
        inContainer2.zPosition = 30
        
        inContainer3 = SKLabelNode(text: "0")
        inContainer3.fontName = "Helvetica-bold"
        inContainer3.fontSize = 11
        inContainer3.fontColor = yellow
        inContainer3.horizontalAlignmentMode = .center
        infoContainerBack3.addChild(inContainer3)
        inContainer3.position = CGPoint(x: 0, y: -37)
        inContainer3.zPosition = 30
        
        inContainer4 = SKLabelNode(text: "0")
        inContainer4.fontName = "Helvetica-bold"
        inContainer4.fontSize = 11
        inContainer4.fontColor = yellow
        inContainer4.horizontalAlignmentMode = .center
        infoContainerBack4.addChild(inContainer4)
        inContainer4.position = CGPoint(x: 0, y: -37)
        inContainer4.zPosition = 30
        
        //MARK: PASSIVE PERCEPTION
        pp1 = SKLabelNode(text: "Passive Perception")
        pp1.fontName = "Helvetica"
        pp1.fontSize = 8
        pp1.fontColor = yellow
        pp1.horizontalAlignmentMode = .center
        infoContainerBack1.addChild(pp1)
        pp1.position = CGPoint(x: 0, y: -49)
        pp1.zPosition = 30
        
        pp2 = SKLabelNode(text: "Passive Perception")
        pp2.fontName = "Helvetica"
        pp2.fontSize = 8
        pp2.fontColor = yellow
        pp2.horizontalAlignmentMode = .center
        infoContainerBack2.addChild(pp2)
        pp2.position = CGPoint(x: 0, y: -49)
        pp2.zPosition = 30
        
        pp3 = SKLabelNode(text: "Passive Perception")
        pp3.fontName = "Helvetica"
        pp3.fontSize = 8
        pp3.fontColor = yellow
        pp3.horizontalAlignmentMode = .center
        infoContainerBack3.addChild(pp3)
        pp3.position = CGPoint(x: 0, y: -49)
        pp3.zPosition = 30
        
        pp4 = SKLabelNode(text: "Passive Perception")
        pp4.fontName = "Helvetica"
        pp4.fontSize = 8
        pp4.fontColor = yellow
        pp4.horizontalAlignmentMode = .center
        infoContainerBack4.addChild(pp4)
        pp4.position = CGPoint(x: 0, y: -49)
        pp4.zPosition = 30
        
        ppContainer1 = SKLabelNode(text: "0")
        ppContainer1.fontName = "Helvetica-bold"
        ppContainer1.fontSize = 11
        ppContainer1.fontColor = yellow
        ppContainer1.horizontalAlignmentMode = .center
        infoContainerBack1.addChild(ppContainer1)
        ppContainer1.position = CGPoint(x: 0, y: -60)
        ppContainer1.zPosition = 30
        
        ppContainer2 = SKLabelNode(text: "0")
        ppContainer2.fontName = "Helvetica-bold"
        ppContainer2.fontSize = 11
        ppContainer2.fontColor = yellow
        ppContainer2.horizontalAlignmentMode = .center
        infoContainerBack2.addChild(ppContainer2)
        ppContainer2.position = CGPoint(x: 0, y: -60)
        ppContainer2.zPosition = 30
        
        ppContainer3 = SKLabelNode(text: "0")
        ppContainer3.fontName = "Helvetica-bold"
        ppContainer3.fontSize = 11
        ppContainer3.fontColor = yellow
        ppContainer3.horizontalAlignmentMode = .center
        infoContainerBack3.addChild(ppContainer3)
        ppContainer3.position = CGPoint(x: 0, y: -60)
        ppContainer3.zPosition = 30
        
        ppContainer4 = SKLabelNode(text: "0")
        ppContainer4.fontName = "Helvetica-bold"
        ppContainer4.fontSize = 11
        ppContainer4.fontColor = yellow
        ppContainer4.horizontalAlignmentMode = .center
        infoContainerBack4.addChild(ppContainer4)
        ppContainer4.position = CGPoint(x: 0, y: -60)
        ppContainer4.zPosition = 30
        
        //MARK: CLASS RESOURCE
        cr1 = SKLabelNode(text: "Class Resource")
        cr1.fontName = "Helvetica"
        cr1.fontSize = 8
        cr1.fontColor = yellow
        cr1.horizontalAlignmentMode = .center
        infoContainerBack1.addChild(cr1)
        cr1.position = CGPoint(x: 0, y: -72)
        cr1.zPosition = 30
        
        cr2 = SKLabelNode(text: "Class Resource")
        cr2.fontName = "Helvetica"
        cr2.fontSize = 8
        cr2.fontColor = yellow
        cr2.horizontalAlignmentMode = .center
        infoContainerBack2.addChild(cr2)
        cr2.position = CGPoint(x: 0, y: -72)
        cr2.zPosition = 30
        
        cr3 = SKLabelNode(text: "Class Resource")
        cr3.fontName = "Helvetica"
        cr3.fontSize = 8
        cr3.fontColor = yellow
        cr3.horizontalAlignmentMode = .center
        infoContainerBack3.addChild(cr3)
        cr3.position = CGPoint(x: 0, y: -72)
        cr3.zPosition = 30
        
        cr4 = SKLabelNode(text: "Class Resource")
        cr4.fontName = "Helvetica"
        cr4.fontSize = 8
        cr4.fontColor = yellow
        cr4.horizontalAlignmentMode = .center
        infoContainerBack4.addChild(cr4)
        cr4.position = CGPoint(x: 0, y: -72)
        cr4.zPosition = 30
        
        crContainer1 = SKLabelNode(text: "0")
        crContainer1.fontName = "Helvetica-bold"
        crContainer1.fontSize = 11
        crContainer1.fontColor = yellow
        crContainer1.horizontalAlignmentMode = .center
        infoContainerBack1.addChild(crContainer1)
        crContainer1.position = CGPoint(x: 0, y: -83)
        crContainer1.zPosition = 30
        
        crContainer2 = SKLabelNode(text: "0")
        crContainer2.fontName = "Helvetica-bold"
        crContainer2.fontSize = 11
        crContainer2.fontColor = yellow
        crContainer2.horizontalAlignmentMode = .center
        infoContainerBack2.addChild(crContainer2)
        crContainer2.position = CGPoint(x: 0, y: -83)
        crContainer2.zPosition = 30
        
        crContainer3 = SKLabelNode(text: "0")
        crContainer3.fontName = "Helvetica-bold"
        crContainer3.fontSize = 11
        crContainer3.fontColor = yellow
        crContainer3.horizontalAlignmentMode = .center
        infoContainerBack3.addChild(crContainer3)
        crContainer3.position = CGPoint(x: 0, y: -83)
        crContainer3.zPosition = 30
        
        crContainer4 = SKLabelNode(text: "0")
        crContainer4.fontName = "Helvetica-bold"
        crContainer4.fontSize = 11
        crContainer4.fontColor = yellow
        crContainer4.horizontalAlignmentMode = .center
        infoContainerBack4.addChild(crContainer4)
        crContainer4.position = CGPoint(x: 0, y: -83)
        crContainer4.zPosition = 30
        
        move = SKAction.move(by: CGVector(dx: -350, dy: 0), duration: 0.2)
        yMove = SKAction.move(by: CGVector(dx: 0, dy: 430), duration: 0.3)
        
       
        
        panel = SKSpriteNode(color: UIColor.black, size: self.size)
        panel.position = CGPoint(x: 0, y: 0)
        panel.alpha = 0.75
        panel.zPosition = 8
        
        self.nearbyService.nearbyServiceDelgate = self
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.leftSwipe))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.rightSwipe))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.upSwipe))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.downSwipe))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(GameScene.tapFlip))
        tapGest.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapGest)
        
//        MARK: E CRIATUR
       
        addChild(panel)
        panel.isHidden = true
        
        addChild(background)
        addChild(grid)
        addChild(scroll)
        addChild(scroll2)
        scroll.addChild(turnLabel)
        scroll.addChild(turnContainer)
        scroll2.addChild(diceLabel)
        scroll2.addChild(diceContainer)
        scroll2.addChild(palla1)
        palla1.addChild(diceIcon)
        scroll.addChild(palla2)
        palla2.addChild(turnIcon)
        turnLabel.isHidden = true
        
       
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    @objc func leftSwipe(){
        if !rightPanelShowed && !leftPanelShowed && !charactPanelShowed{
            scroll.run(move)
            panel.zPosition = 30
            panel.isHidden = false
            scroll.zPosition = 40
            rightPanelShowed = true
            turnLabel.isHidden = false
            turnContainer.isHidden = false
            turnContainer.zPosition = 41
            turnAv1.zPosition = 42
            turnAv2.zPosition = 42
            turnAv3.zPosition = 42
            turnAv4.zPosition = 42
            turnName1.zPosition = 42
            turnName2.zPosition = 42
            turnName3.zPosition = 42
            turnName4.zPosition = 42
            palla2.zPosition = 41
            turnIcon.zPosition = 42
        }
        
        if leftPanelShowed {
                scene?.enumerateChildNodes(withName: "coin") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
                scene?.enumerateChildNodes(withName: "d4") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
                scene?.enumerateChildNodes(withName: "d6") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
                scene?.enumerateChildNodes(withName: "d8") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
                scene?.enumerateChildNodes(withName: "d10") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
                scene?.enumerateChildNodes(withName: "d12") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
                scene?.enumerateChildNodes(withName: "d20") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
            
            scroll2.run(SKAction.sequence([move,move,move]))
            leftPanelShowed = false
            panel.isHidden = true
            panel.zPosition = 5
            scroll2.zPosition = 10
            palla1.zPosition = 1
            diceIcon.zPosition = 2
            
            
        }

    }
    @objc func rightSwipe(){
        if !leftPanelShowed && !rightPanelShowed && !charactPanelShowed{
            scroll2.run(SKAction.sequence([move.reversed(),move.reversed(),move.reversed()]))
            panel.zPosition = 30
            panel.isHidden = false
            scroll2.zPosition = 40
            palla1.zPosition = 1
            diceIcon.zPosition = 2
            leftPanelShowed = true
            
        }
        if rightPanelShowed {
            scroll.run(SKAction.sequence([move.reversed(),SKAction.run(hidetext)]))
            rightPanelShowed = false
            panel.isHidden = true
            panel.zPosition = 5
            scroll.zPosition = 10
            turnContainer.zPosition = 1
            turnAv1.zPosition = 2
            turnAv2.zPosition = 2
            turnAv3.zPosition = 2
            turnAv4.zPosition = 2
            turnName1.zPosition = 2
            turnName2.zPosition = 2
            turnName3.zPosition = 2
            turnName4.zPosition = 2
            palla2.zPosition = 1
            turnIcon.zPosition = 2


        }
    }
    @objc func upSwipe(){
        if !leftPanelShowed && !rightPanelShowed && !charactPanelShowed{
            Player1.run(yMove)
            Player2.run(yMove)
            Player3.run(yMove)
            Player4.run(yMove)
            panel.zPosition = 30
            panel.isHidden = false
            Player1.zPosition = 40
            Player2.zPosition = 40
            Player3.zPosition = 40
            Player4.zPosition = 40
            charactPanelShowed = true
            playerLabel1.zPosition = -1
            playerLabel2.zPosition = -1
            playerLabel3.zPosition = -1
            playerLabel4.zPosition = -1
            
            }
    }
    @objc func downSwipe(){
        if charactPanelShowed {
            Player1.run(yMove.reversed())
            Player2.run(yMove.reversed())
            Player3.run(yMove.reversed())
            Player4.run(yMove.reversed())
            charactPanelShowed = false
            panel.isHidden = true
            panel.zPosition = 5
            Player1.zPosition = 10
            Player2.zPosition = 10
            Player3.zPosition = 10
            Player4.zPosition = 10
            }
    }
    
    @objc func tapFlip(){
        let flip1 = SKAction.scaleX(to: 0.0, duration: 0.1)
        let flip2 = SKAction.scaleX(to: Player1.xScale, duration: 0.1)
        let flip3 = SKAction.scaleX(to: Player2.xScale, duration: 0.1)
        let flip4 = SKAction.scaleX(to: Player3.xScale, duration: 0.1)
        let flip5 = SKAction.scaleX(to: Player4.xScale, duration: 0.1)
        let seq = SKAction.sequence([flip1,SKAction.run(faceUpHide1),SKAction.run(faceBackShow1),flip2])
        let seq2 = SKAction.sequence([flip1,SKAction.run(faceBackHide1),SKAction.run(faceUpShow1),flip2])
        let seq4 = SKAction.sequence([flip1,SKAction.run(faceBackHide2),SKAction.run(faceUpShow2),flip3])
        let seq3 = SKAction.sequence([flip1,SKAction.run(faceUpHide2),SKAction.run(faceBackShow2),flip3])
        let seq5 = SKAction.sequence([flip1,SKAction.run(faceUpHide3),SKAction.run(faceBackShow3),flip4])
        let seq6 = SKAction.sequence([flip1,SKAction.run(faceBackHide3),SKAction.run(faceUpShow3),flip4])
        let seq7 = SKAction.sequence([flip1,SKAction.run(faceUpHide4),SKAction.run(faceBackShow4),flip5])
        let seq8 = SKAction.sequence([flip1,SKAction.run(faceBackHide4),SKAction.run(faceUpShow4),flip5])
        if charactPanelShowed {
            if faceUp {
           
           
//            Player1.run(SKAction.scaleX(to: Player1.xScale, duration: 0.4))
            Player1.run(seq)
                Player1.run(SKAction.playSoundFileNamed("cardflip", waitForCompletion: false))
                Player2.run(seq3)
                Player3.run(seq5)
                Player4.run(seq7)
                faceUp = false
            }else{
                Player1.run(seq2)
                Player1.run(SKAction.playSoundFileNamed("cardflip", waitForCompletion: false))
                Player2.run(seq4)
                Player3.run(seq6)
                Player4.run(seq8)
                faceUp = true
            }
        }
    }
    func faceUpHide1(){
        infoContainer1.isHidden = true
        avatar1.isHidden = true
    }
    func faceBackShow1(){
        infoContainerBack1.isHidden = false
    }
    func faceBackHide1(){
        infoContainerBack1.isHidden = true
    }
    func faceUpShow1(){
        infoContainer1.isHidden = false
        avatar1.isHidden = false
    }
    func faceUpHide2(){
        infoContainer2.isHidden = true
        avatar2.isHidden = true
    }
    func faceBackShow2(){
        infoContainerBack2.isHidden = false
    }
    func faceBackHide2(){
        infoContainerBack2.isHidden = true
    }
    func faceUpShow2(){
        infoContainer2.isHidden = false
        avatar2.isHidden = false
    }
    func faceUpHide3(){
        infoContainer3.isHidden = true
        avatar3.isHidden = true
    }
    func faceBackShow3(){
        infoContainerBack3.isHidden = false
    }
    func faceBackHide3(){
        infoContainerBack3.isHidden = true
    }
    func faceUpShow3(){
        infoContainer3.isHidden = false
        avatar3.isHidden = false
    }
    func faceUpHide4(){
        infoContainer4.isHidden = true
        avatar4.isHidden = true
    }
    func faceBackShow4(){
        infoContainerBack4.isHidden = false
    }
    func faceBackHide4(){
        infoContainerBack4.isHidden = true
    }
    func faceUpShow4(){
        infoContainer4.isHidden = false
        avatar4.isHidden = false
    }
    func hidetext(){
        turnLabel.isHidden = true
    }
   
    func spawnD2(rolledNum: [Int]){
        let num = rolledNum.count
        
        let scaleX = SKAction.scaleX(to: 0.4, duration: 0.8)
        let scaleY = SKAction.scaleY(to: 0.4, duration: 0.8)
        let finalMove = SKAction.moveBy(x: 0, y: CGFloat(Float.random(in: 400 ... 800)), duration: 0.8)
        let group1 = SKAction.group([scaleX,scaleY,finalMove])
        let Scale0 = SKAction.scaleX(to: 0.0, duration: 0.2)
        let secondScale = SKAction.scaleX(to: 0.4, duration: 0.2)
        let group2 = SKAction.sequence([Scale0,SKAction.setTexture(SKTexture(imageNamed: "moneta2")),secondScale,Scale0,SKAction.setTexture(SKTexture(imageNamed: "moneta1")),secondScale])
    
        for i in 0..<num{
        var coin = SKSpriteNode(texture: SKTexture(imageNamed: "moneta1"))
            coin.position = CGPoint(x: CGFloat(Float.random(in: -800.0 ... 100.0)), y: CGFloat(Float.random(in: -700.0 ... -450.0)))
            coin.zPosition = 100
            coin.name = "coin"
            coin.xScale = 1
            coin.yScale = 1
            coin.run(SKAction.sequence([group1,SKAction.repeat(group2, count: 2),SKAction.run {
                if rolledNum[i] == 1{
                    coin.texture = SKTexture(imageNamed: "moneta1")
                }else {
                    coin.texture = SKTexture(imageNamed: "moneta2")
                }
            }]))
            addChild(coin)
        }
    }
    func spawnD4(rolledNum: [Int]){
        let num = rolledNum.count
        let d41 = SKTexture(imageNamed: "d4numero1")
        let d42 = SKTexture(imageNamed: "d4numero2")
        let d43 = SKTexture(imageNamed: "d4numero3")
        let d44 = SKTexture(imageNamed: "d4numero4")
        let scaleX = SKAction.scaleX(to: 0.4, duration: 0.8)
        let scaleY = SKAction.scaleY(to: 0.4, duration: 0.8)
        let finalMove = SKAction.moveBy(x: 0, y: CGFloat(Float.random(in: 400 ... 800)), duration: 0.8)
        let group1 = SKAction.group([scaleX,scaleY,finalMove])
        let anim = SKAction.animate(with: [d41,d42,d43,d44], timePerFrame: 0.3)
        let rotate = SKAction.rotate(byAngle: 2 * .pi, duration: 1.2)
        let group2 = SKAction.group([anim,rotate])
        for i in 0..<num{
        var d4 = SKSpriteNode(texture: SKTexture(imageNamed: "d4numero1"))
            d4.position = CGPoint(x: CGFloat(Float.random(in: -800.0 ... 100.0)), y: CGFloat(Float.random(in: -700.0 ... -450.0)))
            d4.zPosition = 100
            d4.name = "d4"
            d4.xScale = 1.0
            d4.yScale = 1.0
            d4.size = CGSize(width: 350, height: 300)
            d4.run(SKAction.sequence([group1,SKAction.repeat(group2, count: 1),SKAction.run {
                if rolledNum[i] == 1 {
                    d4.texture = SKTexture(imageNamed: "d4numero1")
                }else if rolledNum[i] == 2 {
                    d4.texture = SKTexture(imageNamed: "d4numero2")
                }else if rolledNum[i] == 3 {
                    d4.texture = SKTexture(imageNamed: "d4numero3")
                }else {
                    d4.texture = SKTexture(imageNamed: "d4numero4")
                }

            }]))
            addChild(d4)
        }
    }
    func spawnD6(rolledNum: [Int]){
        let num = rolledNum.count
        let d61 = SKTexture(imageNamed: "d6numero1")
        let d62 = SKTexture(imageNamed: "d6numero2")
        let d63 = SKTexture(imageNamed: "d6numero3")
        let d64 = SKTexture(imageNamed: "d6numero4")
        let d65 = SKTexture(imageNamed: "d6numero5")
        let d66 = SKTexture(imageNamed: "d6numero6")
        let scaleX = SKAction.scaleX(to: 0.4, duration: 0.8)
        let scaleY = SKAction.scaleY(to: 0.4, duration: 0.8)
        let finalMove = SKAction.moveBy(x: 0, y: CGFloat(Float.random(in: 400 ... 800)), duration: 0.8)
        let group1 = SKAction.group([scaleX,scaleY,finalMove])
        let anim = SKAction.animate(with: [d61,d62,d63,d64,d65,d66], timePerFrame: 0.2)
        let rotate = SKAction.rotate(byAngle: 2 * .pi, duration: 1.2)
        let group2 = SKAction.group([anim,rotate])
        for i in 0..<num{
        var d6 = SKSpriteNode(texture: SKTexture(imageNamed: "d6numero1"))
            d6.position = CGPoint(x: CGFloat(Float.random(in: -800.0 ... 100.0)), y: CGFloat(Float.random(in: -700.0 ... -450.0)))
            d6.zPosition = 100
            d6.name = "d6"
            d6.xScale = 1.0
            d6.yScale = 1.0
            d6.size = CGSize(width: 350, height: 300)
            d6.run(SKAction.sequence([group1,SKAction.repeat(group2, count: 1),SKAction.run {
                if rolledNum[i] == 1 {
                    d6.texture = SKTexture(imageNamed: "d6numero1")
                }else if rolledNum[i] == 2 {
                    d6.texture = SKTexture(imageNamed: "d6numero2")
                }else if rolledNum[i] == 3 {
                    d6.texture = SKTexture(imageNamed: "d6numero3")
                }else if rolledNum[i] == 4{
                    d6.texture = SKTexture(imageNamed: "d6numero4")
                }else if rolledNum[i] == 5{
                    d6.texture = SKTexture(imageNamed: "d6numero5")
                }  else {
                    d6.texture = SKTexture(imageNamed: "d6numero6")
                    }

            }]))
            addChild(d6)
        }
    }
    func spawnD8(rolledNum: [Int]){
        let num = rolledNum.count
        let d81 = SKTexture(imageNamed: "d8numero1")
        let d82 = SKTexture(imageNamed: "d8numero2")
        let d83 = SKTexture(imageNamed: "d8numero3")
        let d84 = SKTexture(imageNamed: "d8numero4")
        let d85 = SKTexture(imageNamed: "d8numero5")
        let d86 = SKTexture(imageNamed: "d8numero6")
        let d87 = SKTexture(imageNamed: "d8numero7")
        let d88 = SKTexture(imageNamed: "d8numero8")
        let scaleX = SKAction.scaleX(to: 0.4, duration: 0.8)
        let scaleY = SKAction.scaleY(to: 0.4, duration: 0.8)
        let finalMove = SKAction.moveBy(x: 0, y: CGFloat(Float.random(in: 400 ... 800)), duration: 0.8)
        let group1 = SKAction.group([scaleX,scaleY,finalMove])
        let anim = SKAction.animate(with: [d81,d82,d83,d84,d85,d86,d87,d88], timePerFrame: 0.2)
        let rotate = SKAction.rotate(byAngle: 2 * .pi, duration: 1.6)
        let group2 = SKAction.group([anim,rotate])
        for i in 0..<num{
        var d8 = SKSpriteNode(texture: SKTexture(imageNamed: "d8numero1"))
            d8.position = CGPoint(x: CGFloat(Float.random(in: -800.0 ... 100.0)), y: CGFloat(Float.random(in: -700.0 ... -450.0)))
            d8.zPosition = 100
            d8.name = "d8"
            d8.xScale = 1.0
            d8.yScale = 1.0
            d8.size = CGSize(width: 350, height: 350)
            d8.run(SKAction.sequence([group1,SKAction.repeat(group2, count: 1),SKAction.run {
                if rolledNum[i] == 1 {
                    d8.texture = SKTexture(imageNamed: "d8numero1")
                }else if rolledNum[i] == 2 {
                    d8.texture = SKTexture(imageNamed: "d8numero2")
                }else if rolledNum[i] == 3 {
                    d8.texture = SKTexture(imageNamed: "d8numero3")
                }else if rolledNum[i] == 4{
                    d8.texture = SKTexture(imageNamed: "d8numero4")
                }else if rolledNum[i] == 5{
                    d8.texture = SKTexture(imageNamed: "d8numero5")
                }else if rolledNum[i] == 6{
                    d8.texture = SKTexture(imageNamed: "d8numero6")
                }else if rolledNum[i] == 7{
                    d8.texture = SKTexture(imageNamed: "d8numero7")
                }else {
                    d8.texture = SKTexture(imageNamed: "d8numero8")
                }

            }]))
            addChild(d8)
        }
    }
    func spawnD10(rolledNum: [Int]){
        let num = rolledNum.count
        let d101 = SKTexture(imageNamed: "d10numero1")
        let d102 = SKTexture(imageNamed: "d10numero2")
        let d103 = SKTexture(imageNamed: "d10numero3")
        let d104 = SKTexture(imageNamed: "d10numero4")
        let d105 = SKTexture(imageNamed: "d10numero5")
        let d106 = SKTexture(imageNamed: "d10numero6")
        let d107 = SKTexture(imageNamed: "d10numero7")
        let d108 = SKTexture(imageNamed: "d10numero8")
        let d109 = SKTexture(imageNamed: "d10numero9")
        let d1010 = SKTexture(imageNamed: "d10numero10")
        let scaleX = SKAction.scaleX(to: 0.4, duration: 0.8)
        let scaleY = SKAction.scaleY(to: 0.4, duration: 0.8)
        let finalMove = SKAction.moveBy(x: 0, y: CGFloat(Float.random(in: 400 ... 800)), duration: 0.8)
        let group1 = SKAction.group([scaleX,scaleY,finalMove])
        let anim = SKAction.animate(with: [d101,d102,d103,d104,d105,d106,d107,d108,d109,d1010], timePerFrame: 0.2)
        let rotate = SKAction.rotate(byAngle: 2 * .pi, duration: 2)
        let group2 = SKAction.group([anim,rotate])
        for i in 0..<num{
        var d10 = SKSpriteNode(texture: SKTexture(imageNamed: "d10numero1"))
            d10.position = CGPoint(x: CGFloat(Float.random(in: -800.0 ... 100.0)), y: CGFloat(Float.random(in: -700.0 ... -450.0)))
            d10.zPosition = 100
            d10.name = "d10"
            d10.xScale = 1.0
            d10.yScale = 1.0
            d10.size = CGSize(width: 350, height: 350)
            d10.run(SKAction.sequence([group1,SKAction.repeat(group2, count: 1),SKAction.run {
                if rolledNum[i] == 1 {
                    d10.texture = SKTexture(imageNamed: "d10numero1")
                }else if rolledNum[i] == 2 {
                    d10.texture = SKTexture(imageNamed: "d10numero2")
                }else if rolledNum[i] == 3 {
                    d10.texture = SKTexture(imageNamed: "d10numero3")
                }else if rolledNum[i] == 4{
                    d10.texture = SKTexture(imageNamed: "d10numero4")
                }else if rolledNum[i] == 5{
                    d10.texture = SKTexture(imageNamed: "d10numero5")
                }else if rolledNum[i] == 6{
                    d10.texture = SKTexture(imageNamed: "d10numero6")
                }else if rolledNum[i] == 7{
                    d10.texture = SKTexture(imageNamed: "d10numero7")
                }else if rolledNum[i] == 8 {
                    d10.texture = SKTexture(imageNamed: "d10numero8")
                }else if rolledNum[i] == 9 {
                    d10.texture = SKTexture(imageNamed: "d10numero9")
                }else {
                    d10.texture = SKTexture(imageNamed: "d10numero10")
                }

            }]))
            addChild(d10)
        }
    }
    func spawnD12(rolledNum: [Int]){
        let num = rolledNum.count
        let d121 = SKTexture(imageNamed: "d12nuemro1")
        let d122 = SKTexture(imageNamed: "d12numero2")
        let d123 = SKTexture(imageNamed: "d12numero3")
        let d124 = SKTexture(imageNamed: "d12numero4")
        let d125 = SKTexture(imageNamed: "d12numero5")
        let d126 = SKTexture(imageNamed: "d12numero6")
        let d127 = SKTexture(imageNamed: "d12numero7")
        let d128 = SKTexture(imageNamed: "d12numero8")
        let d129 = SKTexture(imageNamed: "d12numero9")
        let d1210 = SKTexture(imageNamed: "d12numero10")
        let d1211 = SKTexture(imageNamed: "d12numero11")
        let d1212 = SKTexture(imageNamed: "d12numero12")
        let scaleX = SKAction.scaleX(to: 0.4, duration: 0.8)
        let scaleY = SKAction.scaleY(to: 0.4, duration: 0.8)
        let finalMove = SKAction.moveBy(x: 0, y: CGFloat(Float.random(in: 400 ... 800)), duration: 0.8)
        let group1 = SKAction.group([scaleX,scaleY,finalMove])
        let anim = SKAction.animate(with: [d121,d122,d123,d124,d125,d126,d127,d128,d129,d1210,d1211,d1212], timePerFrame: 0.17)
        let rotate = SKAction.rotate(byAngle: 2 * .pi, duration: 2.04)
        let group2 = SKAction.group([anim,rotate])
        for i in 0..<num{
        var d12 = SKSpriteNode(texture: SKTexture(imageNamed: "d12nuemro1"))
            d12.position = CGPoint(x: CGFloat(Float.random(in: -800.0 ... 100.0)), y: CGFloat(Float.random(in: -700.0 ... -450.0)))
            d12.zPosition = 100
            d12.name = "d12"
            d12.xScale = 1.0
            d12.yScale = 1.0
            d12.size = CGSize(width: 300, height: 300)
            d12.run(SKAction.sequence([group1,SKAction.repeat(group2, count: 1),SKAction.run {
                if rolledNum[i] == 1 {
                    d12.texture = SKTexture(imageNamed: "d12nuemro1")
                }else if rolledNum[i] == 2 {
                    d12.texture = SKTexture(imageNamed: "d12numero2")
                }else if rolledNum[i] == 3 {
                    d12.texture = SKTexture(imageNamed: "d12numero3")
                }else if rolledNum[i] == 4{
                    d12.texture = SKTexture(imageNamed: "d12numero4")
                }else if rolledNum[i] == 5{
                    d12.texture = SKTexture(imageNamed: "d12numero5")
                }else if rolledNum[i] == 6{
                    d12.texture = SKTexture(imageNamed: "d12numero6")
                }else if rolledNum[i] == 7{
                    d12.texture = SKTexture(imageNamed: "d12numero7")
                }else if rolledNum[i] == 8 {
                    d12.texture = SKTexture(imageNamed: "d12numero8")
                }else if rolledNum[i] == 9 {
                    d12.texture = SKTexture(imageNamed: "d12numero9")
                }else if rolledNum[i] == 10 {
                    d12.texture = SKTexture(imageNamed: "d12numero10")
                }else if rolledNum[i] == 11 {
                    d12.texture = SKTexture(imageNamed: "d12numero11")
                }else {
                    d12.texture = SKTexture(imageNamed: "d12numero12")
                }
            }]))
            addChild(d12)
        }
    }
    func spawnD20(rolledNum: [Int]){
        let num = rolledNum.count
        let d201 = SKTexture(imageNamed: "d20numero1")
        let d202 = SKTexture(imageNamed: "d20numero2")
        let d203 = SKTexture(imageNamed: "d20numero3")
        let d204 = SKTexture(imageNamed: "d20numero4")
        let d205 = SKTexture(imageNamed: "d20numero5")
        let d206 = SKTexture(imageNamed: "d20numero6")
        let d207 = SKTexture(imageNamed: "d20numero7")
        let d208 = SKTexture(imageNamed: "d20numero8")
        let d209 = SKTexture(imageNamed: "d20numero9")
        let d2010 = SKTexture(imageNamed: "d20numero10")
        let d2011 = SKTexture(imageNamed: "d20numero11")
        let d2012 = SKTexture(imageNamed: "d20numero12")
        let d2013 = SKTexture(imageNamed: "d20numero13")
        let d2014 = SKTexture(imageNamed: "d20numero14")
        let d2015 = SKTexture(imageNamed: "d20numero15")
        let d2016 = SKTexture(imageNamed: "d20numero16")
        let d2017 = SKTexture(imageNamed: "d20numero17")
        let d2018 = SKTexture(imageNamed: "d20numero18")
        let d2019 = SKTexture(imageNamed: "d20numero19")
        let d2020 = SKTexture(imageNamed: "d20numero20")
        let scaleX = SKAction.scaleX(to: 0.4, duration: 0.8)
        let scaleY = SKAction.scaleY(to: 0.4, duration: 0.8)
        let finalMove = SKAction.moveBy(x: 0, y: CGFloat(Float.random(in: 400 ... 800)), duration: 0.8)
        let group1 = SKAction.group([scaleX,scaleY,finalMove])
        let anim = SKAction.animate(with: [d201,d202,d203,d204,d205,d206,d207,d208,d209,d2010,d2011,d2012,d2013,d2014,d2015,d2016,d2017,d2018,d2019,d2020], timePerFrame: 0.1)
        let rotate = SKAction.rotate(byAngle: 2 * .pi, duration: 2)
        let group2 = SKAction.group([anim,rotate])
        for i in 0..<num{
        var d20 = SKSpriteNode(texture: SKTexture(imageNamed: "d20numero1"))
            d20.position = CGPoint(x: CGFloat(Float.random(in: -800.0 ... 100.0)), y: CGFloat(Float.random(in: -700.0 ... -450.0)))
            d20.zPosition = 100
            d20.name = "d20"
            d20.xScale = 1.0
            d20.yScale = 1.0
            d20.size = CGSize(width: 400, height: 290)
            d20.run(SKAction.sequence([group1,SKAction.repeat(group2, count: 1),SKAction.run {
                if rolledNum[i] == 1 {
                    d20.texture = SKTexture(imageNamed: "d20numero1")
                }else if rolledNum[i] == 2 {
                    d20.texture = SKTexture(imageNamed: "d20numero2")
                }else if rolledNum[i] == 3 {
                    d20.texture = SKTexture(imageNamed: "d20numero3")
                }else if rolledNum[i] == 4{
                    d20.texture = SKTexture(imageNamed: "d20numero4")
                }else if rolledNum[i] == 5{
                    d20.texture = SKTexture(imageNamed: "d20numero5")
                }else if rolledNum[i] == 6{
                    d20.texture = SKTexture(imageNamed: "d20numero6")
                }else if rolledNum[i] == 7{
                    d20.texture = SKTexture(imageNamed: "d20numero7")
                }else if rolledNum[i] == 8 {
                    d20.texture = SKTexture(imageNamed: "d20numero8")
                }else if rolledNum[i] == 9 {
                    d20.texture = SKTexture(imageNamed: "d20numero9")
                }else if rolledNum[i] == 10 {
                    d20.texture = SKTexture(imageNamed: "d20numero10")
                }else if rolledNum[i] == 11 {
                    d20.texture = SKTexture(imageNamed: "d20numero11")
                }else if rolledNum[i] == 12{
                    d20.texture = SKTexture(imageNamed: "d20numero12")
                }
                else if rolledNum[i] == 13{
                    d20.texture = SKTexture(imageNamed: "d20numero13")
                }
                else if rolledNum[i] == 14{
                    d20.texture = SKTexture(imageNamed: "d20numero14")
                }
                else if rolledNum[i] == 15{
                    d20.texture = SKTexture(imageNamed: "d20numero15")
                }
                else if rolledNum[i] == 16{
                    d20.texture = SKTexture(imageNamed: "d20numero16")
                }
                else if rolledNum[i] == 17{
                    d20.texture = SKTexture(imageNamed: "d20numero17")
                }
                else if rolledNum[i] == 18{
                    d20.texture = SKTexture(imageNamed: "d20numero18")
                }
                else if rolledNum[i] == 19{
                    d20.texture = SKTexture(imageNamed: "d20numero19")
                }else {
                    d20.texture = SKTexture(imageNamed: "d20numero20")
                }
            }]))
            addChild(d20)
        }
    }
    func order(){
        turnName1.text = playerOrder[0].name
        turnName2.text = playerOrder[1].name
        turnName3.text = playerOrder[2].name
        turnName4.text = playerOrder[3].name
        if let image = UIImage(data: playerOrder[0].image){
            turnAv1.fillTexture = SKTexture(image: image)
        }
        if let image = UIImage(data: playerOrder[1].image){
            turnAv2.fillTexture = SKTexture(image: image)
        }
        if let image = UIImage(data: playerOrder[2].image){
            turnAv3.fillTexture = SKTexture(image: image)
        }
        if let image = UIImage(data: playerOrder[3].image){
            turnAv4.fillTexture = SKTexture(image: image)
        }
        turnSpCont1.text = playerOrder[0].sp
        turnSpCont2.text = playerOrder[1].sp
        turnSpCont3.text = playerOrder[2].sp
        turnSpCont4.text = playerOrder[3].sp
        turnInCont1.text = playerOrder[0].In
        turnInCont2.text = playerOrder[1].In
        turnInCont3.text = playerOrder[2].In
        turnInCont4.text = playerOrder[3].In
        
        
    }
    
}

extension GameScene: NearbyServiceDelegate{
    func multiPeer(didReceiveData data: Data, ofType type: UInt32, from peerID: MCPeerID) {
        switch type {
        case DataType.clear.rawValue:
            if leftPanelShowed {
                scene?.enumerateChildNodes(withName: "coin") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
                scene?.enumerateChildNodes(withName: "d4") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
                scene?.enumerateChildNodes(withName: "d6") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
                scene?.enumerateChildNodes(withName: "d8") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
                scene?.enumerateChildNodes(withName: "d10") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
                scene?.enumerateChildNodes(withName: "d12") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
                scene?.enumerateChildNodes(withName: "d20") {
                    (node,stop) in
                    node.run(SKAction.removeFromParent())
                }
            }
        case DataType.sound.rawValue:
            scene?.run(SKAction.playSoundFileNamed("diceroll", waitForCompletion: false))
            case DataType.d2.rawValue:
                if leftPanelShowed{
                let string = data.convert() as! [Int]
                arrD2 = string
                spawnD2(rolledNum: arrD2)
                }
         case DataType.d4.rawValue:
            if leftPanelShowed{
            let string = data.convert() as! [Int]
            arrD4 = string
            spawnD4(rolledNum: arrD4)
            }
        case DataType.d6.rawValue:
           if leftPanelShowed{
           let string = data.convert() as! [Int]
           arrD6 = string
           spawnD6(rolledNum: arrD6)
           }
        case DataType.d8.rawValue:
           if leftPanelShowed{
           let string = data.convert() as! [Int]
           arrD8 = string
           spawnD8(rolledNum: arrD8)
           }
        case DataType.d10.rawValue:
           if leftPanelShowed{
           let string = data.convert() as! [Int]
           arrD10 = string
           spawnD10(rolledNum: arrD10)
           }
        case DataType.d12.rawValue:
           if leftPanelShowed{
           let string = data.convert() as! [Int]
           arrD12 = string
           spawnD12(rolledNum: arrD12)
           }
        case DataType.d20.rawValue:
           if leftPanelShowed{
           let string = data.convert() as! [Int]
           arrD20 = string
           spawnD20(rolledNum: arrD20)
           }
            case DataType.string.rawValue:
              let string = data.convert() as! String
              
              break
                      
            case DataType.image.rawValue:
                do {
                    var image = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
                    print("data unarchived")
                    store(image: image as! Data, forKey: "image")
                    if let im = UIImage(data: image as! Data) {
//                        store(image: im, forKey: "image")
                        background.texture = SKTexture(image: im)
                    }
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                }
        case DataType.sheet.rawValue:
            let jsonString = String(data: data, encoding: .utf8)
            let jsonData = jsonString?.data(using: .utf8)
            let decoder = JSONDecoder()
            let myStruct = try! decoder.decode(Sheet2.self, from: jsonData!)
            if myStruct.slot == 1 {
                let player1 = myStruct
//                do {
//                    let encoder = JSONEncoder()
//                    let data1 = try encoder.encode(player1)
//                    UserDefaults.standard.setValue(data1, forKey: "player1")
//                }catch let error {
//                    print(error.localizedDescription)
//                }
                avatar1.fillTexture = SKTexture(image: UIImage(data: player1.image)!)
                nameContainer1.text = player1.name
                raceContainer1.text = player1.race
                classContainer1.text = player1.Class
                healthContainer1.text = player1.hp
                acContainer1.text = player1.ac
                spContainer1.text = player1.sp
                inContainer1.text = player1.In
                ppContainer1.text = player1.pp
                crContainer1.text = player1.cr
                InCalc.append(player1.In)
                playerOrder.append(player1)
            }else if myStruct.slot == 2 {
                let player2 = myStruct
//                do {
//                    let encoder = JSONEncoder()
//                    let data1 = try encoder.encode(player2)
//                    UserDefaults.standard.setValue(data1, forKey: "player2")
//                }catch let error {
//                    print(error.localizedDescription)
//                }
                avatar2.fillTexture = SKTexture(image: UIImage(data: player2.image)!)
                nameContainer2.text = player2.name
                raceContainer2.text = player2.race
                classContainer2.text = player2.Class
                healthContainer2.text = player2.hp
                acContainer2.text = player2.ac
                spContainer2.text = player2.sp
                inContainer2.text = player2.In
                ppContainer2.text = player2.pp
                crContainer2.text = player2.cr
                InCalc.append(player2.In)
                playerOrder.append(player2)
            }else if myStruct.slot == 3 {
                let player3 = myStruct
//                do {
//                    let encoder = JSONEncoder()
//                    let data1 = try encoder.encode(player3)
//                    UserDefaults.standard.setValue(data1, forKey: "player3")
//                }catch let error {
//                    print(error.localizedDescription)
//                }
                avatar3.fillTexture = SKTexture(image: UIImage(data: player3.image)!)
                nameContainer3.text = player3.name
                raceContainer3.text = player3.race
                classContainer3.text = player3.Class
                healthContainer3.text = player3.hp
                acContainer3.text = player3.ac
                spContainer3.text = player3.sp
                inContainer3.text = player3.In
                ppContainer3.text = player3.pp
                crContainer3.text = player3.cr
                InCalc.append(player3.In)
                playerOrder.append(player3)
            }else {
                let player4 = myStruct
//                do {
//                    let encoder = JSONEncoder()
//                    let data1 = try encoder.encode(player4)
//                    UserDefaults.standard.setValue(data1, forKey: "player4")
//                }catch let error {
//                    print(error.localizedDescription)
//                }
                avatar4.fillTexture = SKTexture(image: UIImage(data: player4.image)!)
                nameContainer4.text = player4.name
                raceContainer4.text = player4.race
                classContainer4.text = player4.Class
                healthContainer4.text = player4.hp
                acContainer4.text = player4.ac
                spContainer4.text = player4.sp
                inContainer4.text = player4.In
                ppContainer4.text = player4.pp
                crContainer4.text = player4.cr
               
                playerOrder.append(player4)
                playerOrder.sort(by: {$0.In.compare($1.In,options: .numeric) == .orderedDescending})
                order()
                
                
                
            }
            print(myStruct.name)
           
            print(myStruct.Class)
            print(myStruct.hp)
                
                
                break
                      
            default:
              break
          }
    }
    
    
}
extension SKSpriteNode {
    func drawBorder(color: UIColor,width: CGFloat){
        let shapeNode = SKShapeNode(rectOf: CGSize(width: 130, height: 188),cornerRadius: 10)
        shapeNode.fillColor = .clear
        shapeNode.strokeTexture = SKTexture(imageNamed: "scroll")
        shapeNode.lineWidth = width
        addChild(shapeNode)
    }
}
extension String {
   func maxLength(length: Int) -> String {
       var str = self
       let nsString = str as NSString
       if nsString.length >= length {
           str = nsString.substring(with:
               NSRange(
                location: 0,
                length: nsString.length > length ? length : nsString.length)
           )
       }
       return  str
   }
}

