import 'package:performance/common/config/Config.dart';
import 'package:performance/common/dao/DaoResult.dart';
import 'package:performance/common/net/Address.dart';
import 'package:performance/common/net/Api.dart';

///
///通用Dao
///Date: 2019-08-07
class CommonDao {

  ///取得地區碼
  ///
  ///params: accNo(使用者No), cityCode(城市code), isValiData(是否是長官頁)
  static getAreaCodeList({accNo, cityCode, isValiData}) async {
    List<dynamic> dataArray = [];
    var res = await HttpManager.netFetch(Address.getAreaCodeList(accNo, cityCode, isValiData), null, null, null);
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
}