//
//  Tiles.swift
//  Tiles
//
//  Created by Michael Yuzhou Fu on 3/3/21.
//

import Foundation
func myMain() -> String
{
    let tempsvr = TileServer(1234)
    tempsvr.createTiles()
    tempsvr.joinPeriod = false
    
    let tempClient = TileClient()
    
    tempClient.onBoard[4][4] = "T"
    tempClient.onBoard[4][5] = "H"
    tempClient.onBoard[4][6] = "I"
    tempClient.onBoard[4][7] = "S"
    tempClient.onBoard[5][4] = "E"
    tempClient.onBoard[6][4] = "S"
    tempClient.onBoard[7][4] = "T"
    tempClient.onBoard[7][5] = "E"
    tempClient.onBoard[7][6] = "L"
    tempClient.onBoard[7][7] = "L"
    tempClient.onBoard[8][7] = "O"
    tempClient.onBoard[9][7] = "W"
    // tempClient.onBoard[10][7] = "X"

    return String(tempClient.callSplit())
}
