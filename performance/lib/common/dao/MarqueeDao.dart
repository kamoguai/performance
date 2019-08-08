import 'package:dio/dio.dart';
import 'package:performance/common/config/Config.dart';
import 'package:performance/common/dao/DaoResult.dart';
import 'package:performance/common/net/Address.dart';
import 'package:performance/common/net/Api.dart';

///
///走馬燈相關dao
///Date: 2019-08-06
class MarqueeDao {

  ///取得走馬燈列表
  ///
  ///params: function, acceptStatus(審核狀態), type(跑馬燈種類), accNo(使用者No), accName(使用者名稱), agencies(需求部門)
  static getOSDTaskList(Map jsonMap) async {
    List<dynamic> dataArray = [];
    Map<String,String> header = {};
    header["content-type"] = "application/json";
  
    var res = await HttpManager.netFetch(Address.getOSDTaskList(), jsonMap, header, new Options(method: "post"));
    if (res != null && res.result) {
      if(Config.DEBUG) {
        print("取得走馬燈列表resp => " + res.data.toString());
      }
      if(res.data["retCode"] == "00") {
        dataArray = res.data["data"];
        return new DataResult(dataArray, true);
      }
      else {
        return new DataResult(null, false);
      }
      
    }
    else {
      return new DataResult(null, false);
    }
  }

  ///取得跑馬燈最大字數
  ///
  ///params: function, accNo(使用者No)
  static getMaxLength(Map jsonMap) async {
    Map<String,String> header = {};
    header["content-type"] = "application/json";
    var resStr = 0;
    var res = await HttpManager.netFetch(Address.getMaxMessageLength(), jsonMap, header, new Options(method: "post"));
    if (res != null && res.result) {
      if(Config.DEBUG) {
        print("取得走馬燈列表resp => " + res.data.toString());
      }
      if(res.data["retCode"] == "00") {
        resStr = res.data["MaxLength"];
        return new DataResult(resStr, true);
      }
      else {
        return new DataResult(null, false);
      }
      
    }
    else {
      return new DataResult(null, false);
    }
  }
  
  ///
}