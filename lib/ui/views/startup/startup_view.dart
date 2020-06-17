import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* 
    1. Setup for screenutil, only needed once here
    2. screen resolution (in px) according to iPhone 11 pro max
    3. Import screen util to all views
    4. use in this manner E.g Container(width: 50.w, height:200.h)
    */
    ScreenUtil.init(context, width: 1242, height: 2688, allowFontScaling: true);

return ViewModelBuilder<StartupViewModel>.nonReactive(
      builder: (context, model, child) => PlatformScaffold(
        body: Center(
          child: PlatformCircularProgressIndicator(),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.setup(),
    );
  }
}