//
//  Tiles.swift
//  Tiles
//
//  Created by Michael Yuzhou Fu on 3/3/21.
//

import Foundation
func myMain() -> String
{
    var tempsvr = TileServer(1234)
    tempsvr.createTiles()
    tempsvr.startServer()
    tempsvr.joinPeriod = false
    
    var tempClient = TileClient()
    
    tempClient.onBoard[4][4] = "T"
    tempClient.onBoard[4][5] = "H"
    tempClient.onBoard[4][6] = "I"
    tempClient.onBoard[4][7] = "S"
    tempClient.onBoard[5][4] = "E"
    tempClient.onBoard[6][4] = "S"
    tempClient.onBoard[7][4] = "T"
    //tempClient.onBoard[7][5] = "E"
    //tempClient.onBoard[7][6] = "L"
    //tempClient.onBoard[7][7] = "L"
    //tempClient.onBoard[8][7] = "O"
    //tempClient.onBoard[9][7] = "W"
    tempClient.onBoard[10][7] = "X"
    
    return String(tempClient.callSplit())
}

/*
 Code to make sure that a tile is not alone
 
 if self.inHand.count == 0
 {
     for i in 1..<self.gridSize-1
     {
         for j in 1..<self.gridSize-1
         {
             if (self.onBoard[i][j] == "@")
             {
                 continue
             }
             else
             {
                 if (self.onBoard[i-1][j] == "@" || self.onBoard[i-1][j] == "#") && (self.onBoard[i+1][j] == "@" || self.onBoard[i+1][j] == "#") && (self.onBoard[i][j-1] == "@" || self.onBoard[i][j-1] == "#") &&  (self.onBoard[i][j+1] == "@" || self.onBoard[i][j+1] == "#")
                 {
                     return false
                 }
             }
         }
     }
 */

