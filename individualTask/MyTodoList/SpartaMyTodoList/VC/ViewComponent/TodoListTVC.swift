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
    var tapCheckBtnClosure : ((Bool)->())?
    var tapUpdateBtnClosure : (()->())?
    var indexPathRow = 0
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
    
    private lazy var titleLabel : UILabel = { // 할일 Label
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    lazy var checkBoxBtn : UIButton = { // 체크박스 Btn
        let btn = UIButton()
        btn.setImage(UIImage(named: "UnCheckBox"), for: .normal)
        btn.addTarget(self, action: #selector(tapCheckBoxBtn(_ :)), for: .touchUpInside)
        return btn
    }()
    private lazy var updateBtn : UIButton = { // 수정 Btn
        let btn = UIButton()
        btn.setTitle("수정", for: .normal)
        btn.titleLabel?.textColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.backgroundColor = .lightGray
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(tapUpdatBtn), for: .touchUpInside)
        return btn
    }()
    private lazy var dateLabel : UILabel = { // 날짜 Btn
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
    override func prepareForReuse() { // Cell 재사용시 초기화 cell
        super.prepareForReuse()
        checkBoxBtn.setImage(UIImage(named: "UnCheckBox"), for: .normal)
        titleLabel.attributedText = NSMutableAttributedString(string: titleLabel.text!)
        dateLabel.attributedText = NSMutableAttributedString(string: dateLabel.text!)
    }
}
extension TodoListTVC{
    func addContentView(){ // UI추가
        contentView.addSubview(upperStackView)
        upperStackView.addArrangedSubview(innerStackView)
        upperStackView.addArrangedSubview(dateLabel)
        innerStackView.addArrangedSubview(checkBoxBtn)
        innerStackView.addArrangedSubview(titleLabel)
        innerStackView.addArrangedSubview(updateBtn)
    }
    func setAutoLayout(){ // 오토레이아웃 설정
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
        titleLabel.setContentHuggingPriority(.init(rawValue: 700), for: .horizontal)
        updateBtn.setContentHuggingPriority(.init(750), for: .horizontal)
    }

    func setTodoList(_ model : TodoListContent){ // 할일 Cell Data 설정
        titleLabel.text = model.title
        dateLabel.text = model.date.changeString()     // 현재 날짜 Date -> String format
        changeCheckBoxBtn(model.isCompleted)
    }
    func setIndexPath(_ model: Int){
        self.indexPathRow = model
    }
 
    private func changeCheckBoxBtn(_ selected : Bool){ // 선택여부에 따른 체크박스 UI변경
        if selected {
            checkBoxBtn.setImage(UIImage(named: "CheckBox"), for: .normal)
            titleLabel.attributedText = titleLabel.text?.strikeThroughString()
            dateLabel.attributedText = dateLabel.text?.strikeThroughString()
        }else{
            checkBoxBtn.setImage(UIImage(named: "UnCheckBox"), for: .normal)
            titleLabel.attributedText = NSMutableAttributedString(string: titleLabel.text!)
            dateLabel.attributedText = NSMutableAttributedString(string: dateLabel.text!)
        }
    }
    
    @objc private func tapCheckBoxBtn(_ sender : UIButton){ // TodoList 완료 & 미완료 체크박스 액션
        sender.isSelected.toggle()
        tapCheckBtnClosure?(sender.isSelected)
        changeCheckBoxBtn(sender.isSelected)
    }

    @objc private func tapUpdatBtn(){    // 수정 버튼
        tapUpdateBtnClosure?()
    }
}
