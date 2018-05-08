import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { HttpService } from '../../app/utility/service/http.service';
import { LoginPage } from '../login/login';
/**
 * Generated class for the RegisterPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-register',
  templateUrl: 'register.html',
})
export class RegisterPage {
  uname:string = "";
  upwd:string = "";
  cpwd:string = "";
  phone:string = "";
  isAgree:boolean = false;
  errMsg:string = "";
  constructor(public navCtrl: NavController, public navParams: NavParams,private http:HttpService) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad RegisterPage');
  }

  myRegister(){
    // console.log(this.uname,this.upwd,this.cpwd,this.phone,this.isAgree);
    if(this.isAgree===false){
      this.http.showToast("您未同意细则",1500,'middle');
      return;
    }

    if(this.errMsg===""){
      this.http.sendRequest("http://127.0.0.1/ionic_project/data/user/register.php?uname="+this.uname+"&upwd="+this.upwd+"&phone="+this.phone).subscribe((res)=>{
        var result = res;
        if(result.code>0){
          this.http.showToast(result.msg,1500,'middle');
          this.navCtrl.push(LoginPage);
        }else if(result.code<0){
          this.http.showToast(result.msg,1500,'middle');
        }
      })
    }
  }

  checkUname(){
    this.http.sendRequestNoLoading("http://127.0.0.1/ionic_project/data/user/checkUname.php?uname="+this.uname).subscribe((res)=>{
      var result = res;
      if(result.code<0){
        this.errMsg = result.msg;
        return;
      }else if(result.code>0){
        this.errMsg = "";
      }
    })
  }

  checkUpwd(){
    if(this.upwd===""){
      this.errMsg = "密码不能为空";
      return;
    }else{
      this.errMsg = "";
    }
  }

  checkCpwd(){
    if(this.upwd===""){
      return;
    }

    if(this.cpwd===""){
      this.errMsg = "请重复密码";
      return;
    }

    if(this.upwd!==this.cpwd){
      this.errMsg = "两次输入密码不一致";
      return;
    }else{
      this.errMsg = "";
    }
  }

  checkPhone(){
    if(this.phone===""){
      this.errMsg = "请输入手机号";
      return;
    }else{
      this.errMsg = "";
    }
  }
}
