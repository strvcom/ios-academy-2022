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

    private lazy var backgroundView: UIView = {
        let view = UIBackgroundGradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let locations: [Location] = {
        // Initialize with 100 Location mocks.
        (0...99).map { _ in
            Location.mock
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - Setup
private extension LocationsListViewController {
    func setup() {
        setupView()
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

        loadingIndicator.color = .appTintNavigationBar
        loadingIndicator.isHidden = true

        tableView.register(LocationsListItemCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Table view data source
extension LocationsListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        1
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        locations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LocationsListItemCell = tableView.dequeueReusableCell(for: indexPath)
        let location = locations[indexPath.row]

        cell.configure(with: location)

        return cell
    }
}
