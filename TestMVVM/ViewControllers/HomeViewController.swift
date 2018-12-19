//
//  ViewController.swift
//  TestMVVM
//
//  Created by Suraj_Mac on 12/13/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var homeItemViewModel : HomeViewViewModel?
    
    @IBOutlet weak var homeTableView: UITableView!
    
    //MARK: - ViewLifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        homeItemViewModel = HomeViewViewModel()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        loadHomeItems()
    }
    
    //MARK: - Helper Methods
    func loadHomeItems(){
        homeItemViewModel?.loadItems(completion: { (success, message) in
            if success{
                self.homeTableView.delegate = self
                self.homeTableView.dataSource = self
                self.homeTableView.reloadData()
            }else{
                UIAlertController.sharedInstance().showAlert(withTitle: Constant.Message.alert, message: message, autoHideDuration: 3)
            }
        })
    }
    func openCamera(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        cameraPicker.allowsEditing = false
        present(cameraPicker,animated: true)
    }
    func openGallery(){
        let galleryPicker = UIImagePickerController()
        galleryPicker.delegate = self
        galleryPicker.allowsEditing = false
        galleryPicker.sourceType = .photoLibrary
        present(galleryPicker, animated: true)
    }
    
    //MARK: - UIButtonActions Methods
    @IBAction func cameraBtnAction(_ sender: UIBarButtonItem) {
        
        let actionSheet =  UIAlertController(title: Constant.Message.actionSheetTitle, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: Constant.Message.takePhoto, style: UIAlertAction.Style.default, handler: { (ACTION :UIAlertAction!)in
            self.openCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: Constant.Message.galleryChoose, style: UIAlertAction.Style.default, handler: { (ACTION :UIAlertAction!)in
            self.openGallery()
        }))
        
        actionSheet.addAction(UIAlertAction(title: Constant.Message.cancel, style: UIAlertAction.Style.cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (homeItemViewModel?.numberOfRowsForSection(section))!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        cell.home = homeItemViewModel?.homeItemList[indexPath.row] as! HomeModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension HomeViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
