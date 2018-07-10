//
//  AllLinerTableDataStructure.swift
//  JoyOfDataSturctureApp
//
//  Created by Jashion on 2018/7/6.
//  Copyright © 2018 BMu. All rights reserved.
//

import UIKit

let MAXSIZE = 20

//线性表，比如：数组
struct ListTable<T: Equatable> {
    var data: [T] = Array()
    
    public func isEmpty() -> Bool {
        if data.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    public mutating func clearList() {
        data.removeAll()
    }
    
    public func getElem(index: Int) -> T? {
        if index >= data.count || index < 0 {
            return nil
        }
        return data[index]
    }
    
    public func locateElem(item: T) -> Int? {
        return data.index(of: item)
    }
    
    public mutating func append(item: T) {
        data.append(item)
    }
    
    public mutating func insert(item: T, index: Int) {
        guard index >= 0, index <= data.count else {
            return;
        }
        
        data.insert(item, at: index)
    }
    
    public mutating func delete(index: Int) -> T? {
        guard index >= 0, index < data.count else {
            return nil
        }
        
        let item = data[index]
        data.remove(at: index)
        return item
    }
    
    public func length() -> Int {
        return data.count
    }
}
