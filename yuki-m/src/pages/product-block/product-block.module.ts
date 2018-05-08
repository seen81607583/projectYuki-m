import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { ProductBlockPage } from './product-block';

@NgModule({
  declarations: [
    ProductBlockPage,
  ],
  imports: [
    IonicPageModule.forChild(ProductBlockPage),
  ],
})
export class ProductBlockPageModule {}
