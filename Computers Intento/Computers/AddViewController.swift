//
//  AddViewController.swift
//  Computers
//
//  Created by Giggs on 09/11/22.
//

import UIKit

class AddViewController: UIViewController {
    
    var listComputers = [Computer]()
    
    //let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IKDetailVC") as? IKDetailVC
//    let viewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Main") as! ViewController
    
    @IBOutlet weak var lbTitle: UITextField!
    @IBOutlet weak var lbPrice: UITextField!
    @IBOutlet weak var lbImage: UITextField!
    @IBOutlet weak var lbDescription: UITextField!
    @IBOutlet weak var progressActivity: UIActivityIndicatorView!
    @IBOutlet weak var lbQuantity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressActivity.hidesWhenStopped = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func bnSave(_ sender: Any) {
        progressActivity.startAnimating()
        
        let newComputer = NewComputer(title: lbTitle.text, price: Int(lbPrice.text!), image: lbImage.text, description: lbDescription.text, quantity: Int(lbQuantity.text!))
        
        NetworkingProvider.shared.postComputer(computer: newComputer) { [self] computer in
            self.progressActivity.stopAnimating()
            
//            //self.navigationController?.pushViewController(vc!, animated: true)
//            //self.navigationController?.pushViewController(viewController, animated: true)
//            self.navigationController?.pushViewController(viewController, animated: true)
//
//
//            //print(newComputer)
            
        } failure: { error in
            self.progressActivity.stopAnimating()
            
            print(error.debugDescription)
        }        
    

    }
        
    
    
}
