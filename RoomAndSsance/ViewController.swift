//
//  ViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/11.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import UIKit
//import JitsiMeet

class ViewController: UIViewController {

    @IBOutlet var roomNameTextField: UITextField!
//    fileprivate var jitsiMeetView: JitsiMeetView?

    @IBOutlet var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleAnimation()
    }
    
    func sampleAnimation() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.testView.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.colors = [
            UIColor(red: 112/255, green: 46/255, blue: 235/255, alpha: 1).cgColor,
            UIColor(red: 255/255, green: 34/255, blue: 176/255, alpha: 1).cgColor
        ]
        gradientLayer.locations = [0, 1]
        gradientLayer.cornerRadius = 12
        testView.layer.addSublayer(gradientLayer)
        testView.layer.cornerRadius = 12
        
        let dotViews: [UIView] = [UIView(frame: CGRect(x: -15, y: self.testView.frame.height/2-30, width: 15, height: 15)),
                                  UIView(frame: CGRect(x: -15, y: self.testView.frame.height/2-30, width: 15, height: 15)),
                                  UIView(frame: CGRect(x: -15, y: self.testView.frame.height/2-30, width: 15, height: 15))]
        
        for dotView in dotViews {
            dotView.layer.cornerRadius = dotView.frame.width / 2
            dotView.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)
            testView.addSubview(dotView)
        }
        
        var i: Int = 0
        let rotateForwardAnimationDuration: TimeInterval = 1
        let rotateBackAnimationDuration: TimeInterval = 1
        let animationDuration: TimeInterval = rotateForwardAnimationDuration + rotateBackAnimationDuration
        
        for dotView in dotViews {
            let delay = 0.2 * Double(i)
            
            UIView.animateKeyframes(withDuration: animationDuration, delay: delay, options: .repeat, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: rotateForwardAnimationDuration) {
                    dotView.frame.origin = CGPoint(x: dotView.frame.origin.x + self.testView.frame.width/2, y: dotView.frame.origin.y + self.testView.frame.height/2)
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: rotateBackAnimationDuration) {
                    dotView.frame.origin = CGPoint(x: dotView.frame.origin.x + self.testView.frame.width/2 + 40, y: dotView.frame.origin.y - self.testView.frame.height/2)
                }
            }, completion: nil)
            
            i = i + 1
        }
    }
    
    @IBAction func joinRoom(_ sender: Any) {
        
        
        
//        let room: String = roomNameTextField.text!
//        if(room.count < 1) {
//            return
//        }
//
//        // create and configure jitsimeet view
//        let jitsiMeetView = JitsiMeetView()
//        jitsiMeetView.delegate = self
//        self.jitsiMeetView = jitsiMeetView
//        let options = JitsiMeetConferenceOptions.fromBuilder { (builder) in
//            builder.welcomePageEnabled = false
//            builder.room = room
//            builder.userInfo?.displayName = "customuser"
////            builder.room = "teamteamteamteam"
//
//            builder.setFeatureFlag("add-people.enabled", withBoolean: false)
//            builder.setFeatureFlag("invite.enabled", withBoolean: false)
//            builder.setFeatureFlag("add-people.enabled", withBoolean: false)
//            builder.setFeatureFlag("live-streaming.enabled", withBoolean: false)
//            builder.setFeatureFlag("meeting-name.enabled", withBoolean: false)
//            builder.setFeatureFlag("meeting-password.enabled", withBoolean: false)
//            builder.setFeatureFlag("pip.enabled", withBoolean: false)
//
//            builder.setFeatureFlag("recording.enabled", withBoolean: true)
//            builder.setFeatureFlag("tile-view.enabled", withBoolean: true)
//        }
//
//        // setup view controller
//        let vc = UIViewController()
//        vc.modalPresentationStyle = .fullScreen
//        vc.view = jitsiMeetView
//
//        // join room and display jitsi-call
//        jitsiMeetView.join(options)
//        present(vc, animated: true, completion: nil)
        
        
    }
    
//    fileprivate func cleanUp() {
//        if(jitsiMeetView != nil) {
//            dismiss(animated: true, completion: nil)
//            jitsiMeetView = nil
//        }
//    }
    
    
    
}

//extension ViewController: JitsiMeetViewDelegate {
//    func conferenceTerminated(_ data: [AnyHashable : Any]!) {
//        cleanUp()
//    }
//}
