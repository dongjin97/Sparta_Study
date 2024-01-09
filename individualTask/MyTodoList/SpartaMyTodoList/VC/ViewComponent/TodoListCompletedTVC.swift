//
//  TodoListCompletedTVC.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/09.
//

import UIKit

class TodoListCompletedTVC: UITableViewCell {
    static let identi = "TodoListCompletedTVCid"
    private lazy var upperStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 1
        return stackView
    }()
    private lazy var titleLabel : UILabel = { // 할일 Label
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        return label
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

        // Configure the view for the selected state
    }

}
extension TodoListCompletedTVC{
    private func addContentView(){ // UI추가
        contentView.addSubview(upperStackView)
        upperStackView.addArrangedSubview(titleLabel)
        upperStackView.addArrangedSubview(dateLabel)
        
    }
    private func setAutoLayout(){ // 오토레이아웃 설정
        upperStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
        }
        titleLabel.setContentHuggingPriority(.init(rawValue: 700), for: .horizontal)
        dateLabel.setContentHuggingPriority(.init(750), for: .horizontal)
    }
    func setTodoList(model : TodoListContentComplted){
        self.titleLabel.text = model.title
        self.dateLabel.text = model.date.changeString()
    }
}
