//
//  ViewController.swift
//  Cooking Timer
//
//  Created by Anton  on 28.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft"   : 3,
                    "Medium" : 4,
                    "Hard"   : 7]
    
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        guard let hardness = sender.titleLabel?.text else { return }
        totalTime = eggTimes[hardness]!
        
        progressView.progress = 0.0
        secondsPassed = 0
        textLabel.text = hardness

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressView.progress = Float(secondsPassed) / Float(totalTime)
            
           

        } else {
            timer.invalidate()
            textLabel.text = "Done!"
            playSound()
        }
    }
    
    func playSound() {
       let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

