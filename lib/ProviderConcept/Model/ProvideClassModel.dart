import 'package:flutter/material.dart';


class ProviderClassModel extends ChangeNotifier{

  // initializing variables

  String strText='This text will update on submit button click';
  String strText2='Both text will also update on submit button click';

  String strSingleText="";
  String strSingleText2="";

  // updating multiple text
  updateBothText(String value,String value2){
  strText=value;
  strText2=value2;
  notifyListeners();
  }

  String get fetchfirstText{
   return strText;
}
  String get fetchSecondText{
    return strText2;
  }

  // update and fetching single text
  updateSingleText(String val){
    strSingleText = val;
    notifyListeners();
 }

  String get fetchSingleText{
    return strSingleText;
  }

  updateSingleText2(String val){
    strSingleText2 = val;
    notifyListeners();
  }

  String get fetchSingleText2{
    return strSingleText2;
  }


}
class ProviderClassModelSingleBuild extends ChangeNotifier{

  // initializing variables
  String strSingleWidget="";

  updateSingleWidget(String val){
    strSingleWidget = val;
    notifyListeners();
  }

  String get fetchSingleWidget{
    return strSingleWidget;
  }


}