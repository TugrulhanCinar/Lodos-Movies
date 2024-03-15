//
//  SearchBarTableViewCell.swift
//  Lodos Movies
//
//  Created by Tuğrul on 14.03.2024.
//

import UIKit

protocol SearchBarTableViewCellDelegate: AnyObject {
    func textChanged(_ sender: SearchBarTableViewCell, text: String?)
}

class SearchBarTableViewCell: BaseTableViewCell {
    
    // MARK: Outlets

    @IBOutlet weak var searchBarMovie: UISearchBar!
    
    // MARK: Variables

    weak var delegate: SearchBarTableViewCellDelegate?
    private var searchTimer: Timer?
    
    // MARK: Life Cycle
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        searchBarMovie.delegate = self
    }
    
    override func applyStyling() {
        
        super.applyStyling()
        searchBarMovie.placeholder = UIMessageConstant.searchBarTitle
    }
}

// MARK: - SearchBarTableViewCellDelegate

extension SearchBarTableViewCell: UISearchBarDelegate {
        
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchTimer?.invalidate()
        
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            self.delegate?.textChanged(self, text: searchText)
        })
    }
}
