import Foundation
import UIKit
import SnapKit

class HeaderTableViewCell: UITableViewCell {
    
    var movie = [Movie]()
    var viewModel: MovieViewModel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViews()
    }
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        return image
    }()
    
    lazy var imageFavorite: UIImageView = {
        let imageFavorite = UIImageView()
        imageFavorite.image = UIImage.init(named: "png-favorite")
        imageFavorite.tintColor = .white
        return imageFavorite
    }()
    
    lazy var imageLike: UIImageView = {
        let imageLike = UIImageView()
        imageLike.image = UIImage.init(named: "png-favorite")
        return imageLike
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .init(white: 20, alpha: 5)
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        return titleLabel
    }()
    
    lazy var voteCountLabel: UILabel = {
        let voteCountLabel = UILabel()
        voteCountLabel.textColor = .init(white: 20, alpha: 5)
        voteCountLabel.font = .systemFont(ofSize: 15, weight: .light)
        return voteCountLabel
    }()
    
    func configureViews() {
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(voteCountLabel)
        contentView.addSubview(imageFavorite)
        contentView.addSubview(imageLike)
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(500)
            make.width.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.height.equalTo(450)
            make.width.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(395)
            make.height.equalTo(100)
            make.right.left.equalTo(image).offset(10)
        }
        
        imageLike.snp.makeConstraints { make in
            make.size.equalTo(25)
            make.left.equalTo(image).offset(10)
            make.top.equalTo(image.snp.bottom).offset(20)
        }
        
        voteCountLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(22.5)
            make.left.equalTo(imageLike).offset(24)
        }
        
        imageFavorite.snp.makeConstraints { make in
            make.right.equalTo(titleLabel).inset(15)
            make.top.equalTo(image.snp.bottom)
            make.size.equalTo(40)
        }
    }
}
