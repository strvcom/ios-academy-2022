//
//  LocationsListViewController.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 18.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Combine
import UIKit

class LocationsListViewController: UIViewController {
    enum Event {
        case didSelectLocation(location: Location)
    }

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var loadingIndicator: UIActivityIndicatorView!

    // swiftlint:disable:next implicitly_unwrapped_optional
    var store: LocationsListStore!
    weak var coordinator: LocationsListViewEventHandling?

    private lazy var backgroundView: UIView = {
        let view = UIBackgroundGradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        load()
    }
}

// MARK: - Setup
private extension LocationsListViewController {
    func setup() {
        setupView()
        bindViewData()
    }

    func setupView() {
        navigationItem.title = R.string.localizable.tabTitleLocations()

        tableView.backgroundView = backgroundView
        
        loadingIndicator.color = .appTintNavigationBar
        loadingIndicator.isHidden = true

        tableView.register(LocationsListItemCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func bindViewData() {
        store
            .$locations
            .sink { [weak self] _ in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - Actions
private extension LocationsListViewController {
    func load() {
        Task {
            await store.load()
        }
    }
}

// MARK: - Table view data source
extension LocationsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = store.locations[indexPath.row]
        coordinator?.handle(event: .didSelectLocation(location: location))
    }

    func numberOfSections(in _: UITableView) -> Int {
        1
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        store.locations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LocationsListItemCell = tableView.dequeueReusableCell(for: indexPath)
        let location = store.locations[indexPath.row]

        cell.configure(with: location)

        return cell
    }
}
