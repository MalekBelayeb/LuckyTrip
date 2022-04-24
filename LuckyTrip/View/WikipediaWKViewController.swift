//
//  WikipediaWKViewController.swift
//  LuckyTrip
//
//  Created by ODC on 24/4/2022.
//

import UIKit
import WebKit

class WikipediaWKViewController: UIViewController {
    
    
    @IBOutlet weak var webKitView: WKWebView!
    
    var urlWiki:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let urlWiki = urlWiki else {
            return
        }
        guard let url = URL(string: urlWiki)else {
            return
        }
                
        self.webKitView.load(URLRequest(url: url))
        self.webKitView.allowsBackForwardNavigationGestures = true
        
        //webView.load(URLRequest(url: url))
        //webView.allowsBackForwardNavigationGestures = true
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
