import UIKit
import CoreData


class ShowViewController: UIViewController,PassValueDelegate {
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var delegate:PassValueDelegate?
    func PassValueFunc(PassFirst: String, PassLast: String, PassNum: String) {
      
     
    }
    
  
    
    @IBAction func DonePressed(_ sender: UIBarButtonItem) {
         dismiss(animated: true, completion:nil)
    }
    
    @IBAction func BackPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    var passfirstname:String?
    var passlastname:String?
    var passnumber:String?
    
    var EntityInShow = [ExamTwoEntity]()
    
    @IBOutlet weak var NumInShowLabel: UITextField!
    @IBOutlet weak var NameInShowLabel: UITextField!
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let  unwrrapednum = passnumber {
            
            NumInShowLabel.text = "\(unwrrapednum)"
            
        }
        if let unwrappedfirstname = passfirstname {
            if let unwrrappedLast = passlastname{
                NameInShowLabel.text = "\(unwrappedfirstname)  \(unwrrappedLast)"
                
            }
            
            
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if let unwrappedfirst = passfirstname{
            self.title = unwrappedfirst
            
        }
        
    }
    override func viewDidDisappear(_ animated: Bool) {
     
//        let thing = NSEntityDescription.insertNewObject(forEntityName: "ExamTwoEntity", into: managedObjectContext) as! ExamTwoEntity
//        if let unwrappedfirstname = passfirstname {
//            if let unwrrappedLast = passlastname{
//                if let  unwrrapednum = passnumber {
//                    
//                    thing.firstname = unwrappedfirstname
//                    thing.lastname = unwrrappedLast
//                    thing.number = unwrrapednum
//
//                }
//
//            }
//
//
//        }
//
//
//
//
//        if managedObjectContext.hasChanges {
//            do {
//                try managedObjectContext.save()
//
//                print("Success : \(thing)")
//            } catch {
//                print("\(error)")
//            }
//        }
}
}
