import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

//引入组件
import { ProductBlockComponent } from '../../app/components/productBlock/productBlock.component'; 
//引入HttpService
import { HttpService } from '../../app/utility/service/http.service';
//引入要跳转的pages
import { ProductBlockPage } from '../product-block/product-block';
import { DetailPage } from '../detail/detail';
/**
 * Generated class for the IndexPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-index',
  templateUrl: 'index.html',
})
export class IndexPage {
  carouselList:Array<any> = [];
  hotList:Array<any> = [];
  productFamily:Array<any> =[];
  productBlock:any = null;
  detail:any = null;
  constructor(public navCtrl: NavController, public navParams: NavParams, private http:HttpService) {
    this.productBlock = ProductBlockPage;
    this.detail = DetailPage;
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad IndexPage');    
    //轮播图加载
    this.http.sendRequest("http://127.0.0.1/ionic_project/data/index/carousel.php").subscribe((res:any)=>{
     // console.log(res);
      this.carouselList = res;
    })

    //热卖推荐
    this.http.sendRequest("http://127.0.0.1/ionic_project/data/index/hot.php").subscribe((res:any)=>{
      this.hotList = res;
     // console.log(this.hotList);
    })

    //加载商品列表入口
    this.http.sendRequest("http://127.0.0.1/ionic_project/data/index/aside.php").subscribe((res:any)=>{
     // console.log(res.pf);
      this.productFamily = res.pf;
    })
  }

}
