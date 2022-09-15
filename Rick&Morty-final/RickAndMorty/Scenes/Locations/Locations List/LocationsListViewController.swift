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
    @IBOutlet private var errorLabel: UILabel!

    private lazy var backgroundView: UIView = {
        let view = UIBackgroundGradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var cancellables = Set<AnyCancellable>()

    // swiftlint:disable:next implicitly_unwrapped_optional
    var store: LocationsListStore!
    weak var coordinator: LocationsListViewEventHandling?

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

        view.insertSubview(backgroundView, at: 0)
        view.addConstraints([
            view.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            view.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            view.leftAnchor.constraint(equalTo: backgroundView.leftAnchor)
        ])

        errorLabel.dynamicFont = .appItemLargeTitle
        errorLabel.textColor = .appTextItemTitle
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center
        errorLabel.text = R.string.localizable.generalStateErrorSomethingWentWrong()

        loadingIndicator.color = .appTintNavigationBar

        tableView.register(LocationsListItemCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }

    func configure(for state: LocationsListStore.State) {
        let isLoading: Bool
        let hasError: Bool

        switch state {
        case .initial, .loading:
            isLoading = true
            hasError = false
        case .failed:
            isLoading = false
            hasError = true
        case .finished:
            isLoading = false
            hasError = false
        }

        errorLabel.isHidden = !hasError
        tableView.isHidden = hasError || isLoading
        if isLoading, !hasError {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }
    }

    func bindViewData() {
        store
            .$state
            .sink { [weak self] state in
                self?.configure(for: state)
            }
            .store(in: &cancellables)

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

    func loadMoreIfNeeded(for location: Location) {
        Task {
            await store.loadMoreIfNeeded(for: location)
        }
    }
}

// MARK: - Table view data source
extension LocationsListViewController: UITableViewDataSource {
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

// MARK: - Table view delegate
extension LocationsListViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = store.locations[indexPath.row]

        coordinator?.handle(event: .didSelectLocation(location: location))
    }

    func tableView(_: UITableView, willDisplay _: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard
            indexPath.row+1 >= store.locations.count,
            let location = store.locations.last
        else {
            return
        }

        loadMoreIfNeeded(for: location)
    }
}
