import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixvalley_vendor_app/features/order/domain/models/order_model.dart';
import 'package:sixvalley_vendor_app/features/order_details/controllers/order_details_controller.dart';
import 'package:sixvalley_vendor_app/features/splash/controllers/splash_controller.dart';
import 'package:sixvalley_vendor_app/localization/language_constrants.dart';
import 'package:sixvalley_vendor_app/utill/color_resources.dart';
import 'package:sixvalley_vendor_app/utill/dimensions.dart';
import 'package:sixvalley_vendor_app/utill/images.dart';
import 'package:sixvalley_vendor_app/utill/styles.dart';
import 'package:sixvalley_vendor_app/features/order/screens/edit_address_screen.dart';
import 'package:sixvalley_vendor_app/features/order/widgets/icon_with_text_row_widget.dart';
import 'package:sixvalley_vendor_app/features/order_details/widgets/show_on_map_dialog_widget.dart';

class ShippingAndBillingWidget extends StatelessWidget {
  final Order? orderModel;
  final bool? onlyDigital;
  final String orderType;
  const ShippingAndBillingWidget({Key? key, this.orderModel, this.onlyDigital, required this.orderType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool showEditButton = (orderModel?.orderStatus == 'out_for_delivery' || orderModel?.orderStatus == 'delivered' || orderModel?.orderStatus == 'returned');

    return Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Images.mapBg), fit: BoxFit.cover)),
      child: Padding(padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if(!onlyDigital!)Container(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeMedium),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: ThemeShadow.getShadow(context),
              borderRadius: const BorderRadius.vertical(top : Radius.circular(Dimensions.paddingSizeSmall))

            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [



              Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                  Row(children: [
                    SizedBox(width: 20, child: Image.asset(Images.shippingIcon)),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                      child: Text('${getTranslated('address_info', context)}'))
                  ]),


                ]),
              ),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(getTranslated('shipping', context)!, style: titilliumSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge,
                    color: ColorResources.titleColor(context),)),

                ],
              ),

              const SizedBox(height: Dimensions.paddingSizeSmall),

              if(orderModel!.shippingAddressData != null)
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(child: IconWithTextRowWidget(text: orderModel!.shippingAddressData?.contactPersonName??'',icon: Icons.person, bold: true,)),


              ],),
              const SizedBox(height: Dimensions.paddingSizeSmall),







            ],
          ),),


          Container(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeMedium),
            decoration: BoxDecoration(color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.vertical(bottom : Radius.circular(Dimensions.paddingSizeSmall))),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(getTranslated('billing', context)!, style: titilliumSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge,
                    color: ColorResources.titleColor(context),)),


                ],
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),


              Row(children: [
                Expanded(child: IconWithTextRowWidget(text: orderModel!.shippingAddressData != null ?
                orderModel!.shippingAddressData?.contactPersonName?.trim()??''  : '',icon: Icons.person, bold: true,)),


              ],),


            ],),
          ),

        ]),
      ),
    );
  }
}
