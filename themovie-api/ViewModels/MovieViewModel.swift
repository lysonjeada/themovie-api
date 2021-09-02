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
        if let e = error {
            completion?(nil, e)
        }
        
        if let movie = movie {
            completion?(movie, nil)
        }
    }
}
