import UIKit

class UserDataTableViewController: UITableViewController {

    var user = [items]()
    var tag:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDrinkData()
        

    }

    // MARK: - Table view data source
    func fetchDrinkData(){
        let url = URL(string: "https://raw.githubusercontent.com/winwiniosapp/interview/main/interview.json")!
        var request = URLRequest(url: url)
        request.httpMethod = "Get"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(messageData.self, from: data)
                    self.user = result.data.items
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.navigationItem.title = "totalCount\(self.user.count)"
                    }
                }
                catch{
                    print(error)
                }
            }
        }.resume()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return user.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataTableViewCell", for: indexPath) as! UserDataTableViewCell
        let index = user[indexPath.row]
        cell.userName.text = index.user.nickName
        
//        var imageUrl = index.user.imageUrl.absoluteString
        
//        let imageurl = URL(string: imageUrl)
//        URLSession.shared.dataTask(with: imageurl!) { (data, response, error) in
//            if let data = data {
//                DispatchQueue.main.async {
//                    cell.userImage.image = UIImage(data: data)
//
//                }
//            }
//        }.resume()
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
