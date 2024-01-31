//
//  ViewController.swift
//  WishList
//
//  Created by 원동진 on 2024/01/05.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var savBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var showBtn: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    private var currentProduct : RemoteProdcut? = nil {
        didSet {
            guard self.currentProduct != nil else {return}
        }
    }
    var persistentContainer: NSPersistentContainer? {
         (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtnUI()
        getProduct()
    }
    @IBAction func tapSaveWishList(_ sender: UIButton) {
        let alert = UIAlertController(title: "위시리스트 저장", message: "저장하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let confirm = UIAlertAction(title: "확인", style: .destructive){ (_) in
            self.saveWishProcut()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(confirm)
        alert.addAction(cancel)
        self.present(alert, animated: false)
    }
    @IBAction func tapSkipBtn(_ sender: UIButton) {
        getProduct()
    }
    @IBAction func tapPresentWishList(_ sender: UIButton) {
        guard let presentVC = self.storyboard?.instantiateViewController(identifier: "WishListViewController")  as? WishListViewController else {return}
        self.present(presentVC, animated: true)
    }
    
}
extension ViewController{
    private func getProduct(){
        GetDataService.shared.getProcudt { productData in
            self.currentProduct = productData
            DispatchQueue.main.async {
                self.imgView.image = nil
                self.productName.text = productData.title
                self.productDescription.text = productData.description
                self.productPrice.text = "\(productData.price)$"
            }
            print(productData.thumbnail)
            DispatchQueue.global().async { [weak self] in
                if let imgData = try? Data(contentsOf: productData.thumbnail), let image = UIImage(data: imgData){
                    DispatchQueue.main.async {
                        self?.imgView.image = image
                    }
                }
                
            }
        }
    }
    private func setBtnUI(){
        [savBtn,skipBtn,showBtn].forEach { btn in
            btn?.layer.cornerRadius = 10
            btn?.layer.masksToBounds = true
        }
    }
    private func saveWishProcut(){
        guard let context = self.persistentContainer?.viewContext else { return}
        guard let currentProduct = self.currentProduct else {return}
        let saveWishProduct = Product(context:context)
        saveWishProduct.id = Int64(currentProduct.id)
        saveWishProduct.title = currentProduct.title
        saveWishProduct.price = currentProduct.price
        try? context.save()
    }
}

