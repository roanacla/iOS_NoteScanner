//
//  TextUtils.swift
//  NoteScanner
//
//  Created by Roger Navarro on 5/3/20.
//  Copyright © 2020 Sheetal . All rights reserved.
//

import Foundation

class TextUtils {
    static var titleLenght = 50
    
    static func generateTitle(_ word: String) -> String {
        let lines = word.components(separatedBy: .newlines)
        if lines.count >= 1 {
            return String(lines[0].prefix(titleLenght))
        } else {
            return String(word.prefix(titleLenght))
        }
    }
}
