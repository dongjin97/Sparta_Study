//
//  WishListViewController.swift
//  WishList
//
//  Created by 원동진 on 2024/01/05.
//

import UIKit
import CoreData
class WishListViewController: UIViewController {
    @IBOutlet weak var wishTableView: UITableView!
    var persistentContainer: NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    var id : Int64 = 0
    private var productList : [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getProductList()
        setTableView()
    }
}


extension WishListViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellid", for: indexPath) as? WishTableViewCell else { return UITableViewCell()}
        cell.setProduct(model: productList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.id = productList[indexPath.row].id
            deleteProdcutList()
            productList.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }
    
    
}
extension WishListViewController{
    private func setTableView(){
        wishTableView.dataSource = self
        wishTableView.delegate = self
    }
    private func getProductList(){
        guard let context = self.persistentContainer?.viewContext else {return}
        let request = Product.fetchRequest()
        if let getList = try? context.fetch(request){
            self.productList = getList
        }
    }
    private func deleteProdcutList(){
        guard let context = self.persistentContainer?.viewContext else { return }
        let request = Product.fetchRequest()
        guard let products = try? context.fetch(request) else { return }
        let filteredProducts = products.filter({ $0.id == id })
        for prodcut in filteredProducts {
            context.delete(prodcut)
        }
        try? context.save()
    }
}
