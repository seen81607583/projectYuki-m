import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { PayMentPage } from './pay-ment';

@NgModule({
  declarations: [
    PayMentPage,
  ],
  imports: [
    IonicPageModule.forChild(PayMentPage),
  ],
})
export class PayMentPageModule {}
