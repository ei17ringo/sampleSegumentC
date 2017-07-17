//
//  ViewController.swift
//  sampleSegumentC
//
//  Created by Eriko Ichinohe on 2017/07/05.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testSeg: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        testSeg.makeMultiline(withFontName: "System", fontSize: 11, textColor: UIColor.white)
        
    }
    
    @IBAction func changeSegument(_ sender: UISegmentedControl) {
        testSeg.autoChangeSelectedText()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension UISegmentedControl {
    func makeMultiline(withFontName fontName: String, fontSize: CGFloat, textColor: UIColor){
        for index in 0...self.numberOfSegments - 1 {
            
            var setIndex = self.numberOfSegments - 1 - index
            
            let label = UILabel(frame: CGRect(x:0,y:0,width:self.frame.width/CGFloat(self.numberOfSegments),height:self.frame.height))
            label.font = UIFont(name: fontName, size: fontSize)
            if setIndex == self.selectedSegmentIndex{
                label.textColor = UIColor.white
                
            }else{
                label.textColor = self.tintColor
            }
            label.text = self.titleForSegment(at: setIndex)
            label.numberOfLines = 0
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            
            self.setTitle("", forSegmentAt: setIndex)
            self.subviews[index].addSubview(label)
        }
    }
    
    func autoChangeSelectedText(){
        for index in 0...self.numberOfSegments - 1 {
            
            var setIndex = self.numberOfSegments - 1 - index
            
            if setIndex == self.selectedSegmentIndex{
                ((self.subviews[index].subviews[2]) as! UILabel).textColor = UIColor.white
                
            }else{
                ((self.subviews[index].subviews[2]) as! UILabel).textColor = self.tintColor
            }
        }

    }
    
}


