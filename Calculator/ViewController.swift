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
    
    @IBOutlet weak var outputLbl: UILabel!
    
    //load sound for btn
    var btnSound: AVAudioPlayer!

    
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

    
    //Function to play sound
    @IBAction func numberPressed(btn: UIButton!){
    btnSound.play()
        
    
    }
}

