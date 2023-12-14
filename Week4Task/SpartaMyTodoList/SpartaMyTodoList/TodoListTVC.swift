//
//  TableViewCell.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2023/12/11.
//

import UIKit
import SnapKit
class TodoListTVC: UITableViewCell {
    static let identi = "TodoListTVCid"
    private lazy var upperStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private lazy var finishedSegmentControl : UISegmentedControl = {
        let control = UISegmentedControl(items: ["완료","미완료"])
        control.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        return control
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
        setAutoLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
extension TodoListTVC{
    func addContentView(){
        contentView.addSubview(upperStackView)
        upperStackView.addArrangedSubview(titleLabel)
        upperStackView.addArrangedSubview(finishedSegmentControl)
    }
    func setAutoLayout(){
        upperStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
        }
        finishedSegmentControl.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
    }
    func setTodoList(_ model : TodoList){
        titleLabel.text = model.title
    }
    @objc private func changeValue(segment : UISegmentedControl){
        let attributedString = NSMutableAttributedString(string: titleLabel.text!)
    
        if segment.selectedSegmentIndex == 0{
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle,value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributedString.length))
            titleLabel.attributedText = attributedString
        }else{
            titleLabel.attributedText = attributedString
        }
    }
}
