//
//  ViewController.swift
//  NaviEx
//
//  Created by 김종권 on 2021/09/10.
//

import UIKit

class ViewController: UIViewController {

    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음으로", for: .normal)
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray.withAlphaComponent(0.9)

        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    @objc private func didTapNextButton() {
        let viewController = ViewController2()
        navigationController?.pushViewController(viewController, animated: true)

    }
}
