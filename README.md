# Rx-Drill-Swift
A small project designed in imperative MVVM that needs to be refactored into Reactive code (RxSwift, Combine)

## **LoginViewController Requirements:**
* the login button should be disabled until both fields have values.
* pressing the login button should perform the 'userService' login,
  and return the appropriate result to the view controller
  success should segue to the next controller
  failure should print to console and clear the iputs.
* clear the text fields in either case.

## MainViewController Requirements:
* Implement the search mechanism in Rx (UTextField typing -> viewModel -> table data + reload).
* Throttle the typing to 0.3 seconds before searching begins.
* Pressing the logout button should perform a logout using the 'userService',
  wait for the logout to complete, and then pop to Login VC.
* Clear the username on logout.

## General Requirements:
* dispose bag only allowed in the controller
* Delete as much imperative code as you can.
* Have fun.

### ** master branch pushing in not allowed and is enforced, so open a PR if you wanna :)
