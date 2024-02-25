//
//  MapScreenViewController.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 24/2/2024.
//

import Foundation
import UIKit
import GoogleMaps
import CoreLocation
import Kingfisher

class MapScreenViewController: UIViewController {
    
    var selectedPeople: People? = nil
    
    private var mapView: GMSMapView!
    
    private var isMapReady: Bool = false
    
    private let detailView: DetailsView = {
        let view = DetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupMap()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        selectedPeople = nil
    }
    
    private func setupMap() {
        let options = GMSMapViewOptions()
        options.frame = self.view.bounds
        
        mapView = GMSMapView(options: options)
        mapView.delegate = self
        
        self.view.addSubview(mapView)
    }
    
    
    private func addMarker(people: People, zoom: Float = 10.0) {
        guard let coordinate = people.getLocation() else { return }
        
        let marker = GMSMarker()
        marker.position = coordinate
        marker.title = "\(people.firstName) \(people.lastName)"
        marker.map = mapView
        
        mapView.camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude,
                                                  longitude: coordinate.longitude,
                                                  zoom: zoom)
    }
    
    private func doWhenMapReady(_ mapView: GMSMapView) {
        if let selectedPeople = self.selectedPeople {
            addDetailView(people: selectedPeople)
            
            guard let _ = selectedPeople.getLocation() else {
                self.showSimpleAlert(title: "No location", message: "No location available.")
                return
            }
            addMarker(people: selectedPeople, zoom: 13.0)
            return
        }
        
        AppDatabase.shared.getPeopleList().forEach { people in
            addMarker(people: people)
        }
    }
    
    private func addDetailView(people: People) {
        view.addSubview(detailView)
        
        detailView.leadingAnchor
            .constraint(equalTo: view.leadingAnchor)
            .isActive = true
        detailView.trailingAnchor
            .constraint(equalTo: view.trailingAnchor)
            .isActive = true
        detailView.bottomAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            .isActive = true
        
        detailView.peopleImage.kf.setImage(with: URL(string: people.picture))
        
        detailView.nameLabel.text = "\(people.firstName) \(people.lastName)"
        detailView.emailLabel.text = people.email
    }
    
}

extension MapScreenViewController: GMSMapViewDelegate {
    func mapViewDidFinishTileRendering(_ mapView: GMSMapView) {
        if self.isMapReady {
            return
        }
        self.isMapReady = true
        
        self.doWhenMapReady(mapView)
    }
}

extension People {
    func getLocation() -> CLLocationCoordinate2D? {
        if (latitude == nil || longitude == nil) {
            return nil
        }
        return CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
    }
}
