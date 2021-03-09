//
//  Note.swift
//  NoteScanner
//
//  Created by Roger Navarro on 5/2/20.
//  Copyright © 2020 Sheetal . All rights reserved.
//

import Foundation

struct Note : Codable {
    var id: String
    var userId = ""
    var title: String
    var text: String
    var editedTime: String
    var type: String
}
