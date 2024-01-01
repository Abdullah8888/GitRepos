//
//  OnbordingView.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

class OnboardingView: BaseView {
    
    let onboardingCell = String(describing: OnboardingCell.self)
    lazy var onboardingCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: onboardingCell)
        layout.scrollDirection = .horizontal
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 3 // Set the number of pages
        pageControl.currentPage = 0 // Set the initial page
        pageControl.pageIndicatorTintColor = .hexECEBED
        pageControl.currentPageIndicatorTintColor = .hexFFB400
        return pageControl
    }()
    
    let getStartedButton: Button = {
        let btn = Button(btnTitle: "Get Started", btnTextColor: .black, btnBackgroundColor: .hexFFB400, textFont: .nunitoSansRegular(size: 16))
        btn.constrainHeight(constant: 42)
        btn.cornerRadius = 12
        return btn
    }()
    
    var onboardingData: [OnbordingData]? {
        didSet {
            onboardingCollectionView.reloadData()
        }
    }
    
    override func setup() {
        super.setup()
        
        addSubviews(getStartedButton, pageControl, onboardingCollectionView)
        onboardingCollectionView.anchor()
        
        getStartedButton.anchor(leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: 30, bottom: 80, right: 30))
        
        pageControl.anchor(leading: leadingAnchor, bottom: getStartedButton.topAnchor, trailing: trailingAnchor, margin: .bottomOnly(40))
        
        onboardingCollectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: pageControl.topAnchor, trailing: trailingAnchor, margin: .bottomOnly(20))
        
    }
}

extension OnboardingView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onboardingData?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: onboardingCell, for: indexPath) as! OnboardingCell
        if let data = onboardingData?[indexPath.row] {
            cell.updateData(imageName: data.image, header: data.header, subHeader: data.subHeader)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("collectionView here is \(collectionView.frame), \(collectionView.bounds)")
        print("collectionView2 here is \(onboardingCollectionView.frame), \(onboardingCollectionView.bounds)")
        let bounds = collectionView.bounds;
        return CGSize(width: bounds.width,height: bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
