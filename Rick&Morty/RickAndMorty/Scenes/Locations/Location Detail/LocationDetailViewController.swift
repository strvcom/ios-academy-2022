//
//  LocationDetailViewController.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 19.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController {
    enum Section: Int, CaseIterable {
        case info = 0
        case residents = 1

        var header: String {
            switch self {
            case .info:
                return R.string.localizable.locationDetailInfo()
            case .residents:
                return R.string.localizable.locationDetailResidents()
            }
        }
    }

    enum InfoRow: Int {
        case name = 0
        case type = 1
        case dimension = 2
    }

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var loadingIndicator: UIActivityIndicatorView!

    private lazy var backgroundView: UIView = {
        let view = UIBackgroundGradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let location = Location.mock
    private let residents: [Character] = {
        // Initialize with 100 Character mocks.
        (0...99).map { _ in
            Character.mock
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        configure(for: location)
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

        loadingIndicator.color = .appTintNavigationBar

        tableView.register(LocationDetailHeaderView.self)
        tableView.register(LocationDetailInfoCell.self)
        tableView.register(LocationDetailResidentCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }

    func configure(for location: Location) {
        navigationItem.title = location.name

        self.tableView.reloadData()
    }
}

// MARK: - Table view data source & delegate
extension LocationDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        Section.allCases.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            return 0
        }

        switch section {
        case .info:
            return 3
        case .residents:
            return residents.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            return UITableViewCell()
        }

        switch section {
        case .info:
            let cell: LocationDetailInfoCell = tableView.dequeueReusableCell(for: indexPath)

            configure(locationInfoCell: cell, for: indexPath.row)

            return cell
        case .residents:
            let cell: LocationDetailResidentCell = tableView.dequeueReusableCell(for: indexPath)
            let resident = residents[indexPath.row]

            cell.configure(with: resident)

            return cell
        }
    }

    func configure(locationInfoCell: LocationDetailInfoCell, for row: Int) {
        guard
            let row = InfoRow(rawValue: row)
        else {
            locationInfoCell.configure(with: nil, title: "")
            return
        }

        switch row {
        case .name:
            locationInfoCell.configure(with: .systemInfoCircle, title: location.name)
        case .type:
            locationInfoCell.configure(with: .systemGlobe, title: location.type)
        case .dimension:
            locationInfoCell.configure(with: .systemRays, title: location.dimension)
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = Section(rawValue: section) else {
            return nil
        }

        let view: LocationDetailHeaderView = tableView.dequeueHeaderFooterView()

        view.configure(with: section.header)

        return view
    }
}
