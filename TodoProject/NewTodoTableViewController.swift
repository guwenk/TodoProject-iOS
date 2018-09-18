import UIKit

class NewTodoTableViewController: UITableViewController {
    
    var project_id = 0

    @IBAction func onDoneClicked(_ sender: Any) {
        let textFieldCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! NewTodoNameCell
        if textFieldCell.textField.text!.isEmpty{
            let alertController = UIAlertController(title: "Ошибка", message: "Введите название задачи!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        if project_id == 0 {
            let alertController = UIAlertController(title: "Ошибка", message: "Выберете категорию!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        addTodoItem(project_id: project_id, text: textFieldCell.textField.text!, controller: self)
    }
    @IBAction func onBackClicked(_ sender: Any) {
        dismiss(animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "SectionHeader") as! TableViewSection
        switch section {
        case 0:
            header.labelTitle?.text = "Задача"
        case 1:
            header.labelTitle?.text = "Категория"
        default:
            header.labelTitle?.text = "Unknown section"
        }
        header.isUserInteractionEnabled = false
        return header
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1;
        default:
            return Projects.count;
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewTodoNameCell", for: indexPath) as! NewTodoNameCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            cell.textLabel?.text = Projects[indexPath.row].title
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        }
        return 55
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            project_id = indexPath.row+1;
            print(project_id)
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }
}
