import UIKit
import SnapKit
import SDWebImage

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movie = [Movie]()
    var viewModel: MovieViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self), for: indexPath) as! HeaderTableViewCell
            
            viewModel.loadContacts { movie, error in
                let url = URL.init(string: "https://image.tmdb.org/t/p/w500\(movie!.posterPath)")
                cell.image.sd_setImage(with: url, completed: nil)
                cell.titleLabel.attributedText = NSAttributedString(string: movie!.title)
                cell.voteCountLabel.attributedText = NSAttributedString(string: String(movie!.voteCount) + " likes")
            }
            return cell
        }
        return SimilarMoviesTableViewCell()
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: String(describing: HeaderTableViewCell.self))
        tableView.tableFooterView = UIView()
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
