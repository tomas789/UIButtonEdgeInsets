//
//  ViewController.swift
//  UIButtonEdgeInsets
//
//  Created by Tomas Krejci on 1/23/17.
//  Copyright © 2017 Tomas Krejci. All rights reserved.
//

import UIKit

enum Insets {
    case content
    case title
    case image
}

class ViewController: UIViewController {
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var topValueLabel: UILabel!
    @IBOutlet weak var topValueStepper: UIStepper!
    @IBOutlet weak var leftValueLabel: UILabel!
    @IBOutlet weak var leftValueStepper: UIStepper!
    @IBOutlet weak var bottomValueLabel: UILabel!
    @IBOutlet weak var bottomValueStepper: UIStepper!
    @IBOutlet weak var rightValueLabel: UILabel!
    @IBOutlet weak var rightValueStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        insetsType = .content

        testButton.layer.borderColor = UIColor.blue.cgColor
        testButton.layer.borderWidth = 1
        testButton.imageView?.layer.borderColor = UIColor.green.cgColor
        testButton.imageView?.layer.borderWidth = 1
        testButton.titleLabel?.layer.borderColor = UIColor.red.cgColor
        testButton.titleLabel?.layer.borderWidth = 1
    }

    var insetsType: Insets = .content {
        didSet {
            switch insetsType {
            case .content: insetsValue = testButton.contentEdgeInsets
            case .title: insetsValue = testButton.titleEdgeInsets
            case .image: insetsValue = testButton.imageEdgeInsets
            }
        }
    }

    var insetsValue: UIEdgeInsets! {
        didSet {
            topValueLabel.text = "\(insetsValue.top)"
            topValueStepper.value = Double(insetsValue.top)
            leftValueLabel.text = "\(insetsValue.left)"
            leftValueStepper.value = Double(insetsValue.left)
            bottomValueLabel.text = "\(insetsValue.bottom)"
            bottomValueStepper.value = Double(insetsValue.bottom)
            rightValueLabel.text = "\(insetsValue.right)"
            rightValueStepper.value = Double(insetsValue.right)

            switch insetsType {
            case .content: testButton.contentEdgeInsets = insetsValue
            case .title: testButton.titleEdgeInsets = insetsValue
            case .image: testButton.imageEdgeInsets = insetsValue
            }
        }
    }

    @IBAction func insetsChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: insetsType = .content
        case 1: insetsType = .title
        case 2: insetsType = .image
        default: fatalError("Unexpected selectedSegmentIndex")
        }
    }

    @IBAction func topInsetValueChanged(_ sender: UIStepper) {
        insetsValue.top = CGFloat(sender.value)
    }

    @IBAction func leftInsetValueChanged(_ sender: UIStepper) {
        insetsValue.left = CGFloat(sender.value)
    }

    @IBAction func bottomInsetValueChanged(_ sender: UIStepper) {
        insetsValue.bottom = CGFloat(sender.value)
    }

    @IBAction func rightInsetValueChanged(_ sender: UIStepper) {
        insetsValue.right = CGFloat(sender.value)
    }
}

