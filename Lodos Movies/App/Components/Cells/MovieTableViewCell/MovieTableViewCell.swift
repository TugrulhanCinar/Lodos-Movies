//
//  MovieTableViewCell.swift
//  Lodos Movies
//
//  Created by Tuğrul on 14.03.2024.
//

import UIKit

protocol MovieTableViewCellDelegate: AnyObject {
    func movieSection(_ sender: MovieTableViewCell, section: String)
}

struct MovieTableViewCellPresentation: Presentation {
    var id: String
    var imageUrl: String?
}

class MovieTableViewCell: BaseTableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    // MARK: - Variables
    
    var presentation: MovieTableViewCellPresentation? {
        didSet {
            setupUI()
        }
    }
    weak var delegate: MovieTableViewCellDelegate?
    
    // MARK: Life Cycle

    @IBAction func buttonOnTapMovie(_ sender: UIButton) {
        
        if let id = presentation?.id {
            delegate?.movieSection(self, section: id)

        }
    }
    
    private func setupUI() {
        
        if let imageUrl = presentation?.imageUrl {
            setImage(imagePath: imageUrl)
        } else {
            setBrokenImage()
        }
        
    }
    
    override func applyStyling() {
        
        super.applyStyling()
        viewContent.layer.cornerRadius = 12
        imageViewMovie.layer.cornerRadius = 12
    }
    
    private func setImage(imagePath: String){

        guard let url = URL(string: imagePath) else {

            print("Failed to present attachment due to an invalid url: ", imagePath)
            return
        }
        imageViewMovie.image  = nil
        imageViewMovie.isHidden = true
        indicatorView.isHidden = false
        indicatorView.startAnimating()

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error == nil {
                guard let unwrappedData = data, let image = UIImage(data: unwrappedData) else { return }
                DispatchQueue.main.async {
                    self.indicatorView.stopAnimating()
                    self.indicatorView.isHidden = true
                    self.imageViewMovie.isHidden = false
                    self.imageViewMovie.image = image
                }
            } else {
                self.setBrokenImage()
            }
        })
        task.resume()
    }
    
    private func setBrokenImage() {
        
        imageViewMovie.image = LocaleImage.brokenImage.getUIImage()
    }
}
