//
//  ARC.swift
//  DeepSwift
//
//  Created by Bimo Sekti Wicaksono on 07/11/23.
//

import Foundation

class ClientStrong {
    var server: ServerStrong
    
    init (server: ServerStrong) {
        self.server = server
        server.add(client: self)
    }
    
    deinit {
        print("\(Self.self) object was deallocated")
    }
}

class ServerStrong {
    var clients: [ClientStrong] = []
    func add(client: ClientStrong) {
        clients.append(client)
    }
    
    deinit {
        print("\(Self.self) object was deallocated")
    }
}


class ClientWeak {
    weak var server: ServerWeak?
    
    init (server: ServerWeak) {
        self.server = server
        server.add(client: self)
    }
    
    deinit {
        print("\(Self.self) object was deallocated")
    }
}

class ServerWeak {
    var clients: [ClientWeak] = []
    func add(client: ClientWeak) {
        clients.append(client)
    }
    
    deinit {
        print("\(Self.self) object was deallocated")
    }
}
