//
//  QRcodeReaderViewController.swift
//  QIASmartStockApp
//
//  Created by Mane Hambardzumyan on 8/15/16.
//  Copyright © 2016 Instigate Mobile. All rights reserved.
//

import UIKit
import AVFoundation

class QRcodeReaderViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    var codeReaderValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let input: AnyObject!
        do {
            input = try AVCaptureDeviceInput(device: captureDevice) }
        catch {
            return
        }
        
        captureSession = AVCaptureSession()
        captureSession?.addInput(input as! AVCaptureInput)
        
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code,
                                                     AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code,
                                                     AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode]
        
        self.videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.videoPreviewLayer?.frame = view.layer.bounds
        self.view.layer.addSublayer(videoPreviewLayer!)
        self.videoPreviewLayer?.zPosition = -1
        
        self.captureSession?.startRunning()
        
        let detectColor = UIColor.greenColor().CGColor
        self.detectionBarcode(detectColor)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//  MARK: - Action method
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        if metadataObjects == nil || metadataObjects.count == 0 {
            self.qrCodeFrameView?.frame = CGRectZero
            self.codeReaderValue = "No QR code is detected"
            NSLog("codeReaderValue: \(codeReaderValue!)")
            
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject

        let barCodeObject = videoPreviewLayer?.transformedMetadataObjectForMetadataObject(metadataObj as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
        self.qrCodeFrameView?.frame = barCodeObject.bounds;
        
        if metadataObj.stringValue != nil {
            self.codeReaderValue = metadataObj.stringValue
            NSLog("codeReaderValue: \(codeReaderValue)")
            
            self.captureSession?.stopRunning()
            showAlertBox(codeReaderValue)
        }
    }

    
//  MARK: - Ptivate methods
    
    private func showAlertBox(codeReaderValue: String) {
        let title = "Scanned following"
        let messageText = "\(codeReaderValue)"
        let checkTitle = "Go to check"
        let cancelTitle = "Cancel"
        let segue = "showCheckOutSegue"
        
        let dialogBox = UIAlertController(title: title, message: messageText, preferredStyle: UIAlertControllerStyle.Alert)
        let check = UIAlertAction(title: checkTitle, style: .Default, handler:
            { (action: UIAlertAction) -> Void in
                self.performSegueWithIdentifier(segue, sender: self)
                dialogBox.dismissViewControllerAnimated(true, completion: { _ in })
        })
        let cancel = UIAlertAction(title: cancelTitle, style: .Default, handler:
            { (action: UIAlertAction) -> Void in
                self.qrCodeFrameView?.layer.borderColor = UIColor.clearColor().CGColor
                self.qrCodeFrameView?.layer.borderWidth = 2
                self.view.addSubview(self.qrCodeFrameView!)
                
                let clearDetectColor  =  UIColor.clearColor().CGColor
                self.detectionBarcode(clearDetectColor)
                
                self.captureSession?.startRunning()
                
                let detectColor  =  UIColor.greenColor().CGColor
                self.detectionBarcode(detectColor)
                
                dialogBox.dismissViewControllerAnimated(true, completion: { _ in })
        })
        dialogBox.addAction(check)
        dialogBox.addAction(cancel)
        
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(dialogBox, animated: true, completion: nil)
    }
    
    private func detectionBarcode(color: CGColor?) {
        self.qrCodeFrameView = UIView()
        self.qrCodeFrameView?.layer.borderColor = color
        self.qrCodeFrameView?.layer.borderWidth = 2
        self.view.addSubview(self.qrCodeFrameView!)
        self.view.bringSubviewToFront(self.qrCodeFrameView!)
        self.qrCodeFrameView!.layer.zPosition = +1
    }
   

/*
//  MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
*/

}
