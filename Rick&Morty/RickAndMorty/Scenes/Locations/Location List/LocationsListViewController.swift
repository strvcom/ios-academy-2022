//
//  LocationsListViewController.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 18.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Combine
import UIKit
import SwiftUI

class LocationsListViewController: UIViewController {
    enum Event {
        case didSelectLocation(location: Location)
    }

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var loadingIndicator: UIActivityIndicatorView!

    weak var coordinator: LocationsListViewEventHandling?

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

//        let charactersList = UIHostingController(rootView: CharactersListView())
//        charactersList.view.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(charactersList.view)
//        view.addConstraints([
//            view.topAnchor.constraint(equalTo: charactersList.view.topAnchor),
//            view.leftAnchor.constraint(equalTo: charactersList.view.leftAnchor),
//            charactersList.view.widthAnchor.constraint(equalToConstant: 100),
//            charactersList.view.heightAnchor.constraint(equalToConstant: 100)
//        ])

        tableView.backgroundView = backgroundView
        
        loadingIndicator.color = .appTintNavigationBar
        loadingIndicator.isHidden = true

        tableView.register(LocationsListItemCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Table view data source
extension LocationsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = locations[indexPath.row]
        coordinator?.handle(event: .didSelectLocation(location: location))
    }

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
