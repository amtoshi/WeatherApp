//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ashutosh Mane on 29.03.2021.
//

import UIKit

class WeatherViewController: UIViewController {
  
  private let viewModel = WeatherViewModel()
  
  
  
  
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var currentIcon: UIImageView!
  @IBOutlet weak var currentSummaryLabel: UILabel!
  @IBOutlet weak var forecastSummary: UITextView!
  
  override func viewDidLoad() {
    
    //MARK: Data binders in action when value changes and binds to UIView
    viewModel.locationName.bind { [weak self] locationName in
      self?.cityLabel.text = locationName
    }
    
    viewModel.date.bind { [weak self] date in
      self?.dateLabel.text=date
    }
    
    viewModel.icon.bind { [weak self] image in
      self?.currentIcon.image = image
    }
        
    viewModel.summary.bind { [weak self] summary in
      self?.currentSummaryLabel.text = summary
    }
        
    viewModel.forecastSummary.bind { [weak self] forecast in
      self?.forecastSummary.text = forecast
    }

    
  }

  @IBAction func promptForLocation(_ sender: Any) {
    
    let alert = UIAlertController(
      title: "Choose location",
      message: nil,
      preferredStyle: .alert)
    alert.addTextField()
    //2
    let submitAction = UIAlertAction(
      title: "Submit",
      style: .default) { [unowned alert, weak self] _ in
        guard let newLocation = alert.textFields?.first?.text else { return }
        self?.viewModel.changeLocation(to: newLocation)
    }
    alert.addAction(submitAction)
    //3
    present(alert, animated: true)
  }
  
  
}
