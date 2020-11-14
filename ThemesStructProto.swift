//
//  ThemeOne.swift
//  UIThemesUI
//
//  Created by Jerry Ren on 11/13/20.
//

import Foundation

import UIKit

protocol ThemesCollectionProtocol {
    static var bgmColorOfView: UIColor? { get }
    static var txtColorOfBtn: UIColor? { get set }
    static var bgdColorOfBtn: UIColor? { get set }
}

struct CollectionOfThemes: ThemesCollectionProtocol {

    static var bgmColorOfView: UIColor?
    static var txtColorOfBtn: UIColor?
    static var bgdColorOfBtn: UIColor?
        
    static func displayImplementation() {
        var delegatedButton = UIButton.appearance()
        var delegatedView = UIView.appearance()
        
        delegatedButton.backgroundColor = CollectionOfThemes.bgdColorOfBtn
        delegatedView.backgroundColor = bgmColorOfView
        delegatedButton.setTitleColor(CollectionOfThemes.txtColorOfBtn, for: .normal)
    }

    static func aquaMode() {
        self.bgmColorOfView = UIColor.lightGray
        self.txtColorOfBtn = UIColor.systemTeal
        self.bgdColorOfBtn = UIColor.darkGray
        displayImplementation()
    }

    static func darkMode() {
        self.bgmColorOfView = UIColor.darkGray
        self.txtColorOfBtn = UIColor.white
        self.bgdColorOfBtn = UIColor.black
        displayImplementation()
    }
}
