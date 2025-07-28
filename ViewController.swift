//
//  ViewController.swift
//  Dicee App
//
//  Created by Oleg Zhovtanskyi on 16/06/2025.
//

import UIKit

final class ViewController: UIViewController {
    static var diceName = "dice"
    
    private func gradient(_ view: UIView) -> CAGradientLayer{
        let gradient: CAGradientLayer = {
            let gradient = CAGradientLayer()
            gradient.frame = view.bounds
            gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0.2)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            return gradient
        }()
        return gradient
    }
    
    let veagsImage: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "vegas")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    
    
    let imageView1: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "dice1")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    let imageView2: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "dice1")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        let titleAtributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 26)]
        let titleString = NSAttributedString(string: "Roll", attributes: titleAtributes)
        button.setAttributedTitle(titleString, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonTapped() {
        animateDiceRoll(imageView1)
        animateDiceRoll(imageView2)
    }
    
    private func animateDiceRoll(_ diceImageView: UIImageView) {
        // First phase: shrink and rotate
        UIView.animate(withDuration: 0.15, animations: {
            diceImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                .rotated(by: .pi)
        }) { _ in
            // Change the image while it's small
            diceImageView.image = UIImage(named: ViewController.diceName + String(Int.random(in: 1...6)))
            
            // Second phase: grow back to normal size
            UIView.animate(withDuration: 0.25) {
                diceImageView.transform = .identity
            }
        }
    }
    
    private func addConstraits() {
        NSLayoutConstraint.activate([
            imageView1.centerXAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
            imageView1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            imageView1.widthAnchor.constraint(equalToConstant: view.frame.width / 3),
            imageView1.heightAnchor.constraint(equalToConstant: view.frame.width / 3)
        ])
        NSLayoutConstraint.activate([
            imageView2.centerXAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
            imageView2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            imageView2.widthAnchor.constraint(equalToConstant: view.frame.width / 3),
            imageView2.heightAnchor.constraint(equalToConstant: view.frame.width / 3)
        ])
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 350),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            veagsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            veagsImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            veagsImage.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8),
            veagsImage.heightAnchor.constraint(equalToConstant: view.frame.width * 0.8)
        ])
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(gradient(view))
        view.addSubview(veagsImage)
        view.addSubview(imageView1)
        view.addSubview(imageView2)
        view.addSubview(button)
        addConstraits()
        
    }
}

