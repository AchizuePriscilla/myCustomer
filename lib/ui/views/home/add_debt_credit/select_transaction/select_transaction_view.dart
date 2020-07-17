import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mycustomers/core/localization/app_localization.dart';
import 'package:mycustomers/core/models/hive/transaction/transaction_model_h.dart';
import 'package:mycustomers/ui/shared/const_color.dart';
import 'package:mycustomers/ui/shared/size_config.dart';
import 'package:mycustomers/ui/views/home/add_debt_credit/select_transaction/select_transactionViewmodel.dart';
import 'package:stacked/stacked.dart';

class SelectTransactionView extends StatelessWidget {
  final String action;

  const SelectTransactionView({Key key, this.action}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectTransactionViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                brightness: Brightness.light,
                elevation: 1,
                title: Text(
                  'Select a Transaction',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.bold,
                        color: action == 'credit'
                            ? BrandColors.secondary
                            : BrandColors.primary,
                      ),
                ),
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(18),
                        vertical: ScreenUtil().setHeight(10)),
                    child: SvgPicture.asset(
                      'assets/icons/backarrow.svg',
                      color: action == 'credit'
                          ? BrandColors.secondary
                          : BrandColors.primary,
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.yMargin(context, 0.8)),
                          decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(5)),
                          child: ListTile(
                            onTap: () => model.navigateNotSelect(action),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFFE0E0E0),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.attach_money,
                                  color: action == 'credit'
                                      ? BrandColors.secondary
                                      : BrandColors.primary,
                                ),
                              ),
                            ),
                            title: Text(
                              action == 'credit'
                                  ? 'Add New Credit'
                                  : 'Add New Debit',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      fontSize:
                                          SizeConfig.yMargin(context, 2.2),
                                      fontWeight: FontWeight.w500),
                            ),
                          ),
                          child: Text(
                            action == 'credit' ? '₦'+item.amount.round().toString() : 'N'+item.paid.round().toString(),
                            style: Theme.of(context).textTheme.headline6.copyWith(color: action == 'credit' ? BrandColors.primary : BrandColors.secondary, fontSize: SizeConfig.yMargin(context, 3), fontWeight: FontWeight.w900, fontFamily: 'Roboto'),
                          ),
                        ),
                        for (var item in action == 'credit'
                            ? model.debitList
                            : model.creditList)
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              model.setTransaction(item, action);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.yMargin(context, 2),
                                  horizontal: 10),
                              decoration: BoxDecoration(
                                  //color: Color(0xFFF0F0F0),
                                  //borderRadius: BorderRadius.circular(5),
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.black12))),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 15),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: action == 'credit'
                                          ? BrandColors.primary.withOpacity(0.2)
                                          : BrandColors.secondary
                                              .withOpacity(0.2),
                                    ),
                                    child: Text(
                                      action == 'credit'
                                          ? 'N' + item.amount.round().toString()
                                          : 'N' + item.paid.round().toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                              color: action == 'credit'
                                                  ? BrandColors.primary
                                                  : BrandColors.secondary,
                                              fontSize: SizeConfig.yMargin(
                                                  context, 3),
                                              fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xFFF0F0F0),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              item.goods.length > 1
                                                  ? 'Items: '
                                                  : 'Item: ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  .copyWith(
                                                    fontSize:
                                                        SizeConfig.yMargin(
                                                            context, 2),
                                                  ),
                                            ),
                                            for (var goods in item.goods)
                                              Container(
                                                child: Text(
                                                  item.goods.indexOf(goods) !=
                                                          item.goods.length - 1
                                                      ? goods + ', '
                                                      : goods,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6
                                                      .copyWith(
                                                        fontSize:
                                                            SizeConfig.yMargin(
                                                                context, 2),
                                                      ),
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          action == 'credit'
                                              ? DateFormat('dd/MM/yyyy').format(
                                                  DateTime.parse(
                                                      item.boughtdate))
                                              : DateFormat('dd/MM/yyyy').format(
                                                  DateTime.parse(
                                                      item.paiddate)),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(
                                                fontSize: SizeConfig.yMargin(
                                                    context, 1.8),
                                              ),
                                        ),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          )
                      ],
                    )),
              ),
            ),
        viewModelBuilder: () => SelectTransactionViewModel());
  }
  // Widget tile(BuildContext context, List<TransactionModel> actionList, int index){
  //   return Container(
  //     child: Row(
  //       children: <Widget>[
  //         Container(
  //           child: Text(
  //             actionList[index].
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
