//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]
    var lastIndex: Int = 0
    let standardColor: UIColor = UIColor(cgColor: CGColor(red: 104 / 255, green: 39 / 255, blue: 217 / 255, alpha: 1))
    let shakingColor: UIColor = UIColor(cgColor: CGColor(red:  57 / 255, green:  20 / 255, blue:  120 / 255, alpha: 1)) //41, 15, 87

    @IBOutlet weak var imageBallOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        self.imageBallOutlet.image = self.ballArray[0]
        self.view.backgroundColor = self.standardColor
    }
    
    func sortNewNumber() -> Int {
        print("sortNewNumber() -> Entrou")
        let newNum: Int = Int.random(in: 0..<self.ballArray.count)
        
        if newNum != self.lastIndex {
            print("sortNewNumber() -> Novo número: \(newNum)")
            self.lastIndex = newNum
            return newNum
        }
        
        print("sortNewNumber() -> Mesmo número")
        return self.sortNewNumber()
    }
    
    func changeBallImage() {
        print("changeBallImage() -> Entrou")
        self.view.backgroundColor = self.shakingColor
        let newIndex = self.sortNewNumber()
        self.imageBallOutlet.image = self.ballArray[newIndex]
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.view.backgroundColor = self.standardColor
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if(event?.subtype == UIEvent.EventSubtype.motionShake) {
            self.changeBallImage()
        }
    }
}

