//
//  HistoryView.swift
//  SenlaApp
//
//  Created by Igor Penkin on 09.04.2022.
//

import UIKit


enum HistorySectionType: Int {
    case recent
    case popular
    case ordinary
}

final class HistoryView: UIView {
    
    private let feedData = DataStore()
    private lazy var dataSource = makeDataSource()

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: CollectionViewLayoutFactory.historyFeedLayout())
        view.delegate = self
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .secondarySystemBackground
        addSubviews()
        makeConstraints()
        createSnapshot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension HistoryView: UICollectionViewDelegate {
    
}


private extension HistoryView {
    
    var recentFeeds: [RecentFeed] {
        feedData.recentFeeds
    }
    
    var popularFeeds: [PopularFeed] {
        feedData.popularFeed
    }
    
    var ordinaryFeeds: [OrdinaryFeed] {
        feedData.ordinaryFeed
    }
    
    func addSubviews() {
        addSubview(collectionView)
    }
    
    func makeConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func makeDataSource() -> UICollectionViewDiffableDataSource<HistorySectionType, HistoryCollectionItem> {
        let dataSource = UICollectionViewDiffableDataSource<
            HistorySectionType, HistoryCollectionItem
        >(collectionView: collectionView) { [weak self] collectionView, indexPath, item in
            guard let section = self?.dataSource.sectionIdentifier(for: indexPath.section) else {
                return .init(frame: .zero)
            }
//            switch section {
//            case .recent:
//                return self?.createRecentCell(with: item.content, for: indexPath)
//            default: return .init()
//            case .popular:
//                return self?.createRecentCell(with: item.content, for: indexPath)
//            case .ordinary:
//                return self?.createRecentCell(with: item.content, for: indexPath)
//            }
            return self?.createRecentCell(with: item.content, for: indexPath)
        }
        return dataSource
    }
    
    func createSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<HistorySectionType, HistoryCollectionItem>()
        snapshot.appendSections([.recent, .popular, .ordinary])
        snapshot.appendItems(recentFeeds.map { feed in
                .init(content: .recent(
                    configuration: .init(id: feed.id, title: feed.title, imageUrl: feed.imageUrl)
                )
            )
        }, toSection: .recent)
        snapshot.appendItems(popularFeeds.map { feed in
                .init(content: .popular(
                    configuration: .init(id: feed.id, title: feed.title, imageUrl: feed.imageUrl))
            )
        }, toSection: .popular)
        snapshot.appendItems(ordinaryFeeds.map { feed in
                .init(content: .ordinary(
                    configuration: .init(id: feed.id, title: feed.title, imageUrl: feed.imageUrl))
            )
        }, toSection: .ordinary)
        snapshot.insertSections([.ordinary, .popular], beforeSection: .recent)
        dataSource.apply(snapshot)
    }
    
    func createRecentCell(with item: HistoryCollectionItem.ItemType, for indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        switch item {
        case .recent(configuration: let configuration):
            cell.contentConfiguration = configuration
        case .popular(configuration: let configuration):
            cell.contentConfiguration = configuration
        case .ordinary(configuration: let configuration):
            cell.contentConfiguration = configuration
        }
        return cell
    }
}
