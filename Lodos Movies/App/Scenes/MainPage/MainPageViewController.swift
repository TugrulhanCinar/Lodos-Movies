//
//  MainPageViewController.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.

import UIKit

protocol MainPageDisplayLogic: AnyObject {

    func displayInitializeResult(viewModel: MainPage.Initialize.ViewModel)
    func displaySearchResult(viewModel: MainPage.Search.ViewModel)
}

class MainPageViewController: BaseViewController, MainPageDisplayLogic {
    
    var interactor: MainPageBusinessLogic?
    var router: (NSObjectProtocol & MainPageRoutingLogic & MainPageDataPassing)?
    
    // MARK: - Variables
    
    private var search: [Search] = []
    private var searchTimer: Timer?

    // MARK: Outlets
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tableViewMovies: UITableView!
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
        registerTableView()
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
        
        tableViewMovies.dataSource = self
        tableViewMovies.delegate = self
        
        let movieCell = UINib(nibName: TableViewCellEnum.movieCell.rawValue, bundle: Bundle(for: MainPageViewController.self))
        let searchCell = UINib(nibName: TableViewCellEnum.searchCell.rawValue, bundle: Bundle(for: SearchBarTableViewCell.self))
        
        tableViewMovies.register(movieCell, forCellReuseIdentifier: TableViewCellEnum.movieCell.rawValue)
        tableViewMovies.register(searchCell, forCellReuseIdentifier: TableViewCellEnum.searchCell.rawValue)
    }

}

// MARK: - Display Logic

extension MainPageViewController {
    
    func displayInitializeResult(viewModel: MainPage.Initialize.ViewModel) { }
    
    func displaySearchResult(viewModel: MainPage.Search.ViewModel) { 
        
        if viewModel.isContinue {
            indicator.unHiddenAndStartAnimation()
            tableViewMovies.restore()
        } else if let searchList = viewModel.results?.search, !viewModel.isContinue {
            tableViewMovies.restore()
            self.search = searchList
            indicator.hiddenAndStopAnimation()
            tableViewMovies.reloadData()
        } else {
            tableViewMovies.setEmptyView(title: "Bulunmadı", message: "Aradığınız isimde bir film bulunmadı")
        }
    }
}
// MARK: - Viewcontroller

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return search.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let searchCell = tableViewMovies.dequeueReusableCell(withIdentifier: TableViewCellEnum.searchCell.rawValue) as! SearchBarTableViewCell
            searchCell.delegate = self
            return searchCell
        } else {
            if let movie = search[safe: indexPath.row - 1] {
                let movieCell = tableViewMovies.dequeueReusableCell(withIdentifier: TableViewCellEnum.movieCell.rawValue) as! MovieTableViewCell
                let moviePresentation = MovieTableViewCellPresentation(id: movie.imdbID, imageUrl: movie.poster)
                movieCell.presentation = moviePresentation
                movieCell.delegate = self
                return movieCell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return indexPath.row == 0 ? 70 : 500
    }
    
}

// MARK: - MovieTableViewCellDelegate

extension MainPageViewController: MovieTableViewCellDelegate {
    
    func movieSection(_ sender: MovieTableViewCell, section: String) {
        
        // TODO: Add on tap a cell
        print("tapped: \(section)")
    }
    
    
}

// MARK: - SearchBarTableViewCellDelegate

extension MainPageViewController: SearchBarTableViewCellDelegate {
    
    func textChanged(_ sender: SearchBarTableViewCell, text: String?) {
        
        if let text = text, text.count > 1 {
            interactor?.search(request: MainPage.Search.Request(searchText: text))
        }
    }
}
