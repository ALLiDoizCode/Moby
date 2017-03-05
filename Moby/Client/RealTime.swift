//
//  RealTime.swift
//  Moby
//
//  Created by Jonathan on 1/29/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import SendBirdSDK
import SwiftEventBus

class RealTime {
    
    var allChannels:[SBDOpenChannel] = []
    
    var clientId = "47DC1295-0075-4793-9604-F09D204F800B"
    
    func auth(){
        
        SBDMain.initWithApplicationId(clientId)
    }
    
    func connect(objectId:String,userName:String,imageUrl:String,competion:@escaping (_ currentUser:SBDUser) -> Void){
        
        SBDMain.connect(withUserId: objectId) { (user, error) in
            
            print(user!)
            
            self.setUserInfo(userName: userName, imageUrl: imageUrl)
            
            competion(user!)
        }
    }
    
    func disconnect(){
        
        SBDMain.disconnect { 
            
            print("disconnected")
        }
    }
    
    func setUserInfo(userName:String,imageUrl:String){
        
        SBDMain.updateCurrentUserInfo(withNickname: userName, profileUrl: imageUrl) { (error) in
            
        }
    }
    
    func nextPage(query:SBDOpenChannelListQuery){
        
        query.loadNextPage(completionHandler: { (channeles, error) in
            
            for channel in channeles! {
                
                self.allChannels.append(channel)
            }
            
            if query.hasNext == true {
                
                self.nextPage(query: query)
                
            }else {
                
                SwiftEventBus.post("all")
            }
        })
    }
    
    func getChannelList(channelName:String,completion:@escaping (_ channel:SBDOpenChannel) -> Void){
        
        var myChannel:SBDOpenChannel!
        
        let query = SBDOpenChannel.createOpenChannelListQuery()
        
        SwiftEventBus.onBackgroundThread(self, name: "all") { (result) in
            
            if self.allChannels.count != 0 {
                
                print("number of channels is \(self.allChannels.count)")
                
                for channel in self.allChannels {
                    
                    if channel.name == channelName {
                        
                        myChannel = channel
                    }
                }
                
                guard myChannel != nil else {
                    
                    print("no channel found creating channel")
                    
                    SBDOpenChannel.createChannel(withName: channelName, coverUrl: nil, data: nil, operatorUserIds: nil) { (channel, error) in
                        
                        channel?.enter(completionHandler: { (error) in
                            if error != nil {
                                NSLog("Error: %@", error!)
                                return
                            }
                            
                            completion(channel!)
                            
                            // ...
                        })
                    }
                    
                    return
                }
                
                print("channel found")
                
                myChannel?.enter(completionHandler: { (error) in
                    if error != nil {
                        NSLog("Error: %@", error!)
                        return
                    }
                    
                    completion(myChannel!)
                    
                    // ...
                })
                
            }else {
                
                print("no channel found creating channel")
                
                SBDOpenChannel.createChannel(withName: channelName, coverUrl: nil, data: nil, operatorUserIds: nil) { (channel, error) in
                    
                    channel?.enter(completionHandler: { (error) in
                        if error != nil {
                            NSLog("Error: %@", error!)
                            return
                        }
                        
                        completion(channel!)
                        
                        // ...
                    })
                }
            }
        }
        
        self.nextPage(query: query!)
    }
    
    func joinChannel(channel:SBDOpenChannel){
        
        channel.enter(completionHandler: { (error) in
            if error != nil {
                NSLog("Error: %@", error!)
                return
            }
            
            // ...
        })
    }
    
    func leaveChannel(channel:SBDOpenChannel){
        
        channel.exitChannel(completionHandler: { (error) in
            if error != nil {
                NSLog("Error: %@", error!)
                return
            }
            
            // ...
        })
    }
    
    func sendMessage(channel:SBDOpenChannel,myMessage:String){
        
        channel.sendUserMessage(myMessage) { (message, error) in
            
            if error == nil {
                
                print("sent message \(message?.message)")
                
            }else {
                
                print(error)
            }
        }
    }
    
    func removeChannelDelegate() {
        
        SBDMain.removeChannelDelegate(forIdentifier: ParseClient().currentUserName!)
    }
}
