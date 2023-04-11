//
//  SortView.swift
//  CRM C
//
//  Created by guhan-pt6208 on 11/04/23.
//

import UIKit

//class SegmentedStackView: UIStackView {
//
//    let allButton = UIButton()
//    let breakfastButton = UIButton()
//    let lunchButton = UIButton()
//    let dinnerButton = UIButton()
//    var buttons: [UIButton] {
//        return [allButton, breakfastButton, lunchButton, dinnerButton]
//    }
//    var selectedButton: UIButton?
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//
//    required init(coder: NSCoder) {
//        super.init(coder: coder)
//        setup()
//    }
//
//    private func setup() {
//        axis = .horizontal
//        distribution = .fillEqually
//        alignment = .fill
//        spacing = 3
//
//        allButton.setTitle("All", for: .normal)
////        allButton.setTitleColor(.black, for: .normal)
////        allButton.setTitleColor(.systemYellow, for: .selected)
//        breakfastButton.setTitle("Breakfast", for: .normal)
////        breakfastButton.setTitleColor(.black, for: .normal)
////        breakfastButton.setTitleColor(.systemYellow, for: .selected)
//        lunchButton.setTitle("Lunch", for: .normal)
////        lunchButton.setTitleColor(.black, for: .normal)
////        lunchButton.setTitleColor(.systemYellow, for: .selected)
//        dinnerButton.setTitle("Dinner", for: .normal)
////        dinnerButton.setTitleColor(.black, for: .normal)
////        dinnerButton.setTitleColor(.systemYellow, for: .selected)
//
//
//        for button in buttons {
//            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
//            button.setTitleColor(.label, for: .normal)
//            button.setTitleColor(.systemYellow, for: .selected)
//        }
//
//        addArrangedSubview(allButton)
//        addArrangedSubview(breakfastButton)
//        addArrangedSubview(lunchButton)
//        addArrangedSubview(dinnerButton)
//    }
//
//    @objc func buttonTapped(_ sender: UIButton) {
//        // Deselect all buttons except for the selected button
//        for button in [allButton, breakfastButton, lunchButton, dinnerButton] {
//            button.isSelected = false
//
//            for subview in button.subviews where subview.tag == 100 {
//                subview.removeFromSuperview()
//            }
//
//        }
//        sender.isSelected = true
//
//        // Add dot view below the selected button
//        let dotSize = CGSize(width: 10, height: 5)
//        let dotView = UIView(frame: CGRect(origin: .zero, size: dotSize))
//        dotView.tag = 100
//        dotView.layer.cornerRadius = 3
//        dotView.backgroundColor = .label
//        dotView.translatesAutoresizingMaskIntoConstraints = false
//        sender.addSubview(dotView)
//        NSLayoutConstraint.activate([
//            dotView.widthAnchor.constraint(equalToConstant: dotSize.width),
//            dotView.heightAnchor.constraint(equalToConstant: dotSize.height),
//            dotView.centerXAnchor.constraint(equalTo: sender.centerXAnchor),
//            dotView.topAnchor.constraint(equalTo: sender.titleLabel!.bottomAnchor, constant: 3)
//        ])
//    }
//
//
//
//    private func previousButtonColor(for button: UIButton) -> UIColor? {
//        if button == allButton {
//            return UIColor.black
//        } else if button == breakfastButton {
//            return UIColor.black
//        } else if button == lunchButton {
//            return UIColor.black
//        } else if button == dinnerButton {
//            return UIColor.black
//        } else {
//            return nil
//        }
//    }
//}

class SegmentedStackView: UIStackView {
    
    let allLabel = UILabel()
    let breakfastLabel = UILabel()
    let lunchLabel = UILabel()
    let dinnerLabel = UILabel()
    var labels: [UILabel] {
        return [allLabel, breakfastLabel, lunchLabel, dinnerLabel]
    }
    var selectedLabel: UILabel?
    
    var data: [String]? {
        didSet {
            // Update the labels with the new data
            guard let data = data else { return }
            allLabel.text = "All (\(data.count))"
            breakfastLabel.text = "Breakfast (\(data.filter({ $0 == "Breakfast" }).count))"
            lunchLabel.text = "Lunch (\(data.filter({ $0 == "Lunch" }).count))"
            dinnerLabel.text = "Dinner (\(data.filter({ $0 == "Dinner" }).count))"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        axis = .horizontal
        distribution = .fillEqually
        alignment = .fill
        spacing = 3
        
        allLabel.text = "All"
        breakfastLabel.text = "Breakfast"
        lunchLabel.text = "Lunch"
        dinnerLabel.text = "Dinner"
        
        for label in labels {
            label.isUserInteractionEnabled = true
            label.textAlignment = .center
            label.textColor = .label
            label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.5
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
            label.addGestureRecognizer(tapGesture)
        }
        addArrangedSubview(allLabel)
        addArrangedSubview(breakfastLabel)
        addArrangedSubview(lunchLabel)
        addArrangedSubview(dinnerLabel)
        
        selectedLabel = allLabel
        allLabel.textColor = .systemBackground
        allLabel.backgroundColor = .systemYellow
        allLabel.layer.cornerRadius = 12
        allLabel.layer.masksToBounds = true
    }
    
    @objc private func labelTapped(_ sender: UITapGestureRecognizer) {
        guard let selectedLabel = sender.view as? UILabel else { return }
        self.selectedLabel = selectedLabel
        
        // Deselect all labels except for the selected label
        for label in [allLabel, breakfastLabel, lunchLabel, dinnerLabel] {
            label.textColor = .label
            label.backgroundColor = .clear
        }
        selectedLabel.textColor = .systemBackground
        selectedLabel.backgroundColor = .systemYellow
        selectedLabel.layer.cornerRadius = 12
        selectedLabel.layer.masksToBounds = true

        
    }
}
