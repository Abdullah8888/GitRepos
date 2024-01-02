//
//  BaseView.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit
import RxSwift

class BaseView: UIView {

    let customNavHeight = Constant.statusBarFrameHeight + 55 + 20
    
    func setup(){
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }
    }

    func layout() {}
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clearAll() {
        subviews.forEach{ $0.removeFromSuperview() }
    }
}

class BaseCollectionView: UICollectionView {
    let disposeBag = DisposeBag()
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    public convenience init(direction: UICollectionView.ScrollDirection = .vertical){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = direction
        self.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .clear
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BaseCollectionViewCell: UICollectionViewCell {
    var disposeBag = DisposeBag()
    func setup(){
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BaseTableViewCell: UITableViewCell,
                              UITextFieldDelegate {
    
    var disposeBag = DisposeBag()
    func setup(){
        selectionStyle = .none
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

