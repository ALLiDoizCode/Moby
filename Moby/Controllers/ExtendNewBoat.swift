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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return bgImageView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return self.view.frame.height * 0.35
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
            
            currentList = passengers
            picker.reloadAllComponents()
            picker.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 6:
            
            currentList = sizes
            picker.reloadAllComponents()
            picker.isHidden = false
            tableView.isUserInteractionEnabled = false
            
        case 7:
            saveView.isHidden = true
            priceView.textfield.becomeFirstResponder()
            tableView.isUserInteractionEnabled = false
            tableView.isScrollEnabled = false
            priceView.isHidden = false
            
        case 8:
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
            
            optionArray.remove(at: currentIndex)
            optionArray.insert(currentList[row], at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            

            print("")
            
        case 1:
            
            optionArray.remove(at: currentIndex)
            optionArray.insert(currentList[row], at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            
        case 3:
            
            optionArray.remove(at: currentIndex)
            optionArray.insert(currentList[row], at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            
            print("")
            
        case 5:
            
            optionArray.remove(at: currentIndex)
            optionArray.insert("\(currentList[row]) passengers", at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            
            print("")

            
        case 6:
            
            optionArray.remove(at: currentIndex)
            optionArray.insert("\(currentList[row]) ft", at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
            
            print("")
            
        case 8:
            
            optionArray.remove(at: currentIndex)
            optionArray.insert("\(currentList[row]) Hr", at: currentIndex)
            tableView.isUserInteractionEnabled = true
            tableView.reloadData()
            
            picker.isHidden = true
           
            print("")
        default:
            break
        }
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        picker.isHidden = true
        tableView.isUserInteractionEnabled = true
    }
}
