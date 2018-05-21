import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { Camera,CameraOptions } from '@ionic-native/camera';
import { Platform } from 'ionic-angular';
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
  options:any = null;
  //imgSrc:any = "";
  constructor(private platform:Platform, public navCtrl: NavController, public navParams: NavParams, private http:HttpService,private camera:Camera) {
    this.productBlock = ProductBlockPage;
    this.detail = DetailPage;

    //初始化cordova
    // platform.ready().then(()=>{
      
    // })
    
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad IndexPage');    
    //轮播图加载
    this.http.sendRequest("http://1.yukiki.applinzi.com/data/index/carousel.php").subscribe((res:any)=>{
     // console.log(res);
      this.carouselList = res;
    })

    //热卖推荐
    this.http.sendRequest("http://1.yukiki.applinzi.com/data/index/hot.php").subscribe((res:any)=>{
      this.hotList = res;
     // console.log(this.hotList);
    })

    //加载商品列表入口
    this.http.sendRequest("http://1.yukiki.applinzi.com/data/index/aside.php").subscribe((res:any)=>{
     // console.log(res.pf);
    this.productFamily = res.pf;
    })
  }

  getPicture(){
    //初始化相册配置
    const options:CameraOptions = {
      quality:100,
      destinationType:this.camera.DestinationType.DATA_URL,
      encodingType:this.camera.EncodingType.JPEG,
      mediaType:this.camera.MediaType.PICTURE,
      sourceType:this.camera.PictureSourceType.CAMERA
    }
    this.options = options;
    //console.log(11);
    this.camera.getPicture(options).then((imageDate)=>{
      //console.log(imageDate);
      let imgSrc = "data:image/jpeg;base,"+imageDate;
      //this.imgSrc = imgSrc;
      //console.log(this.imgSrc);
    },(err)=>{
      //console.log(err);
      console.log("调用照相机失败");
    })
  }
}
