import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams ,AlertController,ActionSheetController} from 'ionic-angular';
import { Camera,CameraOptions } from '@ionic-native/camera';
import { HttpService } from '../../app/utility/service/http.service';

import { LoginPage } from '../login/login';
/**
 * Generated class for the UserCenterPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-user-center',
  templateUrl: 'user-center.html',
})
export class UserCenterPage {
  uname:string = "";
  isLogin:boolean = false;
  imageSrc:string = "assets/img/register_login/timg.jpg";
  constructor(public navCtrl: NavController, public navParams: NavParams,private http:HttpService,private alertCtrl:AlertController,private camera:Camera,private actionSheetCtrl:ActionSheetController) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad UserCenterPage');
  }

  ionViewWillEnter(){
    // this.http.sendRequest("http://1.yukiki.applinzi.com/data/user/isLogin.php").subscribe((res)=>{
    //  // console.log(res);
    //   if(res.code<0){
    //     this.alertCtrl.create({
    //       message:"您还没登录,去登录？",
    //       buttons:[
    //         {
    //           text:"确定",
    //           handler:()=>{
    //             this.navCtrl.push(LoginPage);
    //           }
    //         },
    //         {
    //           text:"取消",
    //           handler:()=>{
    //             this.navCtrl.parent.select(0);
    //           }
    //         }
    //       ]
    //     }).present();
    //   }else if(res.code>0){
    //     //console.log(res);
    //     this.uname=res.uname;
    //     this.isLogin = true;
    //   }
    // })
  }

  logout(){
    this.http.sendRequest("http://1.yukiii.applinzi.com/data/user/logout.php").subscribe((res)=>{
      console.log(res);
      if(res.code===200){
        this.http.showToast("退出成功",1500,"middle");
        this.navCtrl.parent.select(0);
      }else{
        this.http.showToast("退出登录失败",1500,"middle");
      }
    })
  }

  showActionSheet(){
    this.actionSheetCtrl.create({
      title:"选择模式",
      buttons:[
        {
          text:"自拍",
          handler:()=>{
           // console.log("zipai")
            const options:CameraOptions = {
              quality: 100,
              destinationType: this.camera.DestinationType.DATA_URL,
              encodingType: this.camera.EncodingType.JPEG,
              mediaType: this.camera.MediaType.PICTURE,
              sourceType:this.camera.PictureSourceType.CAMERA
            }
            this.camera.getPicture(options).then((imageData)=>{
              let base64Image = "data:image/jpeg;base64,"+imageData;
              this.imageSrc = base64Image;
            },(err)=>{
              console.log("自拍失败");
            })
          }
        },
        {
          text:"从图库中选择",
          handler:()=>{
           // console.log("选择")
            const options:CameraOptions = {
              quality: 100,
              destinationType: this.camera.DestinationType.DATA_URL,
              encodingType: this.camera.EncodingType.JPEG,
              mediaType: this.camera.MediaType.PICTURE,
              sourceType:this.camera.PictureSourceType.PHOTOLIBRARY
            }
            this.camera.getPicture(options).then((imageData)=>{
              let libImage = "data:image/jpeg;base64,"+imageData;
              this.imageSrc = libImage;
            },(err)=>{
              console.log("从图库中选择失败");
            })
          }
        },
        {
          text:"取消",
          role:"cancel",
          handler:()=>{
            console.log("cancel");
          }
        }
      ]
    }).present();
  }
}
