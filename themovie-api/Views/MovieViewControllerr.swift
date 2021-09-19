import UIKit
import SnapKit
import SDWebImage

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movie = [Movie]()
    var viewModel: MovieViewModel?
    var similarMovieViewModel = SimilarMovieViewModel()
    var similarMovie: [Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        similarMovieViewModel.loadSimilarMovies { similarMovie, error in
            self.similarMovie = similarMovie?.results
            self.tableView.reloadData()
        }
        viewModel = MovieViewModel()
        configureViews()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movie = similarMovie else {
            return 0
        }
        return movie.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = HeaderTableViewCell()
            
            viewModel?.loadContacts { movie, error in
                if let movie = movie {
                    let url = URL.init(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
                    cell.image.sd_setImage(with: url, completed: nil)
                    cell.backgroundColor = .black
                    cell.titleLabel.attributedText = NSAttributedString(string: movie.title)
                    cell.voteCountLabel.attributedText = NSAttributedString(string: String(movie.voteCount) + " likes")
                }
            }
            return cell
        }
        
        let cell = SimilarMoviesTableViewCell()
        if let similarMovie = similarMovie {
            cell.titleLabel.text = similarMovie[indexPath.row - 1].title
            cell.date.text = similarMovie[indexPath.row - 1].date
            
            let url = URL.init(string: "https://image.tmdb.org/t/p/w500\(similarMovie[indexPath.row - 1].posterPath)")
            cell.image.sd_setImage(with: url, completed: nil)
        }
        return cell
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: String(describing: HeaderTableViewCell.self))
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .black
        return tableView
    }()
    
    func configureViews() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}
