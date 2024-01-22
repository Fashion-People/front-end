//
//  RegisterImageViewController.swift
//  PersonalCloset
//
//  Created by Bowon Han on 12/30/23.
//

import UIKit
import SnapKit

protocol RegisterImageNavigation : AnyObject {
    func presentResultVC()
    func backToMainVC()
}

class RegisterImageViewController : BaseViewController {
    weak var coordinator : RegisterImageNavigation!
    
    init(coordinator: RegisterImageNavigation) {
        self.coordinator = coordinator
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabTopViewButtons()
//        buttonConfiguration()
    }
    
    private let imageInputStackView1 : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 15
        
        return stackView
    }()
    
    private let imageInputStackView2 : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 15
        
        return stackView
    }()
    
    private var imageInput1 = ImageInputButton()
    private var imageInput2 = ImageInputButton()
    private var imageInput3 = ImageInputButton()
    private var imageInput4 = ImageInputButton()
    
    private lazy var registerButton : UIButton = {
        let button = UIButton()
        button.setTitle("적합도를 알려주세요!", for: .normal)
        button.setTitleColor(.darkBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.skyBlue.cgColor
        button.layer.backgroundColor = UIColor.skyBlue.cgColor
        button.addAction(
            UIAction { _ in
                self.tabResultButton()
            },
            for: .touchUpInside
        )
        return button
    }()
    
//    private func buttonConfiguration() {
//        imageInput1.tag = 1
//        imageInput2.tag = 2
//        imageInput3.tag = 3
//        imageInput4.tag = 4
//        
//        imageInput1.addAction(UIAction { _ in
//            self.tabImageButton(tag: 1)
//        }, for: .touchUpInside)
//        
//        imageInput2.addAction(UIAction { _ in
//            self.tabImageButton(tag: 2)
//        }, for: .touchUpInside)
//        
//        imageInput3.addAction(UIAction { _ in
//            self.tabImageButton(tag: 3)
//        }, for: .touchUpInside)
//        
//        imageInput4.addAction(UIAction { _ in
//            self.tabImageButton(tag: 4)
//        }, for: .touchUpInside)
//    }
    
//    private func tabImageButton(tag: Int) {
//        let imagePicker = UIImagePickerController()
//
//        imagePicker.delegate = self
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.allowsEditing = true
//
//        imagePicker.view.tag = tag
//
//        self.present(imagePicker, animated: true)
//    }

    private func tabTopViewButtons(){
        topView.backButton.addAction(UIAction{ _ in
            self.tabBackButton()
        }, for: .touchUpInside)
        
        topView.iconButton.addAction(UIAction{ _ in
            self.tabMainIcon()
        }, for: .touchUpInside)
    }
    
    private func tabResultButton() {
        // 결과 버튼 눌렀을대
        coordinator.presentResultVC()
    }
    
    private func tabBackButton() {
        // topview의 back button 눌렀을때 
        coordinator.backToMainVC()
    }
    
    private func tabMainIcon() {
        coordinator.backToMainVC()
    }
    
    override func setLayout() {
        super.setLayout()
        
        [imageInput1,imageInput2].forEach {
            imageInputStackView1.addArrangedSubview($0)
        }
        
        [imageInput3,imageInput4].forEach {
            imageInputStackView2.addArrangedSubview($0)
        }
        
        [imageInputStackView1,
         imageInputStackView2,
         registerButton].forEach {
            view.addSubview($0)
        }
        
        imageInputStackView1.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        imageInputStackView2.snp.makeConstraints {
            $0.top.equalTo(imageInputStackView1.snp.bottom).offset(15)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(imageInputStackView2.snp.bottom).offset(40)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(230)
            $0.height.equalTo(50)
        }
    }
}

//extension RegisterImageViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController,
//                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        picker.dismiss(animated: false) { () in
//            let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
//            
//            if let tag = picker.view?.tag {
//                switch tag {
//                case 1:
//                    self.imageInput1.setImage(image, for: .normal)
//                case 2:
//                    self.imageInput2.setImage(image, for: .normal)
//                case 3:
//                    self.imageInput3.setImage(image, for: .normal)
//                case 4:
//                    self.imageInput4.setImage(image, for: .normal)
//                default:
//                    break
//                }
//            }
//        }
//    }
//}


