import Foundation
import UIKit

class SimilarMoviesTableViewCell: UITableViewCell {
    
    var movie = [SimilarMovie]()
    var viewModel: SimilarMovieViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureViews()
    }
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .init(white: 20, alpha: 5)
        titleLabel.numberOfLines = 4
        return titleLabel
    }()
    
    lazy var date: UILabel = {
        let date = UILabel()
        return date
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    func configureViews() {
        contentView.addSubview(view)
        view.addSubview(titleLabel)
        view.addSubview(image)
        
        view.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.edges.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(120)
            make.width.equalTo(75)
            make.top.equalToSuperview().offset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(image)
            make.width.equalTo(400)
            make.left.equalToSuperview().offset(120)
        }
    }
    
}
