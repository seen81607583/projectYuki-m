import { NgModule, ErrorHandler } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';
import { HttpModule } from '@angular/http';

//服务
import { HttpService } from './utility/service/http.service';
import { JsonpModule } from '@angular/http';
//pages
import { AboutPage } from '../pages/about/about';
import { ContactPage } from '../pages/contact/contact';
import { HomePage } from '../pages/home/home';
import { TabsPage } from '../pages/tabs/tabs';
import { ProductBlockPage } from '../pages/product-block/product-block';
import { DetailPage } from '../pages/detail/detail';
import { LoginPage } from '../pages/login/login';
import { RegisterPage } from '../pages/register/register';
import { OrderComfirmPage } from '../pages/order-comfirm/order-comfirm';
import { PayMentPage } from '../pages/pay-ment/pay-ment';

//自定义ionic-taps
import { IndexPage } from '../pages/index/index';
import { CartPage } from '../pages/cart/cart';
import { UserCenterPage } from '../pages/user-center/user-center';
import { SettingPage } from '../pages/setting/setting';

//组件
import { ProductBlockComponent } from './components/productBlock/productBlock.component';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

@NgModule({
  declarations: [
    PayMentPage,
    OrderComfirmPage,
    RegisterPage,
    LoginPage,
    DetailPage,
    ProductBlockComponent,
    ProductBlockPage,
    SettingPage,
    UserCenterPage,
    CartPage,
    IndexPage,
    MyApp,
    AboutPage,
    ContactPage,
    HomePage,
    TabsPage
  ],
  imports: [
    JsonpModule,
    HttpModule,
    BrowserModule,
    IonicModule.forRoot(MyApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    PayMentPage,
    OrderComfirmPage,
    RegisterPage,
    LoginPage,
    DetailPage,
    ProductBlockComponent,
    ProductBlockPage,
    SettingPage,
    UserCenterPage,
    CartPage,
    IndexPage,
    MyApp,
    AboutPage,
    ContactPage,
    HomePage,
    TabsPage
  ],
  providers: [
    HttpService,
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}
