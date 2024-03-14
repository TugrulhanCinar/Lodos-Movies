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
    
    // MARK: Life Cycle
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        searchBarMovie.delegate = self
    }
}

// MARK: - SearchBarTableViewCellDelegate

extension SearchBarTableViewCell: UISearchBarDelegate {
        
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        delegate?.textChanged(self, text: searchText)
    }
}
