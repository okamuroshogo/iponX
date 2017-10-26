//
//  ViewController.swift
//  iponX
//
//  Created by okamuro-shogo on 2017/10/25.
//  Copyright © 2017年 okamuro-shogo. All rights reserved.
//

import UIKit
import Foundation
import SafariServices

final class ViewController: UIViewController {
    @IBOutlet private weak var iponEdge: UIImageView!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    let safari = SFSafariViewController(url: URL(string: "https://www.google.com")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edge()
        self.time()
        self.addChildViewController(self.safari)
        self.contentView.addSubview(self.safari.view)
        self.safari.view.backgroundColor = .black
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.safari.view.frame = self.contentView.bounds
    }
    
    private func time() {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        self.timeLabel.text = formatter.string(from: now)
    }
    
    private func edge() {
        let isX: Bool = {
            guard #available(iOS 11.0, *),
                UIDevice().userInterfaceIdiom == .phone else {
                    return false
            }
            let nativeSize = UIScreen.main.nativeBounds.size
            let (w, h) = (nativeSize.width, nativeSize.height)
            let (d1, d2): (CGFloat, CGFloat) = (1125.0, 2436.0)
            return (w == d1 && h == d2) || (w == d2 && h == d1)
        }()
        
        if isX {
            self.iponEdge.isHidden = true
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

