import UIKit
import SnapKit

class MovieViewController: UIViewController {
    
    var movie = [Movie]()
    var viewModel: MovieViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MovieViewModel()
        configureViews()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var image: UIImage = {
        let image = UIImage()
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        return titleLabel
    }()
    
    lazy var voteCountLabel: UILabel = {
        let voteCountLabel = UILabel()
        return voteCountLabel
    }()
    
    func configureViews() {
        
    }
}
