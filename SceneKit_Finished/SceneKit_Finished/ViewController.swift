//
//  ViewController.swift
//  SceneKit_Finished
//
//  Created by João Guilherme on 25/04/21.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let sceneView = SCNView(frame: self.view.frame)
        self.view.addSubview(sceneView)
        
        // 1: Carregando o modelo
        let scene = SCNScene(named: "watchC_planet07.dae")
        
        
        // 2: Adicionando a node da camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        // 3: Posicionando a camera
        cameraNode.position = SCNVector3(x: 0.0, y: 0.5, z: 8)
        // 4: Colocando a camera na cena
        scene?.rootNode.addChildNode(cameraNode)
        
        // 5: Adicionando luz para a cena
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 8)
        scene?.rootNode.addChildNode(lightNode)
        
        // 6: Adicionando Ambilight a cena
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLightNode)
        
        // Caso vc não queira controlar a luz o sceneKit tem a luz padrão commente os blocos 5 e 6 e descomente a linha de baixo
        //sceneView.autoenablesDefaultLighting = true
        
        // Permitindo que o usuário consiga controlar a camera
        sceneView.allowsCameraControl = true
        
        // Habilitando as estatisticas dos sceneKit
        sceneView.showsStatistics = true
        
        // Definindo cor de fundo
        sceneView.backgroundColor = UIColor.white
        
        //Definindo se o usuario pode fazer gestos de translacao
        sceneView.cameraControlConfiguration.allowsTranslation = false
        
        //Adicionando as animacões
        
        let rotateOne = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi), z: 0, duration: 5.0)
        let hoverUp = SCNAction.moveBy(x: 0, y: 0.2, z: 0, duration: 2.5)
        let hoverDown = SCNAction.moveBy(x: 0, y: -0.2, z: 0, duration: 2.5)
        let hoverSequence = SCNAction.sequence([hoverUp, hoverDown])
        let rotateAndHover = SCNAction.group([rotateOne, hoverSequence])
        let repeatForever = SCNAction.repeatForever(rotateAndHover)
        scene?.rootNode.runAction(repeatForever)
        
        // Adicionando as configuracoes na cena
        sceneView.scene = scene
        
        
    }
    
    
}

