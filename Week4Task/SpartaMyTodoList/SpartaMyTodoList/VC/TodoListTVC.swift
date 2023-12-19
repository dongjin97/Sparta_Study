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
        
        // Configure the view for the selected state
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
    func setTodoList(_ model : TodoList){
        titleLabel.text = model.title
        let date = model.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        dateLabel.text = dateFormatter.string(from: date)
    }
    
    @objc private func tapCheckBoxBtn(_ sender : UIButton){
        sender.isSelected.toggle()
        let attributedStringTitle = NSMutableAttributedString(string: titleLabel.text!)
        let attributedStringDate = NSMutableAttributedString(string: dateLabel.text!)
        if sender.isSelected {
            sender.setImage(UIImage(named: "CheckBox"), for: .normal)
            [attributedStringTitle,attributedStringDate].forEach { attributedString in
                attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle,value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributedString.length))
            }
            titleLabel.attributedText = attributedStringTitle
            dateLabel.attributedText = attributedStringDate
        }else{
            sender.setImage(UIImage(named: "UnCheckBox"), for: .normal)
            titleLabel.attributedText = attributedStringTitle
            dateLabel.attributedText = attributedStringDate
        }
    }
    @objc private func tapPushBtn(){
        tapPushBtnClosure?()
    }
}
