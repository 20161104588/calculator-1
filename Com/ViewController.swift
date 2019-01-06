//
//  ViewController.swift
//  Com
//
//  Created by 20161104588 on 2018/10/10.
//  Copyright © 2018年 20161104588. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var resulttxt: UILabel!
    var fristval:Double = 0    //shuzi
    var sencendval:Double = 0 //shuzizifu
    var fhval:Int = 0    //fuhao
    var isfinash:Bool = false    //判断文本框是否为空
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func setnum(_ sender: UIButton) {/*数字*/
        let a = sender.currentTitle
        if(resulttxt.text! != "0" && isfinash == false){
            resulttxt.text! += String(a!)
        }else{
            resulttxt.text! = String(a!)
            isfinash = false
        }
    }
    @IBAction func setSign(_ sender: UIButton) {/*符号*/
        if(fristval == 0){
            fristval = Double(resulttxt.text!)!
        }else{
            onCCT(sender)
        }
        fhval = sender.tag
        isfinash = true
    }
    @IBAction func onCCT(_ sender: Any) {/*计算*/
        if  fhval != 0 {
            sencendval = Double(resulttxt.text!)!
            switch (fhval){
            case 1:
                fristval += sencendval
            case 2:
                fristval -= sencendval
            case 3:
                fristval *= sencendval
            case 4:
                if(sencendval != 0)
                {
                    fristval /= sencendval
                }
            default:
                break
            }
            var result:String = String(fristval)
            let len = result.index(of:".")
            let str = "0"+result.substring(from: len!)
            
            if ((Double(str)!) == 0)
            {
                result = result.substring(to: len!)
            }
            if(sencendval==0 && fhval==4)
            {
                resulttxt.text! = "ERROR"
                fristval = 0
            }
            else
            {
                resulttxt.text! = result
            }
            fhval = 0
            isfinash = true
        }
    }
    @IBAction func setPoit(_ sender: Any) {/*判断点*/
        if(!resulttxt.text!.contains(".") && isfinash == false){
            resulttxt.text! += "."
        }
    }
    @IBAction func reset(_ sender: Any) {/*清除*/
        resulttxt.text = "0"
        fristval = 0
        sencendval = 0
        fhval = 0
    }
    @IBAction func evolu(_ sender: Any) {/*开方*/
        fristval = Double(resulttxt.text!)!
        if fristval<0
        {
            resulttxt.text! = "ERROR"
            fristval = 0
        }
        else
        {
            fristval = sqrt(fristval)
            var result:String = String(fristval)
            let len = result.index(of:".")   //标记小数点位置
            let str = "0"+result.substring(from: len!)  //截取小数点后几位
            
            if ((Double(str)!) == 0)
            {
                result = result.substring(to: len!)
            }  //判断小数点后是否为零如果为零则截取小数点前几位舍弃后几位
            resulttxt.text! = result
        }
        isfinash = true
    }
    @IBAction func Square(_ sender: Any) {/*乘方*/
        fristval = Double(resulttxt.text!)!
        fristval *= fristval
        var result:String = String(fristval)
        let len = result.index(of:".")
        let str = "0"+result.substring(from: len!)
        
        if ((Double(str)!) == 0)
        {
            result = result.substring(to: len!)
        }
        resulttxt.text! = result
        isfinash = true
    }
    
    @IBAction func smallclear(_ sender: UIButton) {/*回退*/
        var bstr = resulttxt.text!
        if(resulttxt.text! != ""){
            bstr.removeLast()
            resulttxt.text! = bstr
        }
    }
}
