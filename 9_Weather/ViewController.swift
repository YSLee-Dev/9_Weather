//
//  ViewController.swift
//  9_Weather
//
//  Created by 이윤수 on 2022/02/07.
//

import UIKit

class ViewController: UIViewController {

    var cityTF : UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "도시를 영문으로 입력해주세요."
        return tf
    }()
    
    var cityLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "서울"
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var conditionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "맑음"
        return label
    }()
    
    var temLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10도"
        return label
    }()
    
    var highTemLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "11도"
        return label
    }()
    
    var lowTemLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "9도"
        return label
    }()
    
    var weatherImg : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = .black
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var loadBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("가져오기", for: .normal)
        return btn
    }()
    
    var searchStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    var temStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .leading
        stackView.distribution = .fill
        return stackView
    }()
    
    override func viewDidLoad() {
       viewSet()
    }
    
    private func viewSet(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.weatherImg)
        NSLayoutConstraint.activate([
            self.weatherImg.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5 ,constant: -20),
            self.weatherImg.heightAnchor.constraint(equalTo: self.weatherImg.widthAnchor),
            self.weatherImg.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.weatherImg.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        self.view.addSubview(self.cityLabel)
        NSLayoutConstraint.activate([
            self.cityLabel.topAnchor.constraint(equalTo: self.weatherImg.topAnchor),
            self.cityLabel.heightAnchor.constraint(equalTo: self.weatherImg.heightAnchor, multiplier: 0.25),
            self.cityLabel.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 20),
            self.cityLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        self.view.addSubview(self.conditionLabel)
        NSLayoutConstraint.activate([
            self.conditionLabel.centerYAnchor.constraint(equalTo: self.weatherImg.centerYAnchor),
            self.conditionLabel.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 20),
        ])
        
        self.view.addSubview(self.temLabel)
        NSLayoutConstraint.activate([
            self.temLabel.bottomAnchor.constraint(equalTo: self.weatherImg.bottomAnchor, constant: -16),
            self.temLabel.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 20),
        ])
    
        self.view.addSubview(self.temStackView)
        NSLayoutConstraint.activate([
            self.temStackView.bottomAnchor.constraint(equalTo: self.weatherImg.bottomAnchor),
            self.temStackView.heightAnchor.constraint(equalToConstant: 16),
            self.temStackView.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 20),
            self.temStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        self.temStackView.addArrangedSubview(self.highTemLabel)
        self.temStackView.addArrangedSubview(self.lowTemLabel)
        
        
        self.view.addSubview(self.searchStackView)
        NSLayoutConstraint.activate([
            self.searchStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.searchStackView.topAnchor.constraint(equalTo: self.weatherImg.bottomAnchor, constant: 20),
            self.searchStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.searchStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        self.searchStackView.addArrangedSubview(self.cityTF)
        self.searchStackView.addArrangedSubview(self.loadBtn)
        NSLayoutConstraint.activate([
            self.loadBtn.widthAnchor.constraint(equalToConstant: 70),
            self.loadBtn.heightAnchor.constraint(equalTo: self.searchStackView.heightAnchor),
            
            self.cityTF.widthAnchor.constraint(equalTo: self.searchStackView.widthAnchor, multiplier: 1, constant: -80),
            self.cityTF.heightAnchor.constraint(equalTo: self.searchStackView.heightAnchor),
        ])
    }
}

