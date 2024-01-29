//
//  PictureCollectionViewCell.swift
//  IndividualTask
//
//  Created by 원동진 on 1/29/24.
//

import UIKit
import SnapKit
class PictureCollectionViewCell: UICollectionViewCell {
    static let identi = "PictureCollectionViewCellid"
    private lazy var pictureImageView : UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(pictureImageView)
        pictureImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setPictureImage(model : UIImage){
        pictureImageView.image = model
    }
}
