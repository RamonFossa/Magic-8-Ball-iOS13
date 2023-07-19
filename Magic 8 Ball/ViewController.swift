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

    @IBOutlet weak var imageBallOutlet: UIImageView!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        imageBallOutlet.image = ballArray[0]
    }
    
    func sortNewNumber() -> Int {
        print("sortNewNumber() -> Entrou")
        let newNum: Int = Int.random(in: 0..<self.ballArray.count)
        
        
        print("sortNewNumber() -> NewNumber: \(newNum)")
        
        if newNum != self.lastIndex {
            self.lastIndex = newNum
            return newNum
        }
        
        
        print("sortNewNumber() -> Mesmo número")
        return sortNewNumber()
    }
    
    @IBAction func buttonClickAction(_ sender: Any) {
        let newIndex = sortNewNumber()
        
        imageBallOutlet.image = ballArray[newIndex]
    }
}

