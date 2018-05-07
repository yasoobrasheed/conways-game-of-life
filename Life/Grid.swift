//
//  Grid.swift
//  Life
//
//  Created by Yasoob Rasheed on 5/2/18.
//  Copyright © 2018 Yasoob Rasheed. All rights reserved.
//

import Foundation
import UIKit

class Grid {
    
    var gridArray = [[GridBlock]]()
    
    init(width: CGFloat, height: CGFloat, view: UIView) {
        createGrid(width: width, height: height, view: view)
        randomizeGrid()
    }
    
    func createGrid(width: CGFloat, height: CGFloat, view: UIView) {
        var gridColumn = [GridBlock]()
        
        for i in 0...9 {
            for j in 0...9 {
                let gridBlock = GridBlock(frame: CGRect(x: width / 10 * CGFloat(i), y: height / 2 - width / 2 + width / 10 * CGFloat(j), width: width / 10, height: width / 10), grid: self)
                view.addSubview(gridBlock)
                gridColumn.append(gridBlock)
            }
            gridArray.append(gridColumn)
            gridColumn.removeAll()
        }
    }
    
    func randomizeGrid() {
        for i in 0...9 {
            for j in 0...9 {
                let random = arc4random_uniform(4)
                if random == 1 {
                    gridArray[i][j].backgroundColor = UIColor.black
                }
            }
        }
    }
    
    func num_rows() -> Int {
        return gridArray.count
    }
    
    func num_columns() -> Int {
        return gridArray[0].count
    }
}
