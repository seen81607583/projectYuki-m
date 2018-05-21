import { Component, ChangeDetectorRef } from "@angular/core";
import {
  IonicPage,
  NavController,
  NavParams,
  AlertController
} from "ionic-angular";

import { HttpService } from "../../app/utility/service/http.service";

import { LoginPage } from "../login/login";
import { OrderComfirmPage } from "../order-comfirm/order-comfirm";
/**
 * Generated class for the CartPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: "page-cart",
  templateUrl: "cart.html"
})
export class CartPage {
  cartList: Array<any> = [];
  msg: string = "";

  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    private http: HttpService,
    private alertCtrl: AlertController,
    private cd: ChangeDetectorRef
  ) {}

  ionViewDidLoad() {
    console.log("ionViewDidLoad CartPage");
  }
  ionViewWillEnter() {
    this.http
      .sendRequest("http://1.yukiki.applinzi.com/data/user/isLogin.php")
      .subscribe(result => {
        var res = result;
        if (res.code < 0) {
          var myAlert = this.alertCtrl.create({
            message: "您还没有登录",
            buttons: [
              {
                text: "去登录",
                handler: () => {
                  this.navCtrl.push(LoginPage);
                }
              },
              {
                text: "取消",
                handler: () => {
                  if (this.navCtrl.id == "t0-1") {
                    this.navCtrl.parent.select(0);
                  } else if (this.navCtrl.id == "t0-0") {
                    this.navCtrl.pop();
                  }
                }
              }
            ]
          });
          myAlert.present();
        } else {
          this.loadCartList();
        }
      });
  }

  loadCartList() {
    this.http
      .sendRequest("http://1.yukiki.applinzi.com/data/cart/showCart.php")
      .subscribe(result => {
        var res = result;
        if (res.length > 0) {
          this.cartList = res;
          //console.log(this.cartList);
        } else {
          this.msg = "您的购物车空空如也";
        }
      });
  }

  toOrderConfirm(index) {
    this.navCtrl.push(OrderComfirmPage,{product:this.cartList[index]});
  }

  delCart(cid, index) {
    this.alertCtrl
      .create({
        message: "是否删除?",
        buttons: [
          {
            text: "确定",
            handler: () => {
              this.http
                .sendRequest(
                  "http://1.yukiki.applinzi.com/data/cart/delOrder.php?cid=" +
                    cid
                )
                .subscribe(result => {
                  var res = result;
                  if (res.code > 0) {
                    this.http.showToast(res.msg, 1500, "middle");
                    this.cartList.splice(index, 1);
                    this.cd.detectChanges();
                  } else {
                    this.http.showToast(res.msg, 1500, "middle");
                  }
                });
            }
          },
          {
            text: "取消",
            handler: () => {
              return;
            }
          }
        ]
      })
      .present();
  }
}
