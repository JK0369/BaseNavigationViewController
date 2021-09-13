//
//  ViewController2.swift
//  NaviEx
//
//  Created by 김종권 on 2021/09/10.
//

import UIKit

class ViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.leftBarButtonItems = BaseNavigationController.getCustomBarButtonItems(isShowBackButton: true,
                                                                                             labelText: "커스텀 타이틀")
    }
}
