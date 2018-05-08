import { Component, OnInit } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { HttpService } from '../../utility/service/http.service';
@Component({
    selector: 'product-block',
    templateUrl: './productBlock.component.html'
})

export class ProductBlockComponent implements OnInit {
    productFamily:Array<any> =[];
    constructor(public navCtrl: NavController, public navParams: NavParams, private http:HttpService) { }

    ngOnInit() { 
        //加载商品列表入口
    this.http.sendRequest("http://127.0.0.1/ionic_project/data/index/aside.php").subscribe((res:any)=>{
        // console.log(res.pf);
        this.productFamily = res.pf;
      })
    }
}