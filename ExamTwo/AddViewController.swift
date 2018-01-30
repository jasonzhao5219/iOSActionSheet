import UIKit
import CoreData
class AddViewController: UIViewController,PassValueDelegate {
    func PassValueFunc(PassFirst: String, PassLast: String, PassNum: String) {
        
    }
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    weak var delegate:PassValueDelegate?
    
    @IBAction func CancelPressed(_ sender: UIBarButtonItem) {
        delegate?.PassValueFunc(PassFirst: FirstNameLabel.text!, PassLast: LastNameLabel.text!, PassNum: NumberLabel.text!)
        dismiss(animated: true, completion:nil)
        
    }
    @IBOutlet weak var FirstNameLabel: UITextField!
    @IBOutlet weak var LastNameLabel: UITextField!
    @IBOutlet weak var NumberLabel: UITextField!
 
    @IBAction func SavePressed(_ sender: UIBarButtonItem) {
        let thing = NSEntityDescription.insertNewObject(forEntityName: "ExamTwoEntity", into: managedObjectContext) as! ExamTwoEntity
        thing.firstname = FirstNameLabel.text
        thing.lastname = LastNameLabel.text
        thing.number = NumberLabel.text
        
        
        
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                
                //print("Success : \(thing)")
            } catch {
                print("\(error)")
            }
        }
        dismiss(animated: true, completion:nil)
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Contract"
        FirstNameLabel.text = "aa"
        LastNameLabel.text = "bb"
        NumberLabel.text = "123"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
