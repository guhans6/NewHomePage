//
//  LoggedInViewController.swift
//  CRM Project
//
//  Created by guhan-pt6208 on 25/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let reservationLabel = UILabel()
    private let mealTimes = ["All", "Breakfast", "Lunch", "Dinner"]
    private lazy var segmentedControl = UISegmentedControl(items: mealTimes)
    private let segmentedView = SegmentedStackView()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let img = UIImage(named: "Table")
    
    private let scrollView = UIScrollView()
    deinit {
        print("Login deinitialized")
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
//        title = "Home".localized()
        
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 6)
        
        // Set up constraints to position and size the scroll view and its contents
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        // Set the content size of the scroll view to match the size of its contents
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        configureUI()
    }
    
    private func configureUI() {
        
        configureTitleLabel()
        configureReservationLabel()
        configureSegmentedControl()
        configureCollectionView()
    }
    
    private func configureTitleLabel() {
        
        scrollView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let fontMetrics = UIFontMetrics(forTextStyle: .largeTitle)
        titleLabel.font = fontMetrics.scaledFont(for: .systemFont(ofSize: 30, weight: .bold))
        titleLabel.text = "Hello "
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 18),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: scrollView.trailingAnchor),
        ])
    }
    
    private func configureReservationLabel() {
        
        scrollView.addSubview(reservationLabel)
        reservationLabel.translatesAutoresizingMaskIntoConstraints = false
        let fontMetrics = UIFontMetrics(forTextStyle: .title2)
        reservationLabel.font = fontMetrics.scaledFont(for: .systemFont(ofSize: 20, weight: .semibold))
        reservationLabel.textColor = .label
        reservationLabel.text = "Today's Table Reservation"
        
        NSLayoutConstraint.activate([
            reservationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            reservationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            reservationLabel.trailingAnchor.constraint(lessThanOrEqualTo: scrollView.trailingAnchor),
        ])
    }
    
    private func configureSegmentedControl() {
        
        scrollView.addSubview(segmentedView)
        
        segmentedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedView.topAnchor.constraint(equalTo: reservationLabel.bottomAnchor, constant: 20),
            segmentedView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            segmentedView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            segmentedView.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    private func configureCollectionView() {
        
        scrollView.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 6)
        collectionView.backgroundColor = .systemGray6
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: 300, height: 200)
        collectionView.collectionViewLayout = layout
        
        // Register cell class
        collectionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: "TableCollectionViewCell")
        
        // Add to view
//        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: segmentedView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc private func selectMealTime(_ sender: UISegmentedControl) {
//        selectedMealTime = mealTimes[sender.selectedSegmentIndex]
//        filterTables()
//        tableView.reloadData()
    }
    
   
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // Replace with your actual data source count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableCollectionViewCell", for: indexPath) as? TableCollectionViewCell else {
            fatalError("Unable to dequeue TableCollectionViewCell")
        }
        
        // Configure cell with data
        cell.imageView.image = img // Replace with your actual image
        cell.nameLabel.text = "Booked by: John Doe" // Replace with your actual booked by information
        cell.tableNameLabel.text = "Table 1" // Replace with your actual table name
        
        return cell
    }
}
