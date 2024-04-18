//
//  Palette.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/15/24.
//

import SwiftUI

enum Palette: String {
    case background = "Background"
    case green = "TTRGreen"
    case gray = "TTRGray"
    case lightGray = "LightGray"
    case border = "Border"
    case red = "Red"
    case darkGray = "DarkGray"
    case disabled = "Disabled"
    var color: Color {
        Color(rawValue)
    }
}

//MARK: - ShapeStyle
extension Palette: ShapeStyle {
    func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        return color
            .resolve(in: environment)
    }
}
