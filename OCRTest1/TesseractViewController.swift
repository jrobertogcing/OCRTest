//
//  TesseractViewController.swift
//  OCRTest1
//
//  Created by Jose González on 2/25/19.
//  Copyright © 2019 Gonet. All rights reserved.
//

import UIKit
import TesseractOCR



class TesseractViewController: UIViewController, G8TesseractDelegate {

    @IBOutlet weak var OCRTextView: UITextView!
    
    @IBOutlet weak var textImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textImage.image = UIImage(named: "EnglishOCT")


    }
    

    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition Progress \(tesseract.progress) %")
    }
    
    @IBAction func ocrButtonAction(_ sender: UIButton) {
        
        // Do any additional setup after loading the view.
        
        
        if let tesseract = G8Tesseract(language: "eng") {
            
            tesseract.delegate = self
            tesseract.image = UIImage(named: "EnglishOCT")?.g8_blackAndWhite()
            tesseract.recognize()
            
            OCRTextView.text = tesseract.recognizedText
        }
        
    }
    
    
    
}
