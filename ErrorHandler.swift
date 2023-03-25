//
//  ErrorHandler.swift
//  pedlr
//
//  Created by Connor Filipiak on 3/8/23.
//

import Foundation

enum ErrorHandler: Error {
    case badURL
    case badServerResponse
    case invalidRequest
}

// add in error handling
