//
//  ServerTiles.swift
//  Tiles
//
//  Created by Michael Yuzhou Fu and Rushil Shah on 3/3/21.
//

import Foundation
class TileServer
{
    let hostname = "" //function that gets the hostname through UIKit
    let port:Int?  // this is the port number that the server is being run on
    let joinCode:String?
    var clientsArray = [String]()
    var playerCount = 1
    var joinPeriod = false
    var tilesArray = [String]()

    init(_ port: Int)
    {
        self.port = port
        self.clientsArray.append(self.hostname)
        self.joinCode = "ABCDEFGH"
    }


    func processDrop(_ requestingClient: String, _ droppedLetter: String)
    {
        self.tilesArray.append(droppedLetter)
        self.tilesArray.shuffle()
        let result = Array(self.tilesArray.dropFirst(3))
        // self.send(requestingClient, result.joined())
    }
    
    func processSplit(_ requestingClient: String)
    {
        if self.tilesArray.count == 0
        {
            for client in clientsArray
            {
                // send(client, requestingClient)
            }
        }
        let requestingClientTile = self.tilesArray.dropFirst(1)
        // send(requestingClient, requestingClientTile.joined())
        
        for client in self.clientsArray
        {
            if client == requestingClient
            {
                continue
            }
            let tile = self.tilesArray.dropFirst(1)
            if tile.count != 0
            {
                // send(client, tile.joined())
            }
        }
    }

    func createTiles()
    {
        let tilesCount = [13, 3, 3, 6, 18, 3, 4, 3, 12, 2, 2, 5, 3, 8, 11, 3, 2, 9, 6, 9, 6, 3, 3, 2, 3, 2]
        
        for (index, count) in tilesCount.enumerated()
        {
            self.tilesArray.append(contentsOf: repeatElement(String(UnicodeScalar(index + 97)!),count: count))
        }
        self.tilesArray.shuffle()

        var tilesCountPerPlayer:Int
        if playerCount >= 2 && playerCount <= 4
        {
            tilesCountPerPlayer = 21
        }
        else if playerCount >= 5 && playerCount <= 6
        {
            tilesCountPerPlayer = 15
        }
        else if playerCount >= 7 && playerCount <= 8
        {
            tilesCountPerPlayer = 11
        }
        else
        {
            tilesCountPerPlayer = 0
        }

        var tilesPerPlayer: [[String]] = []
        for _ in 1...playerCount
        {
            let result = Array(self.tilesArray.dropFirst(tilesCountPerPlayer))
            tilesPerPlayer.append(result)
        }
        for (client, tiles) in zip(clientsArray, tilesPerPlayer)
        {
            // self.send(client, tiles.joined())
        }
    }
}
