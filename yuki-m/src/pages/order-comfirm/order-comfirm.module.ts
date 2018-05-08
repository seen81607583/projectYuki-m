import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { OrderComfirmPage } from './order-comfirm';

@NgModule({
  declarations: [
    OrderComfirmPage,
  ],
  imports: [
    IonicPageModule.forChild(OrderComfirmPage),
  ],
})
export class OrderComfirmPageModule {}
