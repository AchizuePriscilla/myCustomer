

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mycustomers/ui/shared/const_color.dart';
import 'package:mycustomers/ui/shared/size_config.dart';
import 'package:mycustomers/ui/views/home/home_page/tabs/all_customers_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/size_extension.dart';

import '../home_page_viewmodel.dart';


class DebtorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: width, height: height);
    final currency = new NumberFormat("#,##0", "en_NG");
    return ViewModelBuilder<HomePageViewModel>.reactive(
      builder: (context, model, child) => Container(

        child: Column(

          children: <Widget>[
            Expanded(
              child:

              Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: SizeConfig.yMargin(context, 4.0)),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color(0xFF333CC1),
                              image: DecorationImage(
                                image: ExactAssetImage('assets/images/Mask Group.png',
                                ),
                                fit: BoxFit.fill
                              ),
                              borderRadius: BorderRadius.circular(5)
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('Customers are owing you', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp
                              ),),
                              model.bought() - model.paid() > 0 ? Text(
                                '₦'+currency.format(model.bought() - model.paid()).toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto'
                                ),
                              ) : RichText(
                                text: TextSpan(
                                  text: 'NGN 0.', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '00.', style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold
                                    ),
                                    )
                                  ]
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                      ///Code for list commented out
//                      model.expectedTime !=null?  Column(
//                        children: <Widget>[
//                          Container(
//                            height: 50.h,
//                            width: MediaQuery.of(context).size.width,
//                            child: Center(
//                              child: TextField(
//                                controller: model.debtorsController,
//                                onChanged: model.searchDebtors,
//                                textAlign: TextAlign.justify,
//                                style:  TextStyle(
//                                  color: Colors.black,
//                                  fontSize: 14.sp,),
//                                decoration: InputDecoration(
//                                    hintText: 'Search by name',
//                                    hintStyle: TextStyle(
//                                      color: Color(0xFFACACAC),
//                                      fontSize: 14.sp,
//
//
//                                    ),
//                                    contentPadding:  const EdgeInsets.all(10.0),
//                                    prefixIcon:   Icon(Icons.search,color: BrandColors.primary,),
//                                    border: InputBorder.none
//
//                                ),
//                              ),
//                            ),
//                          ),
//                          SizedBox(height: 20.h,),
//                          Container(
//                            height: 50,
//                            child: Row(
//                              crossAxisAlignment: CrossAxisAlignment.center,
//
//                              children: <Widget>[
//                                CircleAvatar(
//                                  backgroundImage: ExactAssetImage('assets/images/man.png'),
//                                  radius: 20.w,
//                                ),
//                                SizedBox(width: 10.w,),
//                                Expanded(
//                                  child: Row(
//                                    crossAxisAlignment: CrossAxisAlignment.center,
//                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                    children: <Widget>[
//                                      Column(
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        crossAxisAlignment: CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Text('Seyi Onifade', style: TextStyle(
//                                            fontSize: 16.sp,),),
//                                          SizedBox(height:5.h),
//                                          Text('Expected a week ago', style: TextStyle(
//                                              fontSize: 13.sp,
//                                              color: Color(0xFFADADBD))),
//                                        ],
//                                      ),
//                                      Column(
//                                        crossAxisAlignment: CrossAxisAlignment.end,
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          Text('NGN ${model.amountOwing}', style: TextStyle(
//                                              fontSize: 16.sp,
//                                              color: Colors.red)),
//                                          SizedBox(height:5.h),
//                                          Container(
//                                            color: Colors.red.withOpacity(0.1),
//                                            child: Text('Overdue', style: TextStyle(
//                                                fontSize: 16.sp,
//                                                color: Colors.red)
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ],
//                                  ),
//                                ),
//
//                              ],
//                            ),
//                          ),
//                          SizedBox(height:5.h),
//                          Divider(color: Colors.black,),
//                          Container(
//                            height: 50,
//                            child: Row(
//                              crossAxisAlignment: CrossAxisAlignment.center,
//
//                              children: <Widget>[
//                                CircleAvatar(
//                                  backgroundImage: ExactAssetImage('assets/images/man.png'),
//                                  radius: 20.w,
//                                ),
//                                SizedBox(width: 10.w,),
//                                Expanded(
//                                  child: Row(
//                                    crossAxisAlignment: CrossAxisAlignment.center,
//                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                    children: <Widget>[
//                                      Column(
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        crossAxisAlignment: CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Text('Cythia Ike', style: TextStyle(
//                                            fontSize: 16.sp,),),
//                                          SizedBox(height:5.h),
//                                          Text('Expected in 2 weeks ', style: TextStyle(
//                                              fontSize: 13.sp,
//                                              color: Color(0xFFADADBD))),
//                                        ],
//                                      ),
//                                      Column(
//                                        crossAxisAlignment: CrossAxisAlignment.end,
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          Text('NGN 500', style: TextStyle(
//                                              fontSize: 16.sp,
//                                              color: Colors.green)),
//                                          SizedBox(height:5.h),
//                                          Container(
//                                            color: Colors.green.withOpacity(0.1),
//                                            child: Text('Not paid', style: TextStyle(
//                                                fontSize: 16.sp,
//                                                color: Colors.green)
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ],
//                                  ),
//                                ),
//
//                              ],
//                            ),
//                          ),
//                          SizedBox(height:5.h),
//                          Divider(color: Colors.black,),
//                        ],
//                      ):
                      model.owingcustomers.length == 0 ? Container(
                        height:height/2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.asset('assets/images/Notebook-pana 1.png'),
                              SizedBox(height: 20.h,),
                              Text('You do not have any customer owing you money yet. Tap the big blue button at the bottom of the screen to add one',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: BrandColors.primary),),
                            ],
                          ),
                        ),
                      ) : ContactList(),



                    ],
                  ),
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: InkWell(
//                onTap: ()=> Navigator.pushNamed(context, '/sendReminder'),
                onTap: ()=> Navigator.pushNamed(context, '/importcustomerdebtor'),
                child: Container(
                  height: 50.h,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: BrandColors.primary,
                    borderRadius: BorderRadius.circular(5)
                  ),

                  child: Center(
                    child: Text('Add customer owing you',
                      style: TextStyle(color: Colors.white,
                      fontSize: 12.sp,),
                    ),
                  ),
                ),
              ),
            )
          ] ,
        ),
      ),
      viewModelBuilder: () => HomePageViewModel(),
    );
  }
}


