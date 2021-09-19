import Foundation

class SimilarMovie: Decodable {
    var page: Int
    var results: [Result]
    
    init(page: Int, results: [Result]) {
        self.page = page
        self.results = results
    }
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
    }
}

// A diferença é que a classe trabalha com referencia, se eu quero
public struct Result: Decodable {
    public let title: String
    public let date: String
    public let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case date = "release_date"
        case posterPath = "poster_path"
    }
    
}
