//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Rohit Sharma on 17/11/22.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate {
    
    var background : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "image-11")
        return imageView
    }()

    var searchBar : UISearchBar = {
       let search = UISearchBar()
        search.placeholder = "Search Weather of City"
        search.translatesAutoresizingMaskIntoConstraints = false
        search.searchTextField.textColor = .white
        return search
    }()
    
    var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "cloud.drizzle")
        imageView.tintColor = .label
        return imageView
    }()
    
    var temp : UILabel = {
        let label = UILabel()
        label.text = "22"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 60, weight: .bold)
        label.textColor = UIColor(named: "weatherColor")
        return label
    }()
    
    var degree : UILabel = {
        let label = UILabel()
        label.text = "°C"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 60, weight: .medium)
        label.textColor = UIColor(named: "weatherColor")
        return label
    }()
    
    var city : UILabel = {
        let label = UILabel()
        label.text = "Kanpur"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.textColor = UIColor(named: "weatherColor")
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.placeholder = " Search..."
        searchBar.delegate = self
        //searchBar.barTintColor = .black
        searchBar.barStyle = .black

        view.addSubview(background)
        view.addSubview(searchBar)
        view.addSubview(imageView)
        view.addSubview(temp)
        view.addSubview(degree)
        view.addSubview(city)
        
        applyConstraints()
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        background.frame = view.bounds
    }
    
    func  applyConstraints(){
      let  searchBarConstraints = [
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        searchBar.widthAnchor.constraint(equalToConstant: 350)
      ]
        
      let  imageViewConstraints = [
        imageView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
        imageView.heightAnchor.constraint(equalToConstant: 150),
        imageView.widthAnchor.constraint(equalToConstant: 150)
      ]
      
     let degreeConstraints = [
        degree.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
        degree.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
       // degree.heightAnchor.constraint(equalToConstant: 50)
     ]
     
      let tempConstraints = [
      
       temp.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
        temp.trailingAnchor.constraint(equalTo: degree.leadingAnchor, constant: -15),
       // temp.heightAnchor.constraint(equalToConstant: 50)
        
      ]
        
        let cityConstraints = [
        
            city.topAnchor.constraint(equalTo: temp.bottomAnchor, constant: 5),
            city.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
            
        ]
        NSLayoutConstraint.activate(searchBarConstraints)
        NSLayoutConstraint.activate(imageViewConstraints)
        NSLayoutConstraint.activate(degreeConstraints)
        NSLayoutConstraint.activate(tempConstraints)
        NSLayoutConstraint.activate(cityConstraints)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchBar.text)
    }
}
