//
//  UINavigationControllerExtension.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/18/24.
//

import SwiftUI

/// SwiftUI disables the pop gesture when hiding the back button. This extension will enables us to hide the back button without losing the pop gesture.
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
