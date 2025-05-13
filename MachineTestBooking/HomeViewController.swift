//
//  HomeViewController.swift
//  MachineTestBooking
//
//  Created by Visakh D on 14/11/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    let context = PersistantStorage.shared.context
    var item : Seats?
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var selectedFlag = false
    
    var indexPathHide = [0,1,10,11,12,23]
    var selectedIndexPath : [Int] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.main.bounds
              screenWidth = screenSize.width
              screenHeight = screenSize.height

     let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        homeCollectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
               layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
               layout.itemSize = CGSize(width: screenWidth/15, height: screenHeight/5)
               layout.minimumInteritemSpacing = 2
               layout.minimumLineSpacing = 2
        homeCollectionView!.collectionViewLayout = layout
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
   

}

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
       
       
         cell.seatNumb.text = "\(indexPath.row)"
        
        
            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        return CGSize(width: 30, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! HomeCollectionViewCell
      
            selectedIndexPath.append(indexPath.row)
            collectionView.reloadData()
     
    }
    
}
