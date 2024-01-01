//
//  BaseController.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

class BaseController<SubView: UIView>: UIViewController {
    let _view: SubView
    
    private let loaderContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        return view
    }()
    
    private let activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView.init(style: .large)
        activity.startAnimating()
        return activity
    }()
    
    init(view: SubView = SubView()) {
        self._view = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = _view
        view.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}

extension BaseController {
    
    func showLoader() {
        guard let keyWindow = UIWindow.keyWindow else { return }
        if keyWindow.subviews.contains(loaderContainer) {
            return
        }
        keyWindow.addSubview(loaderContainer)
        loaderContainer.anchor(top: keyWindow.topAnchor, leading: keyWindow.leadingAnchor, bottom: keyWindow.bottomAnchor, trailing: keyWindow.trailingAnchor)
        keyWindow.bringSubviewToFront(loaderContainer)
        
        loaderContainer.addSubview(activity)
        activity.placeAtCenterOf(centerY: loaderContainer.centerYAnchor, centerX: loaderContainer.centerXAnchor)
    }
    
    func removeLoader() {
        DispatchQueue.main.async {
            self.loaderContainer.removeFromSuperview()
        }
    }
}
