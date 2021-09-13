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

    private static let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "button"), for: .normal)

        return button
    }()

    private static let paddingBarButtonItem: UIBarButtonItem = {
        let spaceBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spaceBarButtonItem.width = 32.0 /// 32.0만큼 왼쪽 버튼과 여백

        return spaceBarButtonItem
    }()

    private static let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left

        return label
    }()

    static func getCustomBarButtonItems(isShowBackButton: Bool, labelText: String) -> [UIBarButtonItem] {

        var barButtonItems = [UIBarButtonItem]()

        if isShowBackButton {
            let backButtonItem = UIBarButtonItem(customView: backButton)
            barButtonItems.append(backButtonItem)
            barButtonItems.append(paddingBarButtonItem)
        }
        titleLabel.text = labelText
        let labelBarButtonItem = UIBarButtonItem(customView: titleLabel)
        barButtonItems.append(labelBarButtonItem)

        return barButtonItems
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
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear, .font: UIFont.systemFont(ofSize: 0.0)]

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
