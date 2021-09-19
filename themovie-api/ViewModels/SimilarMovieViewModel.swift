import Foundation

class SimilarMovieViewModel {
    private let service = SimilarMovieService()
    
    private var completion: ((SimilarMovie?, Error?) -> Void)?
    
    init() { }
    
    func loadSimilarMovies(_ completion: @escaping (SimilarMovie?, Error?) -> Void) {
        self.completion = completion
        service.fetchSimilarMovie { movies, err in
            self.handle(movies, err)
        }
    }
    
    private func handle(_ movie: SimilarMovie?, _ error: Error?) {
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
