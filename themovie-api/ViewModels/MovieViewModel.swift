import Foundation

class MovieViewModel {
    private let service = MovieService()
    
    private var completion: ((Movie?, Error?) -> Void)?
    
    init() { }
    
    func loadContacts(_ completion: @escaping (Movie?, Error?) -> Void) {
        self.completion = completion
        service.fetchMovie { movies, err in
            self.handle(movies, err)
        }
    }
    
    private func handle(_ movie: Movie?, _ error: Error?) {
        DispatchQueue.main.async {
            if let e = error {
                self.completion?(nil, e)
            }
            
            if let movie = movie {
                self.completion?(movie, nil)
            }
        }
    }
}
