//
//  ExtendNewBoat.swift
//  Moby
//
//  Created by Jonathan on 4/6/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import Material

extension NewBoatViewController {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //myImageView.contentMode = .scaleAspectFit
        //myImageView.image = chosenImage
        bgImageView.images.insert(chosenImage, at: bgImageView.images.count - 1)
        bgImageView.collectionView.reloadData()
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated:true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return bgImageView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return self.view.frame.height * 0.45
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.view.frame.height * 0.1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return optionArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        currentIndex = indexPath.row
        print("row selected")
        
        switch indexPath.row {
        case 0:
            
            currentList = BOAT_MANUFACTURES()
            picker.reloadAllComponents()
            picker.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 1:
            
            currentList = years
            picker.reloadAllComponents()
            picker.selectRow(years.count/2, inComponent: 0, animated: true)
            picker.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 2:
            
            saveView.isHidden = true
            boatModelView.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 3:
            
            currentList = BOAT_Type()
            picker.reloadAllComponents()
            picker.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 4:
            saveView.isHidden = true
            rulesView.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 5:
            
            saveView.isHidden = true
            descriptionView.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 6:
            
            currentList = passengers
            picker.reloadAllComponents()
            picker.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 7:
            
            currentList = sizes
            picker.reloadAllComponents()
            picker.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 8:
            saveView.isHidden = true
            priceView.textfield.becomeFirstResponder()
            tableView.isUserInteractionEnabled = false
            tableView.isScrollEnabled = false
            priceView.isHidden = false
            
        case 9:
            currentList = minHours
            picker.reloadAllComponents()
            picker.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 10:
            currentList = propulsion
            picker.reloadAllComponents()
            picker.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 11:
            currentList = minHours
            picker.reloadAllComponents()
            picker.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 12:
            currentList = minHours
            picker.reloadAllComponents()
            picker.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        default:
            break
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newboat", for: indexPath) as! NewBoatTableViewCell
        
        var image:UIImage!
        
        if completedRows.contains(indexPath.row) == true {
            
            image = UIImage(named: "check")
            
        }else {
            
            image = UIImage(named: "next-1")
        }
        
        cell.selectionStyle = .none
        cell.icon.image = image
        cell.infoLabel.text = optionArray[indexPath.row]
        
        
        return cell
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return currentList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return currentList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print(row)
        
        if completedRows.contains(currentIndex) == false {
            
            completedRows.append(currentIndex)
            
            print("added row \(currentIndex)")
        }
        
        switch currentIndex {
        case 0:
            boat.boatMake = currentList[row]
            optionArray.remove(at: currentIndex)
            optionArray.insert(currentList[row], at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            
        case 1:
            
            boat.year = currentList[row]
            optionArray.remove(at: currentIndex)
            optionArray.insert(currentList[row], at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            
        case 3:
            boat.type = currentList[row]
            optionArray.remove(at: currentIndex)
            optionArray.insert(currentList[row], at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            
            
        case 6:
            
            boat.passengers = currentList[row]
            optionArray.remove(at: currentIndex)
            optionArray.insert("\(currentList[row]) passengers", at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            
        case 7:
            boat.size = Int(currentList[row])
            optionArray.remove(at: currentIndex)
            optionArray.insert("\(currentList[row]) ft", at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            
           
            
        case 9:
            
            boat.minTime = Int(currentList[row])
            optionArray.remove(at: currentIndex)
            optionArray.insert("\(currentList[row]) Hr", at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            
        case 10:
            
            boat.power = currentList[row]
            optionArray.remove(at: currentIndex)
            optionArray.insert(currentList[row], at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            
        case 11:
            
            boat.rooms = Int(currentList[row])
            optionArray.remove(at: currentIndex)
            optionArray.insert("\(currentList[row]) Rm", at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            
        case 12:
            
            boat.restRooms = Int(currentList[row])
            optionArray.remove(at: currentIndex)
            optionArray.insert("\(currentList[row]) Restrooms", at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
           
        default:
            break
        }
        
        guard completedRows.count == 13 else {
            
            return
        }
        
        guard priceView.textfield.text != nil else {
            
            return
        }
        
        guard rulesView.textBox.text != nil else {
            
            return
        }
        
        guard boatModelView.textBox.text != nil else {
            
            return
        }
        
        saveView.saveBtn.backgroundColor = THEME_1
        saveView.saveBtn.isUserInteractionEnabled = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        picker.isHidden = true
        tableView.isUserInteractionEnabled = true
    }
}
