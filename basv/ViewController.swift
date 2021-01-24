//
//  ViewController.swift
//  basv
//
//  Created by Ranjeet Singh on 27/11/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource , UITableViewDataSource, UITableViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lang.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lang[row]
    }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let j = temp.count
        return j
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        filter(name: lang[row])
        tableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let courseObj = temp[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "course_cell") as? rsdTableViewCell
        
        cell?.name.text = courseObj.course
        cell?.fees.text = String(courseObj.fee)
        cell?.hrs.text = String(courseObj.hours)
        cell?.deleteButton.tag = indexPath.row
        cell?.deleteButton.addTarget(self, action: #selector(removeLang(_:)), for: .touchUpInside)

        
        return cell!
        
    }
    // removed the exixting rows from the tableview on remove button click
    @objc func removeLang(_ sender: UIButton){
      
        var row = sender.tag
        temp.remove(at: row)
        getTotal()
        tableView.reloadData()
    }
    
    // filter the courses w.r.t picker selection and added to variable temp
    func filter(name:String)
    {
        var totalHours = 0
        var isExist = false
        for tempItem in temp{
            totalHours += tempItem.hours
            if name == tempItem.course{
                isExist = true
            }
        }
        
        if(!isExist)
        {
            for course in details{
                if name == course.course{
                    totalHours += course.hours
                    if(totalHours>19)
                    {
                       // if hours are greater than 19 it will give pop up alert
                        let alert = UIAlertController(title: "Error", message: "Total Hours can't be above 19 Hours", preferredStyle: .alert)
                          let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                          alert.addAction(okAction)
                                
                          self.present(alert, animated: true, completion: nil)
                    }
                    else{
                        temp.append(course)
                       
                    }
                    
                }
            }
        }
        
       
        
      
       // calling the getTotal() function
        
        getTotal()
        
    }
    
    // calculating the total hours and fees
    
    
    func getTotal()
    {
        var totalFee = 0
        var totalHr = 0
        for item in temp{
            totalFee += item.fee
            totalHr += item.hours
        }
        totalHrs.text = String(totalHr)
        totalFees.text = String(totalFee)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var coursepicker: UIPickerView!
    
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var totalHrs: UITextField!
    @IBOutlet weak var totalFees: UITextField!
    var details = [Course]()
    var temp = [Course]()
    
    let lang = ["Java" ,"Python","Database", "Web", "ios", "Android", "System", "Cloud", "Machine", "Problem"]
    override func viewDidLoad() {
        super.viewDidLoad()
        filling()
        self.coursepicker.dataSource = self
        self.coursepicker.delegate = self
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.rowHeight = 50
        

     

    }
    // filling the data into the list
    func filling()
    {
        details.append(Course(course: "Java", hours: 5, fee: 1600))
        details.append(Course(course: "Python", hours: 4, fee: 1850))
        details.append(Course(course: "Database", hours: 3, fee: 1300))
        details.append(Course(course: "Web", hours: 4, fee: 1200))
        details.append(Course(course: "iOS", hours: 5, fee: 2200))
        details.append(Course(course: "Android", hours: 5, fee: 2000))
        details.append(Course(course: "System", hours: 4, fee: 1900))
        details.append(Course(course: "Cloud", hours: 3, fee: 1250))
        details.append(Course(course: "Machine", hours: 5, fee: 2300))
        details.append(Course(course: "Problem", hours: 3, fee: 950))
        
    }


}

