//
//  ViewController.swift
//  ExamTwo
//
//  Created by Jason Zhao on 1/29/18.
//  Copyright © 2018 Jason Zhao. All rights reserved.
//

import UIKit
import CoreData

var maincell = [ExamTwoEntity]()
class MainTableViewController: UITableViewController,PassValueDelegate {
    func PassValueFunc(PassFirst: String, PassLast: String, PassNum: String) {
       dismiss(animated: true, completion:nil)
    }
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: cellIdentifier)
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell?.textLabel?.text = maincell[indexPath.row].firstname
        cell?.detailTextLabel?.text = maincell[indexPath.row].number
        
        
        
        
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//action sheet
        let title = "Action sheet title"
        let message = "action sheet message"
        
      
        let optionalFourText = "Cancel"
        
        let actionSheet = UIAlertController(title: title, message: message,preferredStyle: UIAlertControllerStyle.actionSheet)

        
        let actionFour = UIAlertAction(title: optionalFourText, style: .default, handler: nil)
        let ViewAction = UIAlertAction(title: "View", style: .default) { (handler) in
            //use viewcontroller identifier to navigate
//            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "ShowViewController")
//            self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
            self.performSegue(withIdentifier: "ViewSegue", sender: indexPath)
        }
        let EditAction = UIAlertAction(title: "Edit", style: .default) { (handler) in

            self.performSegue(withIdentifier: "EditSegue", sender: indexPath)
        }
        let DeleteAction = UIAlertAction(title: "Delete", style: .default) { (handler) in
                let item = maincell[indexPath.row]
                        self.managedObjectContext.delete(item)
                        do {
                            try self.managedObjectContext.save()
                        }catch{
                            print("\(error)")
                        }
                        maincell.remove(at: indexPath.row)
                        tableView.reloadData()
            
            
        }
        
        actionSheet.addAction(ViewAction)
        actionSheet.addAction(EditAction)
        actionSheet.addAction(DeleteAction)
        actionSheet.addAction(actionFour)
        self.present(actionSheet, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return maincell.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditSegue"{
          
            let navigationController = segue.destination as! UINavigationController
            let EditViewController = navigationController.topViewController as! EditViewController
            EditViewController.delegate = self
            let aa = sender as! NSIndexPath
            let item = maincell[aa.row]
            EditViewController.Editfirstname = item.firstname
            EditViewController.Editlastname = maincell[aa.row].lastname
//            print("anything in item.lastname? ")
//            print(item.lastname)
            EditViewController.Editnumber = item.number
            EditViewController.passIndex = aa.row
              
        }
        if segue.identifier == "ViewSegue"{
            let navigationController = segue.destination as! UINavigationController
            let ShowViewController = navigationController.topViewController as! ShowViewController
            ShowViewController.delegate = self
            let aa = sender as! NSIndexPath
            let item = maincell[aa.row]
            ShowViewController.passfirstname = item.firstname
            ShowViewController.passlastname = item.lastname
            ShowViewController.passnumber = item.number
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
//        tableView.reloadData()
        self.title = "Contact List"
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExamTwoEntity")
        do {
            // get the results by executing the fetch request we made earlier
            let results = try managedObjectContext.fetch(itemRequest)
            // downcast the results as an array of AwesomeEntity objects
            maincell = results as! [ExamTwoEntity]
            
            
            
            
        } catch {
            // print the error if it is caught (Swift automatically saves the error in "error")
            print("\(error)")
        }
        tableView.reloadData()
    }
}

