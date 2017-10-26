//
//  UIViewExtension.swift
//  iponX
//
//  Created by okamuro-shogo on 2017/10/25.
//  Copyright © 2017年 okamuro-shogo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /**
     上部の枠線の色を変更
     - Parameters:
     - color: 枠線色
     - width: 枠線の太さ
     */
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    /**
     右の枠線の色を変更
     - Parameters:
     - color: 枠線色
     - width: 枠線の太さ
     */
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    /**
     左の枠線の色を変更
     - Parameters:
     - color: 枠線色
     - width: 枠線の太さ
     */
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    /**
     下部の枠線の色を変更
     - Parameters:
     - color: 枠線色
     - width: 枠線の太さ
     */
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}
extension UIView {
    /**
     丸角を調整できるようにする
     */
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    
    /**
     枠線を調整できるようにする
     */
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    /**
     枠線の色を変更できるようにする
     */
    @IBInspectable
    var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
}

