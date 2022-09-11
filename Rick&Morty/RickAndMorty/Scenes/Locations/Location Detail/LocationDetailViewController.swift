//
//  LocationDetailViewController.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 19.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit
import Combine

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

    private var cancellables = Set<AnyCancellable>()
    private lazy var backgroundView: UIView = {
        let view = UIBackgroundGradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // swiftlint:disable:next implicitly_unwrapped_optional
    var store: LocationDetailStore!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        load()
        
    }
}

// MARK: - Setup
private extension LocationDetailViewController {
    func setup() {
        setupView()
        bindViewData()
    }

    func setupView() {
        tableView.backgroundView = backgroundView

        loadingIndicator.color = .appTintNavigationBar

        tableView.register(LocationDetailHeaderView.self)
        tableView.register(LocationDetailInfoCell.self)
        tableView.register(LocationDetailResidentCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = UIView()
    }

    func configure(for location: Location) {
        navigationItem.title = location.name

        self.tableView.reloadData()
    }
    
    func bindViewData() {
        store
            .$location
            .receive(on: DispatchQueue.main)
            .sink { [weak self] location in
                self?.configure(for: location)
            }
            .store(in: &cancellables)

        store
            .$residents
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}

// MARK: - Actions
private extension LocationDetailViewController {
    func load() {
        store.load()
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
            return store.residents.count
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
            let resident = store.residents[indexPath.row]

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
            locationInfoCell.configure(with: .systemInfoCircle, title: store.location.name)
        case .type:
            locationInfoCell.configure(with: .systemGlobe, title: store.location.type)
        case .dimension:
            locationInfoCell.configure(with: .systemRays, title: store.location.dimension)
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
