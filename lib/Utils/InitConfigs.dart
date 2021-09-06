import 'package:flutter/foundation.dart';

bool isMobile = true;


initConfigs(){
  isMobile = (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS);
}