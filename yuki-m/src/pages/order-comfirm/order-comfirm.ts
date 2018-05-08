import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ModalController } from 'ionic-angular';

import { PayMentPage } from '../pay-ment/pay-ment';
/**
 * Generated class for the OrderComfirmPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-order-comfirm',
  templateUrl: 'order-comfirm.html',
})
export class OrderComfirmPage {
  product:any = null;
  constructor(public navCtrl: NavController, public navParams: NavParams,private md:ModalController) {
    this.product = this.navParams.get("product");
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad OrderComfirmPage');
    //console.log(this.product);
  }

  toPay(){
    var myModal = this.md.create(PayMentPage);
    myModal.present();
    myModal.onDidDismiss((data)=>{
      if(data.back==true){
        this.navCtrl.parent.select(0);
      }
    });
  }
}
