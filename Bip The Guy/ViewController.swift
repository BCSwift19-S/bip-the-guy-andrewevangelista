//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Andrew on 2/3/19.
//  Copyright © 2019 Andrew Evangelista. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var imageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK:Functions
    func animateImage(){
        let bounds = self.imageToPunch.bounds
        let shrinkValue: CGFloat = 60
        
        //Shrink image to punch by 60 pixels
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue, y: self.imageToPunch.bounds.origin.y + shrinkValue, width: self.imageToPunch.bounds.size.width - shrinkValue, height: self.imageToPunch.bounds.size.height - shrinkValue)
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: { self.imageToPunch.bounds = bounds }, completion: nil)
        
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        
        if let sound = NSDataAsset(name: soundName) {
            
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("Error: Data in \(soundName) couldn't be played as sound.")
            }
        }else {
            print("Error: File \(soundName) didn't load." )
        }
        
        
    }
    
    
    
    //MARK: Actions
    
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
    
}

