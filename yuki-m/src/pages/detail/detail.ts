import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,AlertController } from 'ionic-angular';

import { HttpService } from '../../app/utility/service/http.service';

import { LoginPage } from '../login/login';
import { CartPage } from '../cart/cart';
/**
 * Generated class for the DetailPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-detail',
  templateUrl: 'detail.html',
})
export class DetailPage {
  fid:number = 1;
  plid:number = 1;
  gfid:number = 1;
  pic:string = "";
  pf:any = {};
  data:Array<any> = [];
  selectOptions:any = {};
  spec1:number = null;

  constructor(public navCtrl: NavController, public navParams: NavParams,private http:HttpService,public alertCtrl:AlertController) {
    this.fid = navParams.get("fid");
    this.plid = navParams.get("plid");
    this.gfid = navParams.get("gfid");
    this.selectOptions = {
      title:"请选择款式",
      mode:'md'
    };
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad DetailPage');
    this.http.sendRequest("http://127.0.0.1/ionic_project/data/product/product_detail.php?fid="+this.fid+"&plid="+this.plid+"&gfid="+this.gfid).subscribe((res)=>{
    
      var result = res;
      this.pic = result.pic;
      this.pf = result.pf;
      this.data = result.data;
     // console.log(this.pic,this.pf,this.data);
    })
  }

  addCart(){
    this.http.sendRequest("http://127.0.0.1/ionic_project/data/user/isLogin.php").subscribe((res)=>{
      if(res.code<0){
        this.http.showToast("请先登录",1500,'top');
        this.alertCtrl.create({
          title:"您未登录,是否跳转到登录页?",
          buttons:[
            {
              text:"去登录",
              handler:()=>{
                this.navCtrl.push(LoginPage);
              }
            },
            {
              text:"返回"
            }
          ]
        }).present();
        return;
      }else{
        if(this.spec1===null){
          this.http.showToast("清选择款式",1500,'middle');
          return;
        }else{
          //console.log(this.spec1);
          var gid = this.data[this.spec1].gid;
          var gfid = this.data[this.spec1].gfid;
          var spec1 = this.data[this.spec1].g_spec1;
          this.http.sendRequest("http://127.0.0.1/ionic_project/data/cart/insertCart.php?gid="+gid+"&gfid="+gfid+"&spec1"+spec1).subscribe((res)=>{
            var result = res;
            this.http.showToast(result.msg,1500,'middle');
          })
        }
      }
    })
    
  }

  toCartPage(){
    this.navCtrl.push(CartPage);
  }
}
