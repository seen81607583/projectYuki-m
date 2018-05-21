import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { HttpService } from '../../app/utility/service/http.service';
import { Http } from '@angular/http';

import { DetailPage } from '../detail/detail';
/**
 * Generated class for the ProductBlockPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-product-block',
  templateUrl: 'product-block.html',
})
export class ProductBlockPage {
  fid:any = 1;
  productBlock:Array<any> = [];
  fname:string = "";
  detail:any = null;
  productFamily:Array<any> = [];
  constructor(public navCtrl: NavController, public navParams: NavParams,private http:HttpService) {
    this.fid = navParams.get("fid");
    this.detail = DetailPage;
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad ProductBlockPage');
    //console.log(this.fid);
    this.http.sendRequest("http://1.yukiki.applinzi.com/data/product/product_list.php?fid="+this.fid).subscribe((res)=>{
      //console.log(res);
      this.productBlock = res.data;
      this.fname = res.fname;
    })

    this.http.sendRequest("http://1.yukiki.applinzi.com/data/index/aside.php").subscribe((res)=>{
      // console.log(res);
      this.productFamily = res.pf;
    })
  }

  loadProduct(fid){
    this.navCtrl.push(ProductBlockPage,{fid:fid});
  }
}
