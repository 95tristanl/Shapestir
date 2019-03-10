//
//  adPage.swift
//  Shapestir
//
//  Created by Tristan LeVeille on 12/1/15.
//  Copyright © 2015 Tristan Le Veille. All rights reserved.
//

import SpriteKit
import iAd
import UIKit

class adPage: UIView, ADInterstitialAdDelegate
{
    var interAd = ADInterstitialAd();
    var interAdView: UIView = UIView();
    
    var closeButton = UIButton();
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        loadAd()
        
        self.backgroundColor = SKColor.grayColor()
        
        closeButton.frame = CGRectMake(10, 10, 20, 20);
        closeButton.layer.cornerRadius = 10;
        closeButton.setTitle("x", forState: .Normal);
        closeButton.setTitleColor(UIColor.blackColor(), forState: .Normal);
        closeButton.backgroundColor = UIColor.whiteColor();
        closeButton.layer.borderColor = UIColor.blackColor().CGColor
        closeButton.layer.borderWidth = 1;
        closeButton.addTarget(self, action: "close:", forControlEvents: UIControlEvents.TouchDown);
        
    }

    func close(sendor: UIButton)
    {
        closeButton.removeFromSuperview()
        interAdView.removeFromSuperview()
        self.removeFromSuperview()
        NSNotificationCenter.defaultCenter().postNotificationName("doneWithAdNotification", object: nil)
    }
    
    func loadAd()
    {
        print("load ad");
        interAd = ADInterstitialAd();
        interAd.delegate = self;
        
    }
    
    func interstitialAdDidLoad(interstitialAd: ADInterstitialAd!) {
        print("ad did load")
        
        interAdView = UIView()
        interAdView.frame = self.bounds
        self.addSubview(interAdView)         
        
        interAd.presentInView(interAdView)
        UIViewController.prepareInterstitialAds()
        
        interAdView.addSubview(closeButton)
    }
    
    func interstitialAdDidUnload(interstitialAd: ADInterstitialAd!) {
        
    }
    
    func interstitialAd(interstitialAd: ADInterstitialAd!, didFailWithError error: NSError!) {
        print("failed to receive")
        print(error.localizedDescription)
        
        closeButton.removeFromSuperview()
        interAdView.removeFromSuperview()
    }
}

