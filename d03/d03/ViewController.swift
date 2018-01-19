//
//  ViewController.swift
//  d03
//
//  Created by Jeremy SCHOTTE on 1/11/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!

    var images : [String] = ["https://eoimages.gsfc.nasa.gov/images/imagerecords/77000/77085/marble_east_vir_2012023_lrg.jpg","https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/latest_4096_0171.jpg","https://cdn.photographylife.com/wp-content/uploads/2014/06/Nikon-D810-Image-Sample-7.jpg","https://www.nasa.gov/sites/default/files/images/696969main_ExoUpClose-full_full.jpg", "https://www.nasa.gov/sites/default/files/13989104603_c57e9de5cf_o.jpg", "42"]
    
    var dataImage = [String : UIImage]()
    @IBOutlet weak var buttonBar: UIBarButtonItem!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath as IndexPath) as! CustomViewCell
        
        cell.indicator.hidesWhenStopped = true
        if self.dataImage[self.images[indexPath.row]] == nil
        {
            DispatchQueue.global(qos: .userInitiated).async
            {
                let imageUrl:NSURL = NSURL(string: self.images[indexPath.row])!
                //let imageData:NSData = NSData(contentsOf: imageUrl as URL)!
                
                if let imageData = NSData(contentsOf: imageUrl as URL)
                {
                    let image = UIImage(data: imageData as Data)

                    self.dataImage[self.images[indexPath.row]] = image

                    DispatchQueue.main.async
                    {
                        cell.indicator.stopAnimating()
                        cell.image.image = image
                        cell.image.isUserInteractionEnabled = true

                    }
                }
                else
                {
                    DispatchQueue.main.async
                    {
                        let myalert = UIAlertController(title: "Error", message: "Cannot access to \(imageUrl)", preferredStyle: UIAlertControllerStyle.alert)
                        
                        myalert.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                            print("Selected")
                        })
                        cell.image.image = nil
                        cell.indicator.stopAnimating()
                        self.present(myalert, animated: true)
                    }
                }
            }
        }
        else
        {
            cell.indicator.stopAnimating()
            cell.image.image = self.dataImage[self.images[indexPath.row]]
        }
        return cell

    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.navigationItem.rightBarButtonItem = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomViewCell
        if cell.image.isUserInteractionEnabled == true
        {
            performSegue(withIdentifier: "showDetail", sender: cell.image.image)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showDetail" {
            if let vc = segue.destination as? ScrollViewController
            {
                vc.image = sender as? UIImage
            }
        }
    }

}
