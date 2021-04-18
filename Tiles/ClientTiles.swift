//
//  ClientTiles.swift
//  Tiles
//
//  Created by Michael Yuzhou Fu and Rushil Shah on 3/3/21.
//

import UIKit
import Foundation


class TileClient
{
    var inHand = [String]()
    var onBoard: [[String]] = []
    let gridSize = 20
    
    init()
    {
        self.onBoard = [[String]](repeating: [String](repeating: "@", count: self.gridSize), count: self.gridSize)
        for i in 0..<self.gridSize
        {
            self.onBoard[0][i] = String("#")
        }
        for i in 0..<self.gridSize
        {
            self.onBoard[self.gridSize-1][i] = "#"
        }
        for i in 0..<self.gridSize
        {
            self.onBoard[i][0] = "#"
        }
        for i in 0..<self.gridSize
        {
            self.onBoard[i][self.gridSize-1] = "#"
        }
    }
    
    func joinServer(_ joinCode: String) -> Bool
    {
        // try to join the server if it works return true else false
        return false
    }
    
    func send(_ message: String)
    {
        
    }
    
    func dropTile(_ index: Int)
    {
        let tileToDrop = self.inHand[index]
        self.inHand.remove(at: index)
        send(tileToDrop)
    }
    
    func toBoard(_ index: Int, _ newLocationX: Int, _ newLocationY: Int) -> Bool
    {
        if onBoard[newLocationX][newLocationY] != "@"
        {
            let tileToBoard = self.inHand[index]
            self.inHand.remove(at: index)
            self.onBoard[newLocationX][newLocationY] = tileToBoard
            return true
        }
        else
        {
            return false
        }
    }
    
    func toHand(_ tileLocationX: Int, _ tileLocationY: Int)
    {
        let tileToHand = self.onBoard[tileLocationX][tileLocationY]
        self.onBoard[tileLocationX][tileLocationY] = "@"
        self.inHand.append(tileToHand)
    }
    
    func callSplit() -> Bool
    {
        var tilesInPlay = 0
        var tilesCounted = 0
        var lastIndex = [0, 0]
        var filledBoard: [[Int]] = []
        for i in 1..<self.gridSize-1
        {
            var row = [Int]()
            for j in 1..<self.gridSize-1
            {
                if (self.onBoard[i][j] != "@")
                {
                    row.append(1)
                    tilesInPlay += 1
                    lastIndex[0] = i
                    lastIndex[1] = j
                }
                else
                {
                    row.append(0)
                }
            }
            filledBoard.append(row)
        }
        func floodFill(_ x: Int, _ y: Int)
        {
            if 0 < x && x < filledBoard.count && 0 < y && y < filledBoard.count && filledBoard[x][y] == 1
            {
                filledBoard[x][y] = 2
                tilesCounted += 1
                floodFill(x-1, y)
                floodFill(x+1, y)
                floodFill(x, y-1)
                floodFill(x, y+1)
            }
        }
        floodFill(lastIndex[0] - 1, lastIndex[1] - 1)
        if tilesCounted != tilesInPlay
        {
            return false
        }
        
        if self.inHand.count != 0
        {
            return false
        }
        
        var wordsArray = [String]()
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
                    if (self.onBoard[i-1][j] == "@")
                    {
                        var word = self.onBoard[i][j]
                        for k in 1...gridSize
                        {
                            if self.onBoard[i+k][j] == "@" || self.onBoard[i+k][j] == "#"
                            {
                                break
                            }
                            else
                            {
                                word.append(self.onBoard[i+k][j])
                            }
                        }
                        wordsArray.append(word)
                    }
                    if (self.onBoard[i][j-1] == "@")
                    {
                        var word = self.onBoard[i][j]
                        for k in 1...gridSize
                        {
                            if self.onBoard[i][j+k] == "@" || self.onBoard[i][j+k] == "#"
                            {
                                break
                            }
                            else
                            {
                                word.append(self.onBoard[i][j+k])
                            }
                        }
                        wordsArray.append(word)
                    }
                }
            }
        }
        let filtered = wordsArray.filter { word in
          return word.count != 1
        }
        
        func isReal(_ word: String) -> Bool {
            let word = word.lowercased()
            let checker = UITextChecker()
            let range = NSRange(location: 0, length: word.utf16.count)
            let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
            // print(word + String(misspelledRange.location == NSNotFound))

            return misspelledRange.location == NSNotFound
        }
        
        for word in filtered
        {
            if (word.count == 2)
            {
                return false
            }
            if isReal(word) == false
            {
                return false
            }
        }
        return true
    }
}
