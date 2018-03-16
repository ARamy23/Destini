//
//  ViewController.swift
//  Destini
//
//  Created by Ahmed Ramy on 1/30/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //-------Model
    let story1Text : String = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception.\nYou Decided to Hitchhike. A rusty pickup truck rumbles to a stop next to you.\nA Man with a wide brimmed hat and soulless eyes open the passenger door for you and says : \"Need a Ride, boy?\" "
    let story1A : String  = "I'll hop in. Thanks for the help! "
    let story1B : String = "Well , I don't have many options . (Better ask him if he's a murderer)"
    let story2Text : String = "(He Nods Slowly , unphased by the question)"
    let story2A : String = "(At least he's honest , I'll climb in)"
    let story2B : String = "Wait , I know how to change a tire"
    let story3Text : String = "As you begin to drive, the stranger starts talking about his relationship with his mother.\nHe gets angrier and angrier by the minute. He asks you to open the glove box.\nInside you find a bloody knife, two severed fingers, and a cassette tape of Elton John.\n(He reaches for the glove box)"
    let story3A : String = "I love Elton John! (Hand him the cassette tape)"
    let story3B : String = "It's him or me. (Take the knife and stab that ********)"
    let story4Text : String = "What? Such a cop out!\nDid you know accidental traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story4EndingComment : String = "That's right, Better not hop in into strangers cars , just like momma always says"
    let story5Text : String = "As you smash through the guardrail and careen towards the jagged rocks below, you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in "
    let story5EndingComment : String = "You just went full retard , never go full retard"
    let story6Text : String = "You Bond with the murderer while crooning verses of \"Can you feel the love tonight\".\nHe drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier\""
    let story6EndingComment : String = "Drop 'em in the pier he said , it would be fun he said"
    
    //------------Variables
    var currentStory : Int = 1
    var currentChoiceSet : Int = 1
    var currentEndingComment : Int = 4
    
    var stories : [String] = []
    var choices : [[String]] = []
    var endingComments : [String] = []
    
    
    //---------Outlets
    @IBOutlet weak var storyText: UITextView!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        stories = [story1Text , story2Text , story3Text , story4Text , story5Text , story6Text]
        choices = [[story1A , story1B] , [story2A , story2B] , [story3A , story3B]]
        endingComments = [story4EndingComment , story5EndingComment , story6EndingComment]
        updateUIComponent()
        updateTextSize()
        
    }
    
    @IBAction func actionPressed(_ sender: UIButton)
    {
        func goToStoryX()
        {
            if(currentStory == 1 && sender.tag == 1)
            {
                currentStory = 3
                currentChoiceSet = 3
            }
            else if(currentStory == 1 && sender.tag == 2)
            {
                currentStory = 2
                currentChoiceSet = 2

            }
            
            else if(currentStory == 2 && sender.tag == 1)
            {
                currentStory = 3
                currentChoiceSet = 3

            }
            else if (currentStory == 2 && sender.tag == 2)
            {
                currentStory = 4
                btnA.isHidden = true
                btnB.isHidden = true
                currentEndingComment = 4
                let alert = UIAlertController(title: "The End", message: endingComments[currentEndingComment - 4], preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Restart ?", style: .default, handler: { (UIAlertAction) in
                    self.restart()
                })
                alert.addAction(restartAction)
                present(alert, animated: true, completion: nil)
                
            }
                
            else if(currentStory == 3 && sender.tag == 1)
            {
                currentStory = 6
                btnA.isHidden = true
                btnB.isHidden = true
                currentEndingComment = 6
                let alert = UIAlertController(title: "The End", message: endingComments[currentEndingComment - 4], preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Restart ?", style: .default, handler: { (UIAlertAction) in
                    self.restart()
                    })
                alert.addAction(restartAction)
                present(alert, animated: true, completion: nil)
                
                
                
            }
            else if(currentStory == 3 && sender.tag == 2)
            {
                currentStory = 5
                btnA.isHidden = true
                btnB.isHidden = true
                currentEndingComment = 5
                let alert = UIAlertController(title: "The End", message: endingComments[currentEndingComment - 4], preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Restart ?", style: .default, handler: { (UIAlertAction) in
                    self.restart()
                })
                alert.addAction(restartAction)
                present(alert, animated: true, completion: nil)


            }
        }
        goToStoryX()
        updateUIComponent()
        
        
        
    }
    
    
    
    func updateUIComponent()
    {
        storyText.text = stories[currentStory - 1]
        btnA.setTitle(choices[currentChoiceSet - 1][0], for: UIControlState.normal)
        btnB.setTitle(choices[currentChoiceSet-1][1], for: UIControlState.normal)
        
    }

    func updateTextSize()
    {
        storyText.sizeToFit()
        btnA.titleLabel?.adjustsFontSizeToFitWidth = true
        btnB.titleLabel?.adjustsFontSizeToFitWidth = true

    }
    
    func restart()
    {
        currentStory = 1
        currentChoiceSet = 1
        currentEndingComment = 4
        updateUIComponent()
        btnA.isHidden = false
        btnB.isHidden = false
        
    }
}

