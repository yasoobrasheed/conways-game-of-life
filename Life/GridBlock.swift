//
//  GridBlock.swift
//  Life
//
//  Created by Yasoob Rasheed on 5/2/18.
//  Copyright © 2018 Yasoob Rasheed. All rights reserved.
//

import Foundation
import UIKit

class GridBlock: UIView {
    
    let grid: Grid!
    
    init(frame: CGRect, grid: Grid) {
        self.grid = grid
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkUp() -> Bool {
        if 0 < self.getIndex().1 {
            return true
        }
        return false
    }
    
    func checkDown() -> Bool {
        if self.getIndex().1 < 9 {
            return true
        }
        return false
    }
    
    func checkLeft() -> Bool {
        if 0 < self.getIndex().0 {
            return true
        }
        return false
    }
    
    func checkRight() -> Bool {
        if self.getIndex().0 < 9 {
            return true
        }
        return false
    }
    
    func checkUpLeft() -> Bool {
        if 0 < self.getIndex().1 && 0 < self.getIndex().0 {
            return true
        }
        return false
    }
    
    func checkUpRight() -> Bool {
        if 0 < self.getIndex().1 && self.getIndex().0 < 9 {
            return true
        }
        return false
    }
    
    func checkDownLeft() -> Bool {
        if self.getIndex().1 < 9 && 0 < self.getIndex().0 {
            return true
        }
        return false
    }
    
    func checkDownRight() -> Bool {
        if self.getIndex().1 < 9 && self.getIndex().0 < 9 {
            return true
        }
        return false
    }
    
    func createSurroundingsArray() -> [GridBlock] {
        var surroundingsArray = [GridBlock]()
        if checkUp() {
            surroundingsArray.append(self.grid.gridArray[self.getIndex().0][self.getIndex().1 - 1])
        }
        if checkDown() {
            surroundingsArray.append(self.grid.gridArray[self.getIndex().0][self.getIndex().1 + 1])
        }
        if checkLeft() {
            surroundingsArray.append(self.grid.gridArray[self.getIndex().0 - 1][self.getIndex().1])
        }
        if checkRight() {
            surroundingsArray.append(self.grid.gridArray[self.getIndex().0 + 1][self.getIndex().1])
        }
        if checkUpLeft() {
            surroundingsArray.append(self.grid.gridArray[self.getIndex().0 - 1][self.getIndex().1 - 1])
        }
        if checkUpRight() {
            surroundingsArray.append(self.grid.gridArray[self.getIndex().0 + 1][self.getIndex().1 - 1])
        }
        if checkDownLeft() {
            surroundingsArray.append(self.grid.gridArray[self.getIndex().0 - 1][self.getIndex().1 + 1])
        }
        if checkDownRight() {
            surroundingsArray.append(self.grid.gridArray[self.getIndex().0 + 1][self.getIndex().1 + 1])
        }
        return surroundingsArray
    }
    
    func getLiveNeighbors() -> Int {
        var count = 0
        for block in self.createSurroundingsArray() {
            if block.backgroundColor == UIColor.black {
                count += 1
            }
        }
        return count
    }
    
    func applyRulesToGridBlock() {
        /// 1. Any live cell with fewer than two live neighbours dies
        /// 2. Any live cell with two or three live neighbours lives on to the next generation
        /// 3. Any live cell with more than three live neighbours dies
        if self.backgroundColor == UIColor.black {
            if getLiveNeighbors() < 2 || 3 < getLiveNeighbors() {
                self.backgroundColor = UIColor.white
            }
        }
        /// 4. Any dead cell with exactly three live neighbours becomes a live cell
        if self.backgroundColor == UIColor.white {
            if getLiveNeighbors() == 3 {
                self.backgroundColor = UIColor.black
            }
        }
    }
    
    func getIndex() -> (Int, Int) {
        var x = Int()
        var y = Int()
        for i in 0...self.grid.num_rows() - 1 {
            for j in 0...self.grid.num_columns() - 1 {
                if self == self.grid.gridArray[i][j] {
                    x = i
                    y = j
                }
            }
        }
        return (x, y)
    }
}
