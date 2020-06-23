
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mycustomers/ui/shared/const_color.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/size_extension.dart';

import '../home_page_viewmodel.dart';

class CreditorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: width, height: height);
    return ViewModelBuilder<HomePageViewModel>.reactive(
      builder: (context, model, child) => Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Container(
                          height: 150.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: BrandColors.secondary,
                              borderRadius: BorderRadius.circular(5)
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('You are owing customers', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp
                              ),),
                              Text('\$0', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36.sp,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ),
                      ),
                      Text('Current Creditors', style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 5.h,),
                      Text('These are the people you are owing', style: TextStyle(
                        color: Color(0xFFACACAC),
                        fontSize: 12.sp,

                      ),),
                      SizedBox(height: 20.h,),
                      Container(
                        height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          controller: model.creditorsController,
                          onChanged: model.searchCreditors,
                          style:  TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,),
                          decoration: InputDecoration(
                            hintText: 'Search for a creditor',
                            hintStyle: TextStyle(
                              color: Color(0xFFACACAC),
                              fontSize: 12.sp,

                            ),
                            contentPadding:  const EdgeInsets.all(8.0),
                            prefixIcon:   Icon(Icons.search,color: Color(0xFFACACAC),),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color:  Color(0xFFACACAC),),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color:  BrandColors.secondary,),
                              borderRadius: BorderRadius.circular(5),
                            ),

                          ),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Sorted by:', style: TextStyle(
                                color: Color(0xFF31393C),
                                fontSize: 14.sp,
                              ),),
                              Text('Date of issue', style: TextStyle(
                                color: Color(0xFF2D74DA),
                                fontSize: 14.sp,
                              ),),
                            ],
                          ),
                          InkWell(
                            onTap: (){},
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.filter_list, ),
                                Text('Filter', style: TextStyle(
                                  color: Color(0xFF2D74DA),
                                  fontSize: 14.sp,
                                ),),
                              ],
                            ),
                          ),

                        ],),
                      Container(
                        height: 100,
                        child: Center(child: Text('You don\'t have any creditors yet')),),


                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 50.h,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: BrandColors.primary,
                      borderRadius: BorderRadius.circular(5)
                  ),

                  child: Center(
                    child: Text('Add Customer',
                      style: TextStyle(color: Colors.white,
                        fontSize: 12.sp,),
                    ),
                  ),),
              ),
            )
          ] ,
        ),
      ),
      viewModelBuilder: () => HomePageViewModel(),
    );
  }
}
