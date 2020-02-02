//
//  Receiver.swift
//  TwitchPackets
//
//  Created by Kaan on 2020-01-31.
//  Copyright © 2020 Kaan. All rights reserved.
//

import Foundation

class Receiver {

    var hashmap: [Int: Packet] = [:]
    var startIndex = Int.max
    var endIndex = Int.min
    var packets: Set<Packet> = Set<Packet>()
    var sequenceComplete = false
    
    func onPacketReceived(packet: Packet) {
        guard sequenceComplete == false else { return }
        
        hashmap[packet.index] = packet
        
        if packet.start {
            startIndex = packet.index
        }
        
        if packet.end {
            endIndex = packet.index
        }
        
        if startIndex != Int.max && endIndex != Int.min {
            for key in hashmap.keys {
                if let packetIndex = hashmap[key]?.index,
                    let curPacket = hashmap[key],
                    packetIndex >= startIndex, packetIndex <= endIndex {
                    packets.insert(curPacket)
                    hashmap[packetIndex] = nil
                }
            }
            
            if packets.count == ((endIndex + 1) - startIndex) {
                var array = Array(packets)
                array.sort { (packet1, packet2) -> Bool in
                    packet1.index < packet2.index
                }
                onSequenceComplete(packets: array)
                return
            }
        }
        
    }

    private func onSequenceComplete(packets: Array<Packet>) {
        sequenceComplete = true
        print(packets)
        print(" ...SUCCESS, ALL PACKETS HAVE BEEN RECEIVED... ")
    }
}
