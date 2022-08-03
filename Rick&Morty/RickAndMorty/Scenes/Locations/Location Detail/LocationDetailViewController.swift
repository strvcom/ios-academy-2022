//
//  LocationDetailViewController.swift
//  RickAndMorty
//
//  Created by Filip Haskovec on 26.07.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

final class LocationDetailViewController: UIViewController {
    enum Event {
        case didSelectLocation(location: Location)
    }
    
    
    @IBOutlet private var headerView: LocationDetailHeaderView!
    @IBOutlet private var tableView: UITableView!
    
    
    private lazy var backgroundView: UIView = {
        let view = UIBackgroundGradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let character: [Character] = {
        // Initialize with 100 Location mocks.
        (0...99).map { _ in
            Character.mock
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - Setup
private extension LocationDetailViewController {
    func setup() {
        setupView()
    }

    func setupView() {
        view.insertSubview(backgroundView, at: 0)
        view.addConstraints([
            view.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            view.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            view.leftAnchor.constraint(equalTo: backgroundView.leftAnchor)
        ])

        tableView.register(ResidentListItemCellTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

// MARK: - Table view data source
extension LocationDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        1
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        character.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResidentListItemCellTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let character = character[indexPath.row]

        cell.configure(with: character)

        return cell
    }
}
