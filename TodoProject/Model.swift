import Foundation
import Alamofire
import M13Checkbox

struct TodoItem: Codable {
    let id: Int
    let text: String
    var isCompleted: Bool
}
struct ProjectItem: Codable {
    let id: Int
    let title: String
    var todos: [TodoItem]
}

let api_url = "https://ancient-badlands-76801.herokuapp.com"

var Projects: [ProjectItem] = []

func toggleTodo(section: Int, row: Int, cell: TableViewCell, controller: TableViewController){
    Projects[section].todos[row].isCompleted = !Projects[section].todos[row].isCompleted
    cell.toggle()
    
    let todoID = Projects[section].todos[row].id
    let params: Parameters = ["isCompleted": Projects[section].todos[row].isCompleted]
    
    Alamofire.request(api_url+"/projects/0/todos/"+String(todoID)+"/toggle", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
        switch response.result{
        case .success:
            print("Toggle Success")
        case .failure:
            print("Toggle Failed")
            Projects[section].todos[row].isCompleted = !Projects[section].todos[row].isCompleted
            cell.toggle()
            controller.uiShowAlert(title: "Ошибка сети", message: "Не удалось изменить статус")
        }
    }
}

func addTodoItem(project_id: Int, text: String, controller: NewTodoTableViewController){
    let params: Parameters = ["todo":["text": text, "project_id": project_id]]
    
    Alamofire.request(api_url+"/projects/0/todos/", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
        switch response.result{
        case .success:
            print("Add Todo Success")
            controller.dismiss(animated: true)
        case .failure:
            print("Add Todo Failed")
            controller.uiShowAlert(title: "Ошибка сети", message: "Не удалось добавить задачу")
        }
    }
}

func downloadData(controller: TableViewController){
    Projects = []
    controller.tableView.reloadData()
    controller.uiDataLoadInProgress()
    Alamofire.request(api_url+"/projects.json").responseJSON { response in
        switch response.result{
        case .success:
            if let data = response.data {
                let decoder = JSONDecoder()
                Projects = try! decoder.decode(Array<ProjectItem>.self, from: data)
                controller.uiDataLoadSuccess()
            }
        case .failure:
            controller.uiDataLoadFailed()
        }
    }
}
