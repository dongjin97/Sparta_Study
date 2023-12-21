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
    var tapPushBtnClosure : (()->())?
    private lazy var upperStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 1
        return stackView
    }()
    private lazy var innerStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private lazy var checkBoxBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "UnCheckBox"), for: .normal)
        btn.addTarget(self, action: #selector(tapCheckBoxBtn(_ :)), for: .touchUpInside)
        return btn
    }()
    private lazy var pushBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "PushBtn"), for: .normal)
        btn.addTarget(self, action: #selector(tapPushBtn), for: .touchUpInside)
        return btn
    }()
    private lazy var dateLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 15)
        return label
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
    }
}
extension TodoListTVC{
    func addContentView(){
        contentView.addSubview(upperStackView)
        upperStackView.addArrangedSubview(innerStackView)
        upperStackView.addArrangedSubview(dateLabel)
        innerStackView.addArrangedSubview(checkBoxBtn)
        innerStackView.addArrangedSubview(titleLabel)
        innerStackView.addArrangedSubview(pushBtn)
    }
    func setAutoLayout(){
        upperStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
        }
        checkBoxBtn.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
        checkBoxBtn.setContentHuggingPriority(.init(rawValue: 750), for: .horizontal)
        pushBtn.setContentHuggingPriority(.init(rawValue: 750), for: .horizontal)
        titleLabel.setContentHuggingPriority(.init(rawValue: 700), for: .horizontal)
    }
    // 현재 날짜 Date -> String format
    func setTodoList(_ model : TodoList){
        titleLabel.text = model.title
        dateLabel.text = model.date.changeString()
    }
    // TodoList 완료 & 미완료 체크박스
    @objc private func tapCheckBoxBtn(_ sender : UIButton){
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.setImage(UIImage(named: "CheckBox"), for: .normal)
            titleLabel.attributedText = titleLabel.text?.strikeThroughString()
            dateLabel.attributedText = dateLabel.text?.strikeThroughString()
        }else{
            sender.setImage(UIImage(named: "UnCheckBox"), for: .normal)
            titleLabel.attributedText = NSMutableAttributedString(string: titleLabel.text!)
            dateLabel.attributedText = NSMutableAttributedString(string: dateLabel.text!)
        }
    }
    @objc private func tapPushBtn(){
        tapPushBtnClosure?()
    }
}
