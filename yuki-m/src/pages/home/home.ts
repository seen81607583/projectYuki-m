import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

//引入tabs
import { IndexPage } from '../index/index';
import { CartPage } from '../cart/cart';
import { UserCenterPage } from '../user-center/user-center';
import { SettingPage } from '../setting/setting';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  tabIndex:any = IndexPage;
  tabCart:any = CartPage;
  tabUserCenter:any = UserCenterPage;
  tabSetting:any = SettingPage;
  
  constructor(public navCtrl: NavController) {

  }

}
