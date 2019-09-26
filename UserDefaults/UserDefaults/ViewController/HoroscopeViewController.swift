//
//  HoroscopeViewController.swift
//  UserDefaults
//
//  Created by Michelle Cueva on 9/24/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var horoscopeInfo: UITextView!
    var horoscope: Horoscope!
       
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        loadData()
//    }
//    
    func loadData() {
        if horoscope == nil {
            guard let birthday = UserDefaultsWrapper.shared.getBirthday() else {return}
            HoroscopeAPIHelper.shared.getHoroscope(sunSign:Horoscope.getSunSign(date:birthday)) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let HoroscopesFromOnline):
                        self.horoscope = HoroscopesFromOnline
                        self.horoscopeInfo.text = self.horoscope.horoscope
                        self.nameLabel.text = self.horoscope.sunsign
                        
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        } else {
            horoscopeInfo.text = horoscope.horoscope
            nameLabel.text = horoscope.sunsign
        }
    }

}
