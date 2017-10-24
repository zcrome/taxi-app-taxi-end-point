//
//  TaxisViewController.swift
//  taxi-app-taxi-end-point
//
//  Created by zcrome on 10/24/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import UIKit
import CoreLocation

class TaxisViewController: UIViewController {

  //**************************************
  //**** MARK: - Constraints outlets
  //**************************************
  
  //**************************************
  //**** MARK: - View outlets
  //**************************************
  @IBOutlet weak var currentCoordinatesLabel: UILabel!
  @IBOutlet weak var currentStateLabel: UILabel!
  @IBOutlet weak var currentTaxisOnlineLabel: UILabel!
  @IBOutlet weak var taxisTableView: UITableView!
  
  
  
  //**************************************
  //**** MARK: - Local constans and variables
  //**************************************
  let locationManager = CLLocationManager()
  
  
  //**************************************
  //**** MARK: - ViewController override definitions
  //**************************************
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    currentStateLabel.text = Session.sharedInstance.connectionStatus.rawValue
    Session.sharedInstance.connectionStatusLabel = currentStateLabel
    Session.sharedInstance.currentCountTaxisOnline = currentTaxisOnlineLabel
    Session.sharedInstance.currentTaxisOnlineTableView = taxisTableView
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    // Ask for Authorisation from the User.
    self.locationManager.requestAlwaysAuthorization()
    
    // For use in foreground
    self.locationManager.requestWhenInUseAuthorization()
    
    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
      locationManager.startUpdatingLocation()
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
    Session.sharedInstance.connectionStatusLabel = nil
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  //**************************************
  //**** MARK: - Actions and other outlets remaining
  //**************************************
  
  //**************************************
  //**** MARK: - Additional functions that may be require
  //**************************************
}

extension TaxisViewController: CLLocationManagerDelegate{
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let locValue:CLLocationCoordinate2D = manager.location!.coordinate
    currentCoordinatesLabel.text = "Lat: \(locValue.latitude) Long: \(locValue.longitude)"
    SocketClient.share.sendMyGPSLocationWith(Lat: "\(locValue.latitude)", Long: "\(locValue.longitude)", AndId: Session.sharedInstance.id!)
  }
}


extension TaxisViewController: UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    guard let taxisOnline = Session.sharedInstance.currentTaxisOnline else{
      return 0
    }
    return taxisOnline.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    let cell = tableView.dequeueReusableCell(withIdentifier: "taxiCell")!
    
    guard let taxisOnline = Session.sharedInstance.currentTaxisOnline else{
      cell.textLabel?.text = "Taxi Name"
      cell.detailTextLabel?.text = "Position"
      return cell
    }
    
    cell.textLabel?.text = taxisOnline[indexPath.row].name
    cell.detailTextLabel?.text = "Lat= \(taxisOnline[indexPath.row].lat) Long= \(taxisOnline[indexPath.row].long)"
    
    return cell
  }
  
}
















