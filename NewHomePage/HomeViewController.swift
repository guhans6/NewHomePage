//
//  LoggedInViewController.swift
//  CRM Project
//
//  Created by guhan-pt6208 on 25/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let titleLabel = UILabel()
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
        view.backgroundColor = .systemBackground
//        title = "Home".localized()

        configureUI()
        configureCollectionView()
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(segmentedView)
        scrollView.addSubview(collectionView)
        
        // Set up constraints to position and size the scroll view and its contents
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 18),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: scrollView.trailingAnchor),
            segmentedView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            segmentedView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 18),
            segmentedView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            segmentedView.heightAnchor.constraint(equalToConstant: 44),
            
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: segmentedView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
            collectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // Set the content size of the scroll view to match the size of its contents
        scrollView.contentSize = CGSize(width: view.bounds.width, height: collectionView.frame.maxY + 20)
    }
    
    private func configureUI() {
        
        configureTitleLabel()
        configureSegmentedControl()
        

    }
    
    private func configureTitleLabel() {
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let fontMetrics = UIFontMetrics(forTextStyle: .largeTitle)
        titleLabel.font = fontMetrics.scaledFont(for: .systemFont(ofSize: 30, weight: .bold))
        titleLabel.text = "Hello "
        
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
//            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor)
//        ])
    }
    
    private func configureSegmentedControl() {
        
        
        view.addSubview(segmentedView)

        // Set up constraints to position and size the stack view
        segmentedView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            segmentedView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
//            segmentedView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
//            segmentedView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
//            segmentedView.heightAnchor.constraint(equalToConstant: 44)
//        ])
    }
    
    private func configureCollectionView() {
        
        // Configure collection view
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 6)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: 300, height: 200)
        collectionView.collectionViewLayout = layout
        
        // Register cell class
        collectionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: "TableCollectionViewCell")
        
        // Add to view
        view.addSubview(collectionView)
        
//        NSLayoutConstraint.activate([
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            collectionView.topAnchor.constraint(equalTo: segmentedView.bottomAnchor),
//            collectionView.heightAnchor.constraint(equalToConstant: 300)
//        ])
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
