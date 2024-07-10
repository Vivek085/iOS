//
//  DataPicker.swift
//  CIE2
//
//  Created by bmiit on 13/04/24.
//

import UIKit

class DataPicker: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let data = ["Cardiologist", "Dermatologist", "Nurologist"] // Your data array

    override func viewDidLoad() {
        super.viewDidLoad()

        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self

        view.addSubview(pickerView)
    }

    // MARK: - UIPickerViewDataSource

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // For a single column picker view
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count // Number of rows in the picker view
    }

    // MARK: - UIPickerViewDelegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row] // Title for each row
    }
}
