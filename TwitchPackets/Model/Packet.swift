//
//  Packet.swift
//  TwitchPackets
//
//  Created by Kaan on 2020-01-31.
//  Copyright © 2020 Kaan. All rights reserved.
//

import Foundation

struct Packet: Hashable {
    let index: Int
    let start: Bool
    let end: Bool
    let data: Data?
    
    init(start: Bool, end: Bool, index: Int, data: Data?) {
        self.start = start
        self.end = end
        self.index = index
        self.data = data
    }

    static func == (lhs: Packet, rhs: Packet) -> Bool {
        return lhs.index == rhs.index
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(index)
    }
}
