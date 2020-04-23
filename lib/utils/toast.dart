/*
 * @Author: HADES 
 * @Date: 2020-04-14 16:50:20 
 * @Last Modified by: HADES
 * @Last Modified time: 2020-04-14 16:50:42
 */

import 'package:bot_toast/bot_toast.dart';

class Toast{
  static show(String msg){
    BotToast.showText(text: msg);
   }
}