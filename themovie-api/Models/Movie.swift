import Foundation

class Movie: Decodable {
    var id: Int
    var title: String
    var voteCount: Int 
    var posterPath: String
    
    init(id: Int, title: String, voteCount: Int, posterPath: String) {
        self.id = 205596
        self.title = title
        self.voteCount = voteCount
        self.posterPath = posterPath
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case voteCount = "vote_count"
        case posterPath = "poster_path"
    }
}
