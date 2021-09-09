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
 
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .purple
        titleLabel.textColor = .yellow
        return titleLabel
    }()
    
    lazy var voteCountLabel: UILabel = {
        let voteCountLabel = UILabel()
        voteCountLabel.backgroundColor = .red
        return voteCountLabel
    }()
    
    func configureViews() {
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(voteCountLabel)
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(500)
            make.width.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.height.equalTo(500)
            make.width.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(image).inset(50)
            make.height.equalTo(100)
            make.right.left.equalTo(image)
        }
        
        voteCountLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
        }
    }
}
