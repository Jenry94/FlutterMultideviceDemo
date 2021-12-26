import 'dart:math';

import 'package:flutter/material.dart';

EdgeInsets globalPading(BuildContext context){
  if(checkScreen(context)){
    return EdgeInsets.fromLTRB(
      MediaQuery.of(context).size.width * .05, 
      MediaQuery.of(context).size.height * .015, 
      MediaQuery.of(context).size.width * .05, 
      MediaQuery.of(context).size.height * .015
    );
  }
  return EdgeInsets.fromLTRB(
    MediaQuery.of(context).size.width * .025, 
    MediaQuery.of(context).size.height * .005, 
    MediaQuery.of(context).size.width * .025, 
    MediaQuery.of(context).size.height * .005
  );
}

bool checkScreen(BuildContext context){
  var size = MediaQuery.of(context).size;
  var diagonal = sqrt((size.width * size.width) + (size.height * size.height));
  if(diagonal > 1100.0){
    return false;
  }
  return true;
}