import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController,LoadingController } from 'ionic-angular';

/**
 * Generated class for the PayMentPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-pay-ment',
  templateUrl: 'pay-ment.html',
})
export class PayMentPage {

  constructor(public navCtrl: NavController, public navParams: NavParams, private myViewCtrl:ViewController,private loadCtrl:LoadingController) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad PayMentPage');
  }

  closeModal(){
    this.myViewCtrl.dismiss({back:false});
  }

  showLoading(){
    this.loadCtrl.create({
      content:"正在支付",
      duration:3000
    }).present()

    setTimeout(()=>{
      this.myViewCtrl.dismiss({back:true})
    },3000)
  }
}
