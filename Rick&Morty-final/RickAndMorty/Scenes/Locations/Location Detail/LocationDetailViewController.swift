//
//  LocationDetailViewController.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 19.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Combine
import UIKit

class LocationDetailViewController: UIViewController {
    enum Event {
        case didSelectCharacter(character: Character)
    }

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
    @IBOutlet private var errorLabel: UILabel!

    private lazy var backgroundView: UIView = {
        let view = UIBackgroundGradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var cancellables = Set<AnyCancellable>()

    // swiftlint:disable:next implicitly_unwrapped_optional
    var store: LocationDetailStore!
    weak var coordinator: LocationDetailViewEventHandling?

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

        tableView.register(LocationDetailHeaderView.self)
        tableView.register(LocationDetailInfoCell.self)
        tableView.register(LocationDetailResidentCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }

    func configure(for state: LocationDetailStore.State) {
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

    func configure(for location: Location) {
        navigationItem.title = location.name

        DispatchQueue.main.async {
            self.tableView.reloadData()
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
            .$location
            .compactMap { $0 }
            .sink { [weak self] location in
                self?.configure(for: location)
            }
            .store(in: &cancellables)

        store
            .$residents
            .sink { [weak self] _ in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - Actions
private extension LocationDetailViewController {
    func load() {
        Task {
            await store.load()
        }
    }
}

// MARK: - Table view data source
extension LocationDetailViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        Section.allCases.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            return 0
        }

        switch section {
        case .info:
            return store.location == nil ? 0 : 3
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
            let location = store.location,
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

// MARK: - Table view delegate
extension LocationDetailViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resident = store.residents[indexPath.row]

        coordinator?.handle(event: .didSelectCharacter(character: resident))
    }
}
