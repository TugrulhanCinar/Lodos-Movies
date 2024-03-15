//
//  MainPageViewController.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.

import UIKit

protocol MainPageDisplayLogic: AnyObject {

    func displayInitializeResult(viewModel: MainPage.Initialize.ViewModel)
    func displaySearchResult(viewModel: MainPage.Search.ViewModel)
    func displaySelectedMovieResult(viewModel: MainPage.SelectedMovie.ViewModel)
}

class MainPageViewController: BaseViewController, MainPageDisplayLogic {
    
    var interactor: MainPageBusinessLogic?
    var router: (NSObjectProtocol & MainPageRoutingLogic & MainPageDataPassing)?
    
    // MARK: - Variables
    
    private var search: [Search] = []
    private var searchTimer: Timer?

    // MARK: Outlets
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionViewMovies: UICollectionView!
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        
        super.viewDidLoad()
        indicator.isHidden = true
        addCustomColumnLayout()
        setup()
        registerTableView()
        addSearchController()
    }
    
    private func addCustomColumnLayout() {
        
        let columnLayout = ColumnFlowLayout(
            cellsPerRow: 2,
            minimumInteritemSpacing: 4,
            minimumLineSpacing: 4,
            sectionInset: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        )
        collectionViewMovies.collectionViewLayout = columnLayout
    }
    
    private func addSearchController() {
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.searchTextField.textColor = .white
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup

    private func setup() {
        
        let viewController = self
        let interactor = MainPageInteractor()
        let presenter = MainPagePresenter()
        let router = MainPageRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    private func registerTableView() {
        
        collectionViewMovies.dataSource = self
        collectionViewMovies.delegate = self
        
        let movieCollection = UINib(nibName: TableViewCellEnum.movieCell.rawValue, bundle: Bundle(for: MovieCollectionViewCell.self))
        
        collectionViewMovies.register(movieCollection, forCellWithReuseIdentifier: TableViewCellEnum.movieCell.rawValue)
        
    }

}

// MARK: - Display Logic

extension MainPageViewController {
    
    func displayInitializeResult(viewModel: MainPage.Initialize.ViewModel) { }
    
    func displaySearchResult(viewModel: MainPage.Search.ViewModel) { 
        
        collectionViewMovies.restore()
        if !viewModel.isContinue && (viewModel.results == nil || viewModel.results?.search.isEmpty == true) {
            indicator.hiddenAndStopAnimation()
            collectionViewMovies.setEmptyView(title: UIMessageConstant.notFoundTitle, message: UIMessageConstant.notFoundMSG)
        } else if let searchList = viewModel.results?.search, !viewModel.isContinue {
            collectionViewMovies.restore()
            self.search = searchList
            indicator.hiddenAndStopAnimation()
            collectionViewMovies.reloadData()
        } else {
            indicator.unHiddenAndStartAnimation()
            collectionViewMovies.restore()
        }
    }
    
    func displaySelectedMovieResult(viewModel: MainPage.SelectedMovie.ViewModel) {
        
        router?.routeToMovieDetail()
    }

}
// MARK: - UICollectionViewDelegate

extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return search.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let movie = search[safe: indexPath.row] {
            let movieCell = collectionViewMovies.dequeueReusableCell(withReuseIdentifier: TableViewCellEnum.movieCell.rawValue, for: indexPath) as! MovieCollectionViewCell
            let presentation = MovieCollectionViewCellPresentation(id: movie.imdbID, imageUrl: movie.poster)
            
            movieCell.presentation = presentation
            movieCell.delegate = self
            
            return movieCell
        }
        
        return UICollectionViewCell()
    }
}

// MARK: - MovieCollectionViewCellDelegate

extension MainPageViewController: MovieCollectionViewCellDelegate {
    
    func movieSection(_ sender: MovieCollectionViewCell, section: String) {
        
        interactor?.selectedMovie(request: MainPage.SelectedMovie.Request(movieID: section))
    }
}

// MARK: - UISearchResultsUpdating

extension MainPageViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            if let searchText =  searchController.searchBar.searchTextField.text, !searchText.isEmpty {
                self.interactor?.search(request: MainPage.Search.Request(searchText: searchText))
            } else {
                self.search.removeAll()
                self.collectionViewMovies.reloadData()
                self.collectionViewMovies.restore()
            }
        })
    }
}
