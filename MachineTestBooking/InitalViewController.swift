//
//  ViewController.swift
//  MachineTestBooking
//
//  Created by Visakh D on 14/11/24.
//

import UIKit

class InitalViewController: UIViewController {
    
    @IBOutlet weak var seatAvailableLabel: UILabel!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var item : Seats?
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        seatAvailableLabel.text = "Seats are Available"
        // Do any additional setup after loading the view.
    }
    
    func fetchSeat () {
        do {
          let items =  try  self.context.fetch(Seats.fetchRequest())
        }catch {
            
        }
    }
    
    
    @IBAction func homeButton(_ sender: Any) {

        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        vc?.modalPresentationStyle = .fullScreen
        present(vc!, animated: false)
    }
    

}

