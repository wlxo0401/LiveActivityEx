//
//  ViewController.swift
//  LiveActivityEx
//
//  Created by 김지태 on 1/15/24.
//

import UIKit
import ActivityKit

class ViewController: UIViewController {

    private var activity: Activity<MyLiveActivityAttributes>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.onLiveActivity()
    }

    func onLiveActivity() {
        // 앱이 live activity사용 가능한지여부
        guard ActivityAuthorizationInfo().areActivitiesEnabled else { return }
        let attribute = MyLiveActivityAttributes(name: "NS")
        // stateful한 값
        let state = MyLiveActivityAttributes.ContentState(emoji: "😌")
        do {
            // live activity 시작
            self.activity = try Activity.request(attributes: attribute, contentState: state)
        } catch {
            print(error)
        }
    }
}

