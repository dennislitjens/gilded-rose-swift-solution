//
//  QualityOperation.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

public enum QualityOperation {
    case degrades(with: Int)
    case increases(with: Int)
    case dropToZero
    case doesNotChange
}
