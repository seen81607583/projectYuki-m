import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { HttpService } from '../../app/utility/service/http.service';
import { RegisterPage } from '../register/register';
/**
 * Generated class for the LoginPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {
  uname:string = "";
  upwd:string = "";

  constructor(public navCtrl: NavController, public navParams: NavParams,private http:HttpService) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad LoginPage');
  }

  myLogin(){
    var uname = this.uname;
    var upwd =this.upwd;
    this.http.sendJsonp(uname,upwd).subscribe((res)=>{
      if(res.code>0){
        this.http.showToast("登录成功",1500,'middle');
        this.navCtrl.pop();
      }else{
        this.http.showToast("登录失败，账号或密码错误",1500,"middle");
      }
    })
  }

  toRegister(){
    this.navCtrl.push(RegisterPage);
  }
}
