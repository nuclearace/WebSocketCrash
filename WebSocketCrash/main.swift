//
//  main.swift
//  WebSocketCrash
//
//  Created by Erik Little on 1/20/16.
//  Copyright © 2016 Erik Little. All rights reserved.
//

import Foundation

class TestClass : WebSocketDelegate {
    let ws = WebSocket(url: NSURL(string: "ws://localhost:8080/")!)
    
    func connect() {
        ws.delegate = self
        ws.connect()
    }
    
    func websocketDidConnect(socket: WebSocket) {
        print("did connect")
        ws.writeString("hello")
        test = nil
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print("Did disconnect")
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: NSData) {
        print("Got data")
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        print("Got message: \(text)")
    }
}

var test: TestClass? = TestClass()

test?.connect()

CFRunLoopRun()