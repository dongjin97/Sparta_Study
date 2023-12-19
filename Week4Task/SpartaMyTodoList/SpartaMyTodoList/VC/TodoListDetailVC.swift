//
//  TodoListDetailVC.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2023/12/19.
//

import UIKit
import SnapKit
import PhotosUI
class TodoListDetailVC: UIViewController {
    var detailTitle : String?
    var detailImage : UIImage?
    var detailContents : String?
    var idx = 0
    var textViewPlaceHolder = "메모장 입니다."
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = detailTitle
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    private lazy var imgView : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(systemName: "plus.app.fill")
        imgView.tintColor = .gray
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchAddPhoto))
        imgView.addGestureRecognizer(tapGesture)
        imgView.isUserInteractionEnabled = true
        return imgView
    }()
    private lazy var imgTextLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "사진을 추가하세요"
        label.textAlignment = .center
        return label
    }()
    private lazy var contentTextView : UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.text = textViewPlaceHolder
        textView.textColor = .darkGray
        textView.delegate = self
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubViews()
        setAutoLayout()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        testData[idx].img = imgView.image
        testData[idx].contents = contentTextView.text
    }
}
extension TodoListDetailVC{
    private func addSubViews(){
        self.view.addSubview(titleLabel)
        self.view.addSubview(imgView)
        self.view.addSubview(contentTextView)
        imgView.addSubview(imgTextLabel)
    }
    private func setAutoLayout(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        imgView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(150)
        }
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        imgTextLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            
        }
    }
    @objc func touchAddPhoto(){
        var phpConfiguration = PHPickerConfiguration()
        phpConfiguration.selectionLimit = 1
        phpConfiguration.filter = .all(of: [.images])
        let picker = PHPickerViewController(configuration: phpConfiguration)
        picker.delegate = self
        self.present(picker, animated: true)
    }
    func setImage(image : UIImage?){
        imgView.image = image
        if image != UIImage(systemName: "plus.app.fill"){
            imgTextLabel.isHidden = true
        }
    }
    func setTextView(content : String?){
        contentTextView.text = content
    }
}
extension TodoListDetailVC : PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    self.imgTextLabel.isHidden = true
                    self.imgView.image = image as? UIImage
                }
               
            }
        }
    }
}
extension TodoListDetailVC : UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView){
    
        if textView.text == textViewPlaceHolder{
            textView.text = nil
            textView.textColor = .black
        }else{
            textView.textColor = .black
        }
    }
}
