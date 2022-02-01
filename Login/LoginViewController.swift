//
//  LoginViewController.swift
//  RxDrill
//
//  Created by Idan Boadana on 01/02/2022.
//

import UIKit

class LoginViewController: UIViewController {
    // Requirements:
    //
    // * the login button should be disabled until both fields have values.
    //
    // * pressing the login button should perform the 'userService' login,
    //   and return the appropriate result to the view controller
    //   success should segue to the next controller
    //   failure should print to console and clear the iputs.
    //
    // * clear the text fields in either case.
    //
    // ** dispose bag only allowed in the controller
    // ** Delete as much imperative code as you can.
    // ** Have fun.

    private let mainSegue = "mainSegue"
    
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
    
    private let viewModel = LoginViewModel(userService: DI.userService)
    
    // Comment out
    // private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewModel.isLoggedIn {
            // For convenience..
            performSegue(withIdentifier: mainSegue, sender: nil)
        }
        
        setupUi()
        setupRx()
    }
    
    private func setupUi() {
        title = "RxDrill"
    }
    
    private func setupRx() {
        // Perform viewModel bindings here
    }
    
    @IBAction func didPressLogin(_ sender: UIButton) {
        guard let name = nameTextField.text, let password = passwordTextField.text else { return }
        
        let loginResult = viewModel.login(userName: name, password: password)
        switch loginResult {
        case .success:
            loginSucess()
        case .failure(let error):
            loginFailure(message: error.localizedDescription)
        }
    }
    
    private func loginSucess() {
        clear()
        performSegue(withIdentifier: mainSegue, sender: nil)
    }
    
    private func loginFailure(message: String) {
        clear()
        print(message)
    }
    
    private func clear() {
        nameTextField.text = nil
        passwordTextField.text = nil
    }
}

