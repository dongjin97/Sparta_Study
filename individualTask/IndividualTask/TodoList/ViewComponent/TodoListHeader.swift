//
//  TodoListHeader.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/08.
//

import UIKit
import SnapKit
class TodoListHeader: UITableViewHeaderFooterView {
    static let identi = "TodoListHeaderid"
    private lazy var categoryLabel : UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .left
        return label
    }()
   
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setAddView()
        setAutoLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
extension TodoListHeader{
    private func setAddView(){
        addSubview(categoryLabel)
    }
    private func setAutoLayout(){
        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    func setCategoty(model : String){
        categoryLabel.text = model
    }
}
