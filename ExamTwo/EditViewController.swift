import UIKit
import CoreData


class EditViewController: UIViewController,PassValueDelegate {
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var delegate:PassValueDelegate?
    func PassValueFunc(PassFirst: String, PassLast: String, PassNum: String) {
        
        
    }
    var passIndex:Int?
    var EntityInEdit = [ExamTwoEntity]()
    
    @IBAction func UpdateSavePressed(_ sender: UIBarButtonItem) {
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExamTwoEntity")
        do {
            // get the results by executing the fetch request we made earlier
            let results = try managedObjectContext.fetch(itemRequest)
            // downcast the results as an array of AwesomeEntity objects
            EntityInEdit = results as! [ExamTwoEntity]
            
            
            
            //Use a loop to Update
         
            for item in EntityInEdit {
                if  item.firstname == Editfirstname && item.lastname == Editlastname && item.number == Editnumber  {
                    item.firstname = FirstInEdit.text
                    item.lastname = LastInEdit.text
                    item.number = NumInEdit.text

                }

            }
            try managedObjectContext.save()
            
            
        } catch {
            // print the error if it is caught (Swift automatically saves the error in "error")
            print("\(error)")
        }
        
        dismiss(animated: true, completion:nil)
    }
    
    @IBAction func BackPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var FirstInEdit: UITextField!
    
    @IBOutlet weak var LastInEdit: UITextField!
    
    @IBOutlet weak var NumInEdit: UITextField!
    
    
 
    var Editfirstname:String?
    var Editlastname:String?
    var Editnumber:String?
    var EntityInShow = [ExamTwoEntity]()
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let  unwrrapednum = Editnumber {
//
//            NumInShowLabel.text = "\(unwrrapednum)"
//
//        }
//        if let unwrappedfirstname = Editfirstname {
//            if let unwrrappedLast = Editlastname{
//                NameInShowLabel.text = "\(unwrappedfirstname)  \(unwrrappedLast)"
//
//            }
//
//
//        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if let unwrappedfirst = Editfirstname{
            self.title = unwrappedfirst

        }

        if let  unwrrapednum = Editnumber {
          
            NumInEdit.text = unwrrapednum

                    }
        if let unwrappedfirstname = Editfirstname {
                        
            FirstInEdit.text = unwrappedfirstname

                    }
        if let unwrrappedLast = Editlastname{
            LastInEdit.text = unwrrappedLast
            
        }
        
        }
    override func viewDidDisappear(_ animated: Bool) {
        
    }
}
