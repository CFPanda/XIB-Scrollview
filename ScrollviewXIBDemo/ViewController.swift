//
//  ViewController.swift
//  ScrollviewXIBDemo
//
//  Created by duanchuanfen on 16/5/31.
//  Copyright © 2016年 duanchuanfen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

 
    @IBOutlet weak var contentSizeWidth: NSLayoutConstraint!
    @IBOutlet weak var touZiZhongX: NSLayoutConstraint!
    @IBOutlet weak var touZiZhongWidth: NSLayoutConstraint!
    @IBOutlet weak var yiHuikuanX: NSLayoutConstraint!
    @IBOutlet weak var yiHuiKuanTbWidth: NSLayoutConstraint!
    @IBOutlet weak var daiHuiKuanTbWidth: NSLayoutConstraint!
    @IBOutlet weak var line3: UIView!
    @IBOutlet weak var line2: UIView!
    @IBOutlet weak var line1: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var touzizhongTb: UITableView!
    @IBOutlet weak var yihuikuanTb: UITableView!
    @IBOutlet weak var daihuikuanTb: UITableView!
    var daiHuiKuanDataArray:NSMutableArray?
    var yihuiKuanDataArray:NSMutableArray?
    var touZiZhongDataArray:NSMutableArray?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的投资"
        line2.hidden = true
        line3.hidden = true
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.translucent = false
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.delegate = self
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //TODO:tableDelegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      let  messageLabel = UILabel(frame:CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height))
        messageLabel.text = "暂无记录";
        messageLabel.textColor = UIColor.blackColor();
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignment.Center
        messageLabel.font = UIFont.systemFontOfSize(20)
        messageLabel.sizeToFit()
        //在界面没有任何数据的时候 清除下拉忽悠空白cell的qingk
        tableView.tableFooterView = UIView()
        
        tableView.backgroundView = messageLabel;
        return 0;

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier:"cell")
        
        
        return cell;
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if(scrollView.contentOffset.x==0){
            line1.hidden = false
            line2.hidden = true
            line3.hidden = true
        }
        if(scrollView.contentOffset.x==self.view.frame.size.width){
            line1.hidden = true
            line2.hidden = false
            line3.hidden = true
        }
        
        if(scrollView.contentOffset.x==self.view.frame.size.width*2){
            line1.hidden = true
            line2.hidden = true
            line3.hidden = false
        }
    }
    
    override func updateViewConstraints() {
        self.contentSizeWidth.constant = self.view.frame.size.width*3
        self.daiHuiKuanTbWidth.constant = self.view.frame.size.width
        self.yiHuiKuanTbWidth.constant = self.view.frame.size.width
        self.touZiZhongWidth.constant = self.view.frame.size.width
        self.yiHuikuanX.constant = self.view.frame.size.width
        self.touZiZhongX.constant = self.view.frame.size.width*2
        super.updateViewConstraints()
        
    }

    
    @IBAction func buttonClick(sender: AnyObject) {
       let button = sender as! UIButton
        button.highlighted = false
        if(sender.tag == 101){
            scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
                    }
        
        if(sender.tag == 102){
            scrollView.setContentOffset(CGPointMake(self.view.frame.size.width, 0), animated: true)
           
        }
        
        if(sender.tag == 103){
            scrollView.setContentOffset(CGPointMake(self.view.frame.size.width*2, 0), animated: true)
            
        }
    
    
    }

}

