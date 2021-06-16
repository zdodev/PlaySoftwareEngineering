import Foundation

struct Repository {
    func fetchNow(onCompleted: @escaping (Entity) -> Void) {
        let urlString = "http://zdoapi.duckdns.org/now"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            // Server data -> Entity
            guard let model = try? JSONDecoder().decode(Entity.self, from: data) else {
                return
            }
            
            onCompleted(model)
        }.resume()
    }
}
