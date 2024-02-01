//
//  TodoListCollectionViewCell.swift
//  IndividualTask
//
//  Created by 원동진 on 1/31/24.
//

import UIKit
import SnapKit
class TaskCollectionViewCell: UICollectionViewCell {
    static let identi  = "TaskCollectionViewCellid"
    var tapSwitchClosure : ((Bool)->())?
    
    private lazy var uppserStackView : UIStackView = {
        let stackView = UIStackView()
         stackView.axis = .vertical
         stackView.alignment = .fill
         stackView.spacing = 10
         stackView.distribution = .fill
         return stackView
    }()
    private lazy var topStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private lazy var isCompletedSwitch : UISwitch = {
        let completedSwitch = UISwitch()
        completedSwitch.addTarget(self, action: #selector(clickSwitch(_ :)), for: .valueChanged)
        return completedSwitch
    }()
    private lazy var createDateLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private lazy var modifyDateLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellConfigure()
        setAddBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension TaskCollectionViewCell{
    @objc func clickSwitch(_ sender: UISwitch){
        tapSwitchClosure?(sender.isOn)
    }
    private func setAddBorder(){
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = 10
    }
    private func cellConfigure(){
        contentView.addSubViews([uppserStackView])
        uppserStackView.addStackSubViews([topStackView,createDateLabel,modifyDateLabel])
        topStackView.addStackSubViews([titleLabel,isCompletedSwitch])
        uppserStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        titleLabel.setContentHuggingPriority(.init(249), for: .horizontal)
        isCompletedSwitch.setContentHuggingPriority(.init(250), for: .horizontal)
        isCompletedSwitch.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        topStackView.setContentHuggingPriority(.init(249), for: .vertical)
        createDateLabel.setContentHuggingPriority(.init(250), for: .vertical)
        modifyDateLabel.setContentHuggingPriority(.init(250), for: .vertical)
        createDateLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        modifyDateLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    func setTaskCell(model : Task){
        titleLabel.text = model.title
        createDateLabel.text =  "생성 날짜 : " + (model.createDate?.changeString() ?? "날짜")
        modifyDateLabel.text = "수정 날짜 : " + (model.modifyData?.changeString() ?? "날짜")
        isCompletedSwitch.isOn = model.isCompleted
    }
}
