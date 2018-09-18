import UIKit
import M13Checkbox

class TableViewCell: UITableViewCell {

    @IBOutlet weak var checkbox: M13Checkbox!
    @IBOutlet weak var labelText: UILabel!
    
    func toggle(){
        checkbox.toggleCheckState()
        syncLabel()
    }
    
    func syncLabel(){
        if checkbox.checkState == .checked{
            let strokeEffect: [NSAttributedStringKey : Any] = [NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleSingle.rawValue]
            labelText.attributedText = NSAttributedString(string: labelText.text!, attributes: strokeEffect)
        } else {
            labelText.text = labelText.text!
        }
    }
}
