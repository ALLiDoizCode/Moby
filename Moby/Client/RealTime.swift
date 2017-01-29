//
//  RealTime.swift
//  Moby
//
//  Created by Jonathan on 1/29/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import SendBirdSDK

class RealTime {
    
    var clientId = "7632C601-2154-46CF-888C-019389F13183"
    
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
    
    func getChannelList(channelName:String,completion:@escaping (_ channel:SBDOpenChannel) -> Void){
        
        let query = SBDOpenChannel.createOpenChannelListQuery()
        query?.nameKeyword = channelName
        query?.loadNextPage(completionHandler: { (channels, error) in
            
            if channels != nil {
                
                let channel = channels?[0]
                
                
                channel?.enter(completionHandler: { (error) in
                    if error != nil {
                        NSLog("Error: %@", error!)
                        return
                    }
                    
                    completion(channel!)
                    // ...
                })

                
            }else {
                
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
        })
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
                
                print("sent message \(message)")
                
            }else {
                
                print(error)
            }
        }
    }
    
    func removeChannelDelegate() {
        
        SBDMain.removeChannelDelegate(forIdentifier: ParseClient().currentUserName!)
    }
}
