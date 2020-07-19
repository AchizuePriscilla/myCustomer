import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycustomers/core/localization/app_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'transaction_details_viewmodel.dart';
import '../../../shared/const_color.dart';
// import 'package:mycustomers/core/downloads/receipt_report_view.dart';

class TransactionDetails extends StatelessWidget {
  final Color color = BrandColors.primary;
  final Color bgColor = Colors.grey[200];
  final Color containerColor = Colors.white;
  final currency = new NumberFormat("#,##0", "en_NG");

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 1440, width: 720, allowFontScaling: true);
    return ViewModelBuilder<TransactionDetailsViewModel>.reactive(
      viewModelBuilder: () => TransactionDetailsViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                }, //TODO: implement backbutton
                icon: Icon(
                  Icons.keyboard_backspace,
                  size: 50.sp,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'Transaction details',
                style: TextStyle(
                    fontSize: 40.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: BrandColors.primary,
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Center(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: containerColor,
                            border: Border.all(color: BrandColors.primary),
                            borderRadius: BorderRadius.circular(15.sp)),
                        margin: EdgeInsets.only(
                            left: 50.w, right: 50.w, top: 40.h, bottom: 0.0),
                        width: double.infinity,
                        //height: 550.w,
                        child: Column(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 15.h),
                                  child: Row(
                                    children: <Widget>[
                                      model.contact.initials != null
                                          ? CircleAvatar(
                                              radius: 30,
                                              backgroundColor:
                                                  BrandColors.primary,
                                              child:
                                                  Text(model.contact.initials),
                                            )
                                          : CircleAvatar(
                                              radius: 30,
                                              backgroundColor: color,
                                              backgroundImage: AssetImage(
                                                  'assets/images/man.png'),
                                            ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              model.contact.name,
                                              style: TextStyle(
                                                fontSize: 40.sp,
                                              ),
                                            ),
                                          ), // TODO: implement Profile picture
                                          Text(
                                            model.contact.phoneNumber,
                                            style: TextStyle(
                                              fontSize: 30.sp,
                                              color: Colors.grey[600],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: BrandColors.primary,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 30.sp,
                                      left: 30.sp,
                                      right: 30.sp,
                                      bottom: 40.sp),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .itemsPurchased,
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 30.sp),
                                              ),
                                            ),
                                            Container(
                                                child: Row(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                for (var item
                                                    in model.transaction.goods)
                                                  Text(
                                                    model.transaction.goods
                                                                .indexOf(
                                                                    item) ==
                                                            model
                                                                    .transaction
                                                                    .goods
                                                                    .length -
                                                                1
                                                        ? item + ' '
                                                        : item + ', ',
                                                    style: TextStyle(
                                                        fontSize: 30.sp),
                                                  )
                                              ],
                                            ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 20,
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .costOfItems,
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 30.sp),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Expanded(
                                              flex: 30,
                                              child: Text(
                                                model.transaction.amount != null
                                                    ? '₦${currency.format(model.transaction.amount)}'
                                                    : '₦0',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: color,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 30.sp),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 20,
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .amountPaid,
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 30.sp),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Expanded(
                                              flex: 30,
                                              child: Text(
                                                model.transaction.paid != null
                                                    ? '₦${currency.format(model.transaction.paid)}'
                                                    : '₦0',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 30.sp),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40.h,
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 20,
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .amountOwing,
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 30.sp),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Expanded(
                                              flex: 30,
                                              child: Text(
                                                model.transaction.amount !=
                                                            null &&
                                                        model.transaction
                                                                .paid !=
                                                            null &&
                                                        (model.transaction
                                                                    .amount -
                                                                model
                                                                    .transaction
                                                                    .paid) >
                                                            0
                                                    ? '₦${currency.format(model.transaction.amount - model.transaction.paid)}'
                                                    : '₦0',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.red[800],
                                                    fontFamily: 'Roboto',
                                                    fontSize: 30.sp),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 20,
                                              child: Text(
                                                'Amount Owed:',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 30.sp),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Expanded(
                                              flex: 30,
                                              child: Text(
                                                model.transaction.paid !=
                                                            null &&
                                                        model.transaction
                                                                .amount !=
                                                            null &&
                                                        (model.transaction
                                                                    .paid -
                                                                model
                                                                    .transaction
                                                                    .amount) >
                                                            0
                                                    ? '₦${currency.format(model.transaction.paid - model.transaction.amount)}'
                                                    : '₦0',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color:
                                                        BrandColors.secondary,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 30.sp),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: GestureDetector(
                                    onTap:
                                        () {}, // TODO: implement delete button
                                    child: Container(
                                      height: 90.sp,
                                      decoration: BoxDecoration(
                                          color: containerColor,
                                          border: Border.all(
                                            color: BrandColors.primary,
                                          ),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8.sp),
                                              bottomLeft:
                                                  Radius.circular(10.sp))),
                                      child: Center(
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              fontSize: 30.sp,
                                              color: BrandColors.primary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {}, // TODO: implement Edit button
                                    child: Container(
                                      height: 90.sp,
                                      decoration: BoxDecoration(
                                        color: BrandColors.primary
                                            .withOpacity(0.9),
                                        //border: Border(top: BorderSide(color: Colors.blue)),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8.sp),
                                            bottomRight:
                                                Radius.circular(10.sp)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context).edit,
                                          style: TextStyle(
                                            fontSize: 30.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                   //   TODO: PDF
                      // ReceiptReport().buildPdf(context);
                      Navigator.of(context).push(new PageRouteBuilder(
                          opaque: false,
                          barrierColor: Colors.black.withOpacity(0.5),
                          barrierDismissible: true,
                          pageBuilder: (BuildContext context, __, _) {
                            return Center(
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          left: 10,
                                          right: 10,
                                          bottom: 80),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        //borderRadius: BorderRadius.only(topRight: Radius.circular(40.sp), topLeft: Radius.circular(40.sp))
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: SvgPicture.asset(
                                              'assets/icons/cancel.svg',
                                              color: BrandColors.primary,
                                              width: 50.w,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .shareTo,

                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5
                                                          .copyWith(
                                                            fontSize: 40.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: color,
                                                          ))),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              BottomButton(
                                                text: 'Facebook',
                                                imagePath:
                                                    'assets/images/Subtract.svg',
                                              ),
                                              BottomButton(
                                                text: 'Whatsapp',
                                                imagePath:
                                                    'assets/images/Page-1.svg',
                                              ),
                                              BottomButton(
                                                text: 'Gmail',
                                                imagePath:
                                                    'assets/images/super-g.svg',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }));
                    }, // TODO: implement this part i dont understand
                    child: Container(
                      height: 90.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                          color: BrandColors.primary,
                          borderRadius: BorderRadius.circular(15.sp)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset('assets/images/Vector.svg'),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            AppLocalizations.of(context).share,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 30.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onTap;

  const BottomButton({Key key, this.text, this.imagePath, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20), right: Radius.circular(20))),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[200])),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Center(
                    child: SvgPicture.asset(
                  imagePath,
                  height: 40.h,
                  width: 40.w,
                )),
              ),
            ),
          ),
          Text(text,
              style: Theme.of(context).textTheme.headline5.copyWith(
                    fontSize: 30.sp,
                  ))
        ],
      ),
    );
  }
}
