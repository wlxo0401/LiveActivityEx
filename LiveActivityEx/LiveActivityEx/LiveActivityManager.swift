//
//  LiveActivityManager.swift
//  LiveActivityEx
//
//  Created by 김지태 on 1/15/24.
//

import Foundation
import ActivityKit

@available(iOS 16.1, *)
class LiveActivityManager {
    // 싱글톤 인스턴스
    static let shared = LiveActivityManager()

    // private 초기화를 사용하여 외부에서 인스턴스 생성을 방지
    private init() {}
    
    
    // 담아두는 변수
    private var activity: Activity<MyLiveActivityAttributes>?
    
    // 앱 종료할 때 같이 종료시키기
    internal var isTerminateWithApp: Bool = false
    
    // 실행
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
    
    // 종료
    func offLiveActivity() {
        Task {
            // using: final dynamic content정의
            // policy: 디폴트, 즉시종료, date후 종료 설정가능
            await activity?.end(using: nil, dismissalPolicy: .immediate)
        }
    }
}
