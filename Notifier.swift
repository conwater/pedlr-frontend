//
//  Notifier.swift
//  pedlr
//
//  Created by Connor Filipiak on 4/3/23.
//

import SwiftUI
import UserNotifications

class Notifier: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    static let instance = Notifier()
    
    var sent = false
    
    func requestPermissions() {
        // sets so that the Notifier instance can be its own notification delegate
        UNUserNotificationCenter.current().delegate = self
        
        // requests user permission to send notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { success, error in
            if success {
                print("NOTIFICATIONS ENABLED")
            }
            else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func checkState(states: [Bool]) {
        if states[0] == false && states[1] == true && sent == false {
            // formats the notification content
            let content = UNMutableNotificationContent()
            content.title = "pedlr"
            content.body = "Alarm has been activated!"
            content.sound = UNNotificationSound.default
                
            // formats the notification trigger, instant delivery
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            
            // formats the notification request
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            // sends the notification request
            UNUserNotificationCenter.current().add(request)
            
            // so that the notification doesn't repeat
            sent = true
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            // show the notification banner while the app is in the foreground
            completionHandler([.banner, .sound])
        }
}
