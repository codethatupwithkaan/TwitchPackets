//
//  ViewController.swift
//  TwitchPackets
//
//  Created by Kaan on 2020-01-31.
//

import UIKit

/// TWITCH INTERVIEW QUESTION

///You have to write a network packet parser.  Your parser receives packets with the following structure.  The start flag means it is the start of a sequence of data and the end flag means it is the end of a sequence of data.  You must have all of the packets sorted by index between the start and end packet to complete the sequence. The packets can come in any order.
///Complete the Receiver class so that the onSequenceComplete function is called with the Packets in sorted order when a sequence is complete.

///Example Packets
///1, 2S, 5E, 3, 4, 6
///1, 2S, 3, 4, 5E, 6
///6, 2S, 5E, 3, 4, 1
///2S, 5E, 3, 4

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// INCOMING Packets .. packets .. packs pax.. pa..
        
        let packet6 = Packet(start: false, end: false, index: 6, data: nil)
        let packet2 = Packet(start: true, end: false, index: 2, data: nil)
        let packet5 = Packet(start: false, end: true, index: 5, data: nil)
        let packet3 = Packet(start: false, end: false, index: 3, data: nil)
        let packet4 = Packet(start: false, end: false, index: 4, data: nil)
        let packet1 = Packet(start: false, end: false, index: 1, data: nil)
        let streamPackets = [packet6, packet2, packet5, packet3, packet4, packet1]

        /// Receiver created
        let receiver = Receiver()
        
        for packet in streamPackets {
            receiver.onPacketReceived(packet: packet)
        }
        
    }


}

