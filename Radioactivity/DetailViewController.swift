//
//  DetailViewController.swift
//  Radioactivity
//
//  Created by PJ Solomon on 3/28/20.
//  Copyright © 2020 pjsolomon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var locationField: UITextField!
    @IBOutlet var frequencyField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        locationField.text = item.location
        frequencyField.text = item.frequency
        dateLabel.text = "\(item.dateCreated)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.location = locationField.text
        item.frequency = frequencyField.text ?? "0.0"
    }
}
