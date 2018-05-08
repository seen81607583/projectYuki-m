import { Injectable } from '@angular/core';
import { Http, Response,Jsonp,URLSearchParams } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';

import { LoadingController } from 'ionic-angular';
import { ToastController } from 'ionic-angular'; 

@Injectable()
export class HttpService {
    timer:any = null;
    isLoading:boolean = false;
    constructor(private http: Http, public loadingCtrl:LoadingController, public toastCtrl:ToastController,private jsonp:Jsonp) { 
        
    }
    
    sendRequestNoLoading(url:string){
        return this.http.get(url)
            .map((response: Response) => response.json());
    }

    sendRequest(url:string){
        var myLoading = this.loadingCtrl.create({
            content:'正在请求数据'
        });
        myLoading.present();

        this.isLoading = true;
        this.timer = setTimeout(()=>{
            if(this.isLoading==true){
                this.isLoading = false;
                clearTimeout(this.timer);
                this.timer = null;
                myLoading.dismiss();
                this.showToast("网速较慢,请稍后再试",1500,'top'); 
                return ;
            }      
        },10000)

        return this.http.get(url,{withCredentials:true})
            .map((response: Response) => {
                this.isLoading = false;
                myLoading.dismiss();
                return response.json();
            });
    }
    
    showToast(msg:string,time:number,p:string){
        if(!p){
            var myPosition = 'middle';
        }else{
            var myPosition = p;
        }
        this.toastCtrl.create({
            message:msg,
            duration:time,
            position:myPosition
        }).present()
    }

    sendJsonp(uname:string,upwd:string){
        var wikiUrl = "http://127.0.0.1/ionic_project/data/user/login.php";
        var params = new URLSearchParams();
        params.set("uname",uname);
        params.set("upwd",upwd);
        params.set("callback","JSONP_CALLBACK");
        params.set("action","opensearch");
        params.set("format","json");

        return this.jsonp.get(wikiUrl,{search:params,withCredentials:true}).map((response=>response.json()));
    }
}