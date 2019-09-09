//
//  LoadingView.swift
//  StyleKit
//
//  Created by Chrystian Salgado on 07/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

public class LoadingView {
    
    let indicator: UIActivityIndicatorView?
    private var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
    
    public init(color: UIColor = .gray) {
        indicator = UIActivityIndicatorView()
        indicator?.color = color
        indicator?.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator?.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        guard let window = UIApplication.shared.keyWindow else { return }
        indicator?.center = window.center
    }
    
    /// Display Loading in screen
    public func showLoading(in view: UIView) {
        guard indicator != nil else { return }
        
        visualEffectView.frame = view.frame
        visualEffectView.contentView.addSubview(indicator!)
        view.addSubview(visualEffectView)
        
        visualEffectView.bringSubviewToFront(view)
        indicator?.bringSubviewToFront(visualEffectView.contentView)
        indicator?.startAnimating()
    }
    
    /// Remove Loading from screen
    public func dismissLoading() {
        indicator?.stopAnimating()
        visualEffectView.removeFromSuperview()
        indicator?.removeFromSuperview()
    }
}
