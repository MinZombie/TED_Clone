//
//  PodcastDetailViewController.swift
//  TED_Clone
//
//  Created by 정덕호 on 2022/03/02.
//

import UIKit

class PodcastDetailViewController: UIViewController {

    
//MARK: - Properties
    
    private let tableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.backgroundColor = .backgroundColor
        tableview.separatorInset.left = 0
        tableview.separatorColor = UIColor(white: 1, alpha: 0.2)
        return tableview
    }()
    
    private let detailView: UIView = {
       let view = UIView()
        view.backgroundColor = .backgroundColor
        return view
    }()

    private let detailImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "PodcastImage1")
        return image
    }()
    
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "TED Talks Daily"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    
    private let detailText: UILabel = {
       let textview = UILabel()
        textview.text = "Lorem ipsum dolor sit er elorem ipsum dolor sit er eloror sit er elorem ipsum dolor sit er elorem ipsum dolor sit er psum dolor sit er elorem ipsum dolor or sit er elorem ipsum dolor sit er elLorem ipsum dolor sit er elorem ipsum dolor sit er eloror sit er elorem ipsum dolor sit er elorem ipsum dolor sit er psum dolor sit er elorem ipsum dolor or sit er elorem ipsum dolor sit er elLorem ipsum dolor sit er elorem ipsum dolor sit er eloror sit er elorem ipsum dolor sit er elorem ipsum dolor sit er psum dolor sit er elorem ipsum dolor or sit er elorem ipsum dolor sit er el"
        textview.textColor = .white
        textview.numberOfLines = 0
        textview.backgroundColor = .clear
        textview.font = UIFont.systemFont(ofSize: 17)
        return textview
    }()
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = false
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PodcastDetailViewCell.self, forCellReuseIdentifier: PodcastDetailViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.backButtonTitle = "TED 팟 캐스트"
        navigationController?.navigationBar.tintColor = .white
        makeLayout()
    }
    
    //MARK: - Helper Function
    private func makeLayout() {
        let newSize = detailText.sizeThatFits(view.frame.size)
        detailText.frame.size = newSize
        
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        tableView.addSubview(detailView)
        detailView.anchor(width: view.frame.width, height: 220 + detailText.frame.size.height)
        
        detailView.addSubview(detailImage)
        detailImage.anchor(top: detailView.topAnchor,left: detailView.leadingAnchor,paddingTop: 20,paddingLeft: 10,width: 150,height: 150)
        
        detailView.addSubview(detailLabel)
        detailLabel.anchor(left: detailImage.trailingAnchor, bottom: detailImage.bottomAnchor,right: detailView.trailingAnchor, paddingLeft: 10,paddingRight: 20)
        
        
        
        detailView.addSubview(detailText)
        detailText.anchor(top: detailImage.bottomAnchor,left: detailView.leadingAnchor,right: detailView.trailingAnchor,paddingTop: 20,paddingLeft: 10,paddingRight: 10)
        
    }


    
}

//MARK: - 테이블뷰 데이터 소스
extension PodcastDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PodcastDetailViewCell.identifier, for: indexPath) as? PodcastDetailViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}



//MARK: - 테이블뷰 델리게이터

extension PodcastDetailViewController: UITableViewDelegate {
    //다이나믹셀 검색
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return detailView
        }
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(PodcastPlayViewController(), animated: true)
    }
}



//MARK: - 커스텀 셀

class PodcastDetailViewCell: UITableViewCell {
    static let identifier = "DetailCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        cellSetting()
    }

        

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let cellImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrowtriangle.right.fill")
        image.tintColor = .white
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "To future generations of women, you are the awqeqwewqrewtertert"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "15:07  14 November 2020"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    
    func cellSetting() {
       addSubview(cellImage)
        cellImage.anchor(left: self.leadingAnchor,paddingLeft: 10,width: 20, height: 25)
        cellImage.centerY(inView: self)
    
        addSubview(nameLabel)
        nameLabel.anchor(left: cellImage.trailingAnchor,bottom: cellImage.topAnchor,right: self.trailingAnchor,paddingLeft: 20,paddingBottom: -10,paddingRight: 10)
        
        addSubview(timeLabel)
        timeLabel.anchor(top: cellImage.bottomAnchor,left: cellImage.trailingAnchor, paddingTop: -10,paddingLeft: 20)
    }
    
}