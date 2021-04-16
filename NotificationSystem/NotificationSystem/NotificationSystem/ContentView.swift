//
//  ContentView.swift
//  NotificationSystem
//
//  Created by Ranim Alayoubi on 01/04/2021.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack{
            Button("Ask for Permission"){
                UNUserNotificationCenter.current()
                    .requestAuthorization(options: [.alert, .badge, .sound]) {
                        success, error in
                        if (success){
                            print("Success!!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
            }
            Button("Schedule Notification"){
                let content = UNMutableNotificationContent()
                content.title = "Notifictaion"
                content.subtitle = "Notification system is working :)"
                content.sound = UNNotificationSound.default
                
//                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
//              Get notification in specific day
                var dateComponents = DateComponents()
                dateComponents.hour = 20
                dateComponents.minute = 26
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
