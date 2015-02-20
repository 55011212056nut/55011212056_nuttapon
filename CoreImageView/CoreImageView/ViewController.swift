//
//  ViewController.swift
//  CoreImageView
//
//  Created by iStudents on 2/20/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit
import AssetsLibrary

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet weak var UIImageCiew: UIImageView!
    
    @IBOutlet weak var amoutSlider: UISlider!
    
    
    var context : CIContext!
    var filter : CIFilter!
    var beginImage : CIImage!
    var orientation: UIImageOrientation = .Up
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileURL = NSBundle.mainBundle().URLForResource("image", withExtension: "png")
        
        
        beginImage = CIImage(contentsOfURL: fileURL)
        
        
        
        filter = CIFilter(name: "CiSepiaTone")
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        filter.setValue(0.5, forKey: kCIInputIntensityKey)
        let outputImage = filter.outputImage
        
        
        context = CIContext(options:nil)
        let cgimg = context.createCGImage(outputImage, fromRect: outputImage.extent())
        
        let newImage = UIImage(CGImage: cgimg)
        self.UIImageCiew.image = newImage
        
        self.logAllFilters()
        
        
    }
    
    
    
     @IBAction func loadPhoto(sender: AnyObject) {
        let pickerC = UIImagePickerController()
        pickerC.delegate = self
        self.presentViewController(pickerC, animated: true, completion: nil)
        
    }
    
    @IBAction func savePhoto(sender: AnyObject) {
        
        let imageToSave = filter.outputImage
        
        let softwareContext = CIContext(options: [kCIContextUseSoftwareRenderer: true])
        
        let cgimg = softwareContext.createCGImage(imageToSave, fromRect: imageToSave.extent())
        
        let library = ALAssetsLibrary()
        library.writeImageToSavedPhotosAlbum(cgimg, metadata: imageToSave.properties(), completionBlock: nil)
        
        
        
    }
    
    

    
   
    
    @IBAction func mountSliderValueChanged(sender: UISlider) {
        
        let sliderValue = sender.value
       let outputImage = self.oldPhoto(beginImage, withAmount: sliderValue)
        let cgimg = context.createCGImage(outputImage, fromRect: outputImage.extent())
        
        let newImage = UIImage(CGImage: cgimg, scale: 1, orientation: orientation)
        
        self.UIImageCiew.image = newImage
        
        
    }
    
    
    
    
    
    func  oldPhoto(img: CIImage,withAmount intensity:Float)->CIImage{
        
        let sepie = CIFilter(name: "CISepieTone")
        sepie.setValue(img, forKey: kCIInputImageKey)
        sepie.setValue(intensity, forKey: "inputIntensity")
        
        
        let random = CIFilter(name: "CIRandomGenerator")
        

        
        
        let lighten = CIFilter(name: "CICoolorControl")
        lighten.setValue(random.outputImage, forKey: kCIInputImageKey)
        lighten.setValue(1 - intensity, forKey: "inputBrightness")
        lighten.setValue(0, forKey: "inputSaturation")
        
        
        let croppedImage = lighten.outputImage.imageByCroppingToRect(beginImage.extent())
        
        
        let composite = CIFilter(name: "CIHardLightBlendMode")
            composite.setValue(sepie.outputImage, forKey: kCIInputImageKey)
            composite.setValue(croppedImage, forKey: kCIInputBackgroundImageKey)
        
        let vignette = CIFilter(name: "CIVignette")
        vignette.setValue(composite.outputImage, forKey: kCIInputImageKey)
        vignette.setValue(intensity * 2, forKey: "inputIntensity")
        vignette.setValue(intensity * 30, forKey: "inputRadius")
        
        
        return vignette.outputImage
        
    
    
    
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!,didFinishPickingMediaWithInfo info:NSDictionary!) {
        
        
        self.dismissViewControllerAnimated(true, completion: nil);
        
        let gotImage = info[UIImagePickerControllerOriginalImage] as UIImage
        
        
        beginImage = CIImage(image:gotImage)
        orientation = gotImage.imageOrientation
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        self.mountSliderValueChanged(amoutSlider)
        
    }
    
    
    
    func logAllFilters(){
    
            let properties = CIFilter.filterNamesInCategory(kCICategoryBuiltIn)
        println(properties)
        
        
    
        for filterName: AnyObject in properties{
            let fltr = CIFilter(name: filterName as String)
            println(fltr.attributes())
        }
    
    }

    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

