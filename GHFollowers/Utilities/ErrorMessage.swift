//
//  ErrorMessages.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 2/3/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again"
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again"
    case invalidData        = "The data recieved from server was invalid. Please try again"
    
}
