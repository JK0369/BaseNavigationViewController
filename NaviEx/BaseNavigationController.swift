//
//  BaseNavigationController.swift
//  NaviEx
//
//  Created by 김종권 on 2021/09/10.
//

import UIKit

class BaseNavigationController: UINavigationController {

    static func makeNavigationController(rootViewController: UIViewController) -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: rootViewController)
        navigationController.modalPresentationStyle = .fullScreen

        return navigationController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBarAppearance()
    }

    private var backButtonImage: UIImage? {
        return UIImage(named: "button")?.withAlignmentRectInsets(UIEdgeInsets(top: 0.0, left: -12.0, bottom: -5.0, right: 0.0))
    }

    private var backButtonAppearance: UIBarButtonItemAppearance {
        let backButtonAppearance = UIBarButtonItemAppearance()
        // backButton하단에 표출되는 text를 안보이게 설정
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]

        return backButtonAppearance
    }

    private func setNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .gray
        appearance.shadowColor = .clear
        /// transitionMaskImage파라미터: push되거나 pop될때의 backButton 마스크 이미지
        appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
//        appearance.backButtonAppearance = backButtonAppearance
        /// bacbutton은 navigationItem.hidesBackButton으로 사라지게 사용 가능
//        navigationItem.hidesBackButton = false

        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.isTranslucent = false
        /// navigationItem의 버튼 색상을 .white로 지정
        navigationBar.tintColor = .white
    }
    
}