class ContactList extends StatelessWidget {
  final currency = new NumberFormat("#,##0", "en_NG");
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      builder: (context, model, child) => Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
              child: TextField(
                //controller: model.allCustomersController,
                //onChanged: model.searchAllCustomers,
                style:  TextStyle(
                  color: Colors.black,
                  fontSize: 14,),
                decoration: InputDecoration(
                  hintText: 'Search by name',
                  hintStyle: TextStyle(
                    color: Color(0xFFACACAC),
                    fontSize: 14,

                  ),
                  contentPadding:  const EdgeInsets.only(top: 18.0),
                  prefixIcon:   Icon(Icons.search,color: BrandColors.primary,),
                  border: InputBorder.none,
                ),
                onChanged: model.searchDName,
              ),
            ),
            for(var cont in model.owingcustomers)
              for (var item in model.contacts) 
              item.id == cont.cId ? 
              //Implementation for Search
              model.sDName != null && model.containsD ?
              item.name.contains(model.sDName) || item.name.contains(model.sDName.toUpperCase()) || item.name.contains(model.sDName[0].toUpperCase()+model.sDName.substring(1)) || item.name.contains(model.sDName.toLowerCase()) ?
              Container(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xFFD1D1D1)),
                    //bottom: BorderSide(color: Color(0xFFD1D1D1))
                  )
                ),
                child: ListTile(
                  onTap: () => model.setContact(item.id, item.name, item.phoneNumber),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/man.png',
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  title: Text(
                    item.name,
                    style: TextStyle(fontWeight: FontWeight.w600)
                  ),
                  subtitle: Text(
                    DateTime.now().difference(DateTime.parse(cont.duedate)).inDays % 7 == 0 ?
                    (DateTime.now().difference(DateTime.parse(cont.duedate)).inDays) > 0 ? 'Expected '+(DateTime.now().difference(DateTime.parse(cont.duedate)).inDays % 7).toString()+' weeks ago' :  'Expected in '+(DateTime.now().difference(DateTime.parse(cont.duedate)).inDays % 7.abs()).toString()+' weeks'
                    : 
                    (DateTime.now().difference(DateTime.parse(cont.duedate)).inDays) > 0 ? 'Expected '+(DateTime.now().difference(DateTime.parse(cont.duedate)).inDays).toString()+' days ago' : 'Expected in '+(DateTime.now().difference(DateTime.parse(cont.duedate)).inDays.abs()).toString()+' days'
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '₦'+currency.format((cont.amount - cont.paid).round()).toString(),
                          style: TextStyle(
                            color: (DateTime.now().difference(DateTime.parse(cont.duedate)).inDays) > 0 ? Colors.red : Colors.green, 
                            fontSize: 16,
                            fontFamily: 'Roboto'
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (DateTime.now().difference(DateTime.parse(cont.duedate)).inDays) > 0 ? Colors.red.withOpacity(0.1) : Colors.green.withOpacity(0.1)
                        ),
                        child: Text(
                          (DateTime.now().difference(DateTime.parse(cont.duedate)).inDays) > 0 ? 'Overdue' : 'Not Paid',
                          style: TextStyle(color: (DateTime.now().difference(DateTime.parse(cont.duedate)).inDays) > 0 ? Colors.red : Colors.green, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ) 
              : SizedBox()
              : model.sDName != null && !model.containsD ? SizedBox() : Container(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xFFD1D1D1)),
                    //bottom: BorderSide(color: Color(0xFFD1D1D1))
                  )
                ),
                child: ListTile(
                  onTap: () => model.setContact(item.id, item.name, item.phoneNumber),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/man.png',
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  title: Text(
                    item.name,
                    style: TextStyle(fontWeight: FontWeight.w600)
                  ),
                  subtitle: Text(
                    DateTime.now().difference(DateTime.parse(cont.duedate)).inDays % 7 == 0 ?
                    (DateTime.now().difference(DateTime.parse(cont.duedate)).inDays) > 0 ? 'Expected '+(DateTime.now().difference(DateTime.parse(cont.duedate)).inDays % 7).toString()+' weeks ago' :  'Expected in '+(DateTime.now().difference(DateTime.parse(cont.duedate)).inDays % 7.abs()).toString()+' weeks'
                    : 
                    (DateTime.now().difference(DateTime.parse(cont.duedate)).inDays) > 0 ? 'Expected '+(DateTime.now().difference(DateTime.parse(cont.duedate)).inDays).toString()+' days ago' : 'Expected in '+(DateTime.now().difference(DateTime.parse(cont.duedate)).inDays.abs()).toString()+' days'
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '₦'+currency.format((cont.amount - cont.paid).round()).toString(),
                          style: TextStyle(
                            color: (DateTime.now().difference(DateTime.parse(cont.duedate)).inDays) > 0 ? Colors.red : Colors.green, 
                            fontSize: 16,
                            fontFamily: 'Roboto'
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (DateTime.now().difference(DateTime.parse(cont.duedate)).inDays) > 0 ? Colors.red.withOpacity(0.1) : Colors.green.withOpacity(0.1)
                        ),
                        child: Text(
                          (DateTime.now().difference(DateTime.parse(cont.duedate)).inDays) > 0 ? 'Overdue' : 'Not Paid',
                          style: TextStyle(color: (DateTime.now().difference(DateTime.parse(cont.duedate)).inDays) > 0 ? Colors.red : Colors.green, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ) : SizedBox()
          ],
        ),
      ),
      viewModelBuilder: () => HomePageViewModel(),
    );
  }
}