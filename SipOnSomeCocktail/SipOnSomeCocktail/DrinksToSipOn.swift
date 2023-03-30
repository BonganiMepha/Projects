import Foundation

class Drinks {

    struct Returned: Codable{
        var drinks: [Drink]
    }

    let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "O", "P", "Q", "R", "S", "T", "U", "V","W","X", "Y", "Z"]
    var alphabetIndex = 0
    var isFetching = false

    let urlBase = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f="

    var urlString = ""
    var drinkArray: [Drink] = []

    func getData(completed: @escaping ()->()) {
        guard !isFetching else{
            print("<><><> didnt call getData because we hadnt fetched data.")
            return
        }

        isFetching = true

        urlString = urlBase + alphabet[alphabetIndex]
        print("We are accessing the url \(urlString))")
        isFetching = false
        alphabetIndex += 1


        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            completed()
            return
        }

        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }

            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                self.drinkArray += returned.drinks
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            self.isFetching = false
            completed()
        }
        task.resume()
    }
}
