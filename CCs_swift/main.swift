//
//  main.swift
//  CCs_swift
//
//  Created by 成沢淳史 on 6/7/16.
//  Copyright © 2016 成沢淳史. All rights reserved.
//

import Foundation

let Arr : [Int] = [ 1,1,0,0,0,0,
                    1,1,0,0,0,0,
                    0,0,0,1,1,0,
                    0,1,0,1,0,0,
                    0,1,0,0,0,0]




class CCs {
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    var matrix : [Int]
    var height : Int
    var width : Int
    var label : [Int]
    
    init(matrix: [Int], shape : [Int]) {
        self.matrix = matrix 
        self.height = shape[0]
        self.width = shape[1]
        self.label = [Int](count: height * width, repeatedValue: -1)
    }
    
    func dfs(x: Int, y: Int, _label: Int) {
        let id : Int = width * y + x
        
        if (x < 0 || x >= self.width) {
            return 
        }
        
        if (y < 0 || y >= self.height) {
            return
        }
        
        // すでにラベルが付けられている もしくは True が付いていない
        if (self.label[id] != -1 || self.matrix[id] != 1) {
            return
        }
        
        self.label[id] = _label
        
        for i in 0..<4 {
            dfs(x + self.dx[i], y: y + self.dy[i], _label: _label)
        }
        
    }
    
    func search() -> ([Int], Int) {
        var count : Int = 0
        for y in 0..<self.height {
            for x in 0..<self.width {
                let id = self.width * y + x
                if (self.matrix[id] == 1 && self.label[id] == -1) {
                    dfs(x, y: y, _label: count)
                    count = count + 1
                }
            }
        }
        return (self.label, count)
    }
}

let shape : [Int] = [5, 6]
let cc = CCs(matrix: Arr, shape: shape)
let (label, nlabel) = cc.search()
print(label)
print("nlabel : \(nlabel)")
