//
//  MyLiveActivityLiveActivity.swift
//  MyLiveActivity
//
//  Created by 김지태 on 1/15/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MyLiveActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
    var totalNum = 100.0
}

@available(iOS 16.1, *)
struct MyLiveActivityLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MyLiveActivityAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MyLiveActivityAttributes {
    fileprivate static var preview: MyLiveActivityAttributes {
        MyLiveActivityAttributes(name: "World")
    }
}

extension MyLiveActivityAttributes.ContentState {
    fileprivate static var smiley: MyLiveActivityAttributes.ContentState {
        MyLiveActivityAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: MyLiveActivityAttributes.ContentState {
         MyLiveActivityAttributes.ContentState(emoji: "🤩")
     }
}

