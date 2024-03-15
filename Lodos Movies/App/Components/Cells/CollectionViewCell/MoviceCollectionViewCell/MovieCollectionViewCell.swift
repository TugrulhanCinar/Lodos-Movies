//
//  MovieCollectionViewCell.swift
//  Lodos Movies
//
//  Created by Tuğrul on 16.03.2024.
//

import UIKit

protocol MovieCollectionViewCellDelegate: AnyObject {
    func movieSection(_ sender: MovieCollectionViewCell, section: String)
}

struct MovieCollectionViewCellPresentation: Presentation {
    var id: String
    var imageUrl: String?
}

class MovieCollectionViewCell: BaseCollectionViewCell {

    // MARK: Outlets
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    // MARK: - Variables
    
    var presentation: MovieCollectionViewCellPresentation? {
        didSet {
            setupUI()
        }
    }
    weak var delegate: MovieCollectionViewCellDelegate?

    
    // MARK: Life Cycle

    private func setupUI() {
        
        if let imageUrl = presentation?.imageUrl {
            setImage(imagePath: imageUrl)
        } else {
            setBrokenImage()
        }
        
    }
    
    @IBAction func buttonOnTapMovie(_ sender: UIButton) {
        
        if let id = presentation?.id {
            delegate?.movieSection(self, section: id)

        }
    }
    
    override func applyStyling() {
        
        super.applyStyling()
        viewContent.layer.cornerRadius = LodosMoviesRadiusConstants.lowCornerRadius
        imageViewMovie.layer.cornerRadius = LodosMoviesRadiusConstants.lowCornerRadius
    }
    
    private func setImage(imagePath: String) {

        guard let url = URL(string: imagePath) else {

            print("Failed to present attachment due to an invalid url: ", imagePath)
            return
        }
        imageViewMovie.image  = nil
        imageViewMovie.isHidden = true
        indicatorView.unHiddenAndStartAnimation()

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error == nil {
                guard let unwrappedData = data, let image = UIImage(data: unwrappedData) else { return }
                DispatchQueue.main.async {
                    self.indicatorView.hiddenAndStopAnimation()
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
