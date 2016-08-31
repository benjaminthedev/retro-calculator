//
//  ViewController.swift
//  Calculator
//
//  Created by Benjamin Dordoigne on 11/08/2016.
//  Copyright © 2016 Benjamin the Geek! All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation: String{
        
        case Divide = "/"
        case Muliply = "*"
        case Subtract = "-"
        case Add = "+"
        //case Equals = "="
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    
    //load sound for btn
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValString = ""
    var rightValString = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    
    
//    SET THE CLEAR BUTTON TO EMPTY STRING??????
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Audio Player for button
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL (fileURLWithPath: path!)
        
        //Try to play sound
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            //prepare to play
            btnSound.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
     }

    
    
    //IBAction Section
    
    //Function to play sound
    @IBAction func numberPressed(btn: UIButton!){
        playSound()
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePress(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Muliply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }

    func processOperation(op: Operation){
        
        playSound()
        
        if currentOperation != Operation.Empty{
            //Run math
            
            if runningNumber != ""{
            
                rightValString = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Muliply{
                    result = "\(Double(leftValString)! * Double(rightValString)!)"
                } else if currentOperation == Operation.Divide{
                    result = "\(Double(leftValString)! / Double(rightValString)!)"
                } else if currentOperation == Operation.Subtract{
                    result = "\(Double(leftValString)! - Double(rightValString)!)"
                } else if currentOperation == Operation.Add{
                    result = "\(Double(leftValString)! + Double(rightValString)!)"
                }
                
                leftValString = result
                outputLbl.text = result
                
                
            }
            
         
            
            currentOperation = op
            
            
        } else{
            leftValString = runningNumber
            runningNumber = ""
            currentOperation = op
        }
        
    }
    
    func playSound(){
        if btnSound.playing{
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
}

