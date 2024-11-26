import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var noteTextView: UITextView!
    
    public var completion:((String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make the title text field the first responder
        titleTextField.becomeFirstResponder()
        
        // Add a Save button to the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
    }
    
    @objc func didTapSave() {
        // Check if both title and note are not empty
        if let text = titleTextField.text, !text.isEmpty, !noteTextView.text.isEmpty {
            // Call the completion handler with the title and note
            completion?(text, noteTextView.text)
            
            // Optionally, you might want to dismiss the view controller or go back to the previous screen
            navigationController?.popViewController(animated: true)
        } else {
            // Show an alert if either title or note is empty
            let alert = UIAlertController(title: "Missing Information", message: "Please fill out both the title and note fields.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}
