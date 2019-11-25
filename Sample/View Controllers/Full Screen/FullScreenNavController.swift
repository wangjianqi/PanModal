//
//  FullScreenNavController.swift
//  PanModalDemo
//
//  Created by Stephen Sowole on 5/2/19.
//  Copyright © 2019 Detail. All rights reserved.
//

import UIKit
//导航栏
class FullScreenNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        pushViewController(FullScreenViewController(), animated: false)
    }
}

extension FullScreenNavController: PanModalPresentable {

    var panScrollable: UIScrollView? {
        return nil
    }

    var topOffset: CGFloat {
        return 0.0
    }

    var springDamping: CGFloat {
        return 1.0
    }

    var transitionDuration: Double {
        return 0.4
    }

    var transitionAnimationOptions: UIView.AnimationOptions {
        return [.allowUserInteraction, .beginFromCurrentState]
    }

    var shouldRoundTopCorners: Bool {
        return false
    }

    var showDragIndicator: Bool {
        return false
    }
}

private class FullScreenViewController: UIViewController {

    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Drag downwards to dismiss"
        label.font = UIFont(name: "Lato-Bold", size: 17)
        //禁用转换布局
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Full Screen"
        view.backgroundColor = .white
        setupConstraints()
    }

    private func setupConstraints() {
        view.addSubview(textLabel)
        //x轴
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //y轴
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}
