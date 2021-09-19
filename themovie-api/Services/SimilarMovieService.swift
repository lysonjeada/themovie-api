import Foundation

private let key: String = "e2ce3d7d2083c20850a43cc4fcffe3b2"
private let movieId: Int = 22803
private let apiURL = "https://api.themoviedb.org/3/movie/\(movieId)/similar?api_key=\(key)&language=pt-BR&page=1"

class SimilarMovieService {
    func fetchSimilarMovie(completion: @escaping (SimilarMovie?, Error?) -> Void) {
        guard let api = URL(string: apiURL) else {
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: api) { (data, response, error) in
            guard let jsonData = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(SimilarMovie.self, from: jsonData)
                
                completion(decoded, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
