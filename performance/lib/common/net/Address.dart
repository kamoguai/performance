import 'dart:io';
import 'package:flutter/services.dart';
import 'package:performance/common/utils/AesUtils.dart';
///地址數據
class Address {
  static const String ssoDomain = "http://nsso.dctv.net.tw:8081/";
  static const String aesDomain = "http://asg.dctv.net.tw:8082/EncEDI/interfaceAES?data=";
  static const String kSNRHostPingName = "http://snr.dctv.tw:8989/";
  static const String wosDomainName = "http://wos.dctv.net.tw:8081/";
  // static const String labediDomainName = "http://labedi.dctv.net.tw:9090/"; //測試機
  static const String labediDomainName = "http://edi.dctv.net.tw:8082/";
  static const String urlOSDTask = "DCTVNotification/OSDAPIJson?";
  static const String getSsoKey = "SSO/json/login.do?";
  static const String getVersion = "ValidataVersion/json/index!checkVersion.action?";
  static const String loginAPI = "WorkOrder/json/wok!login.action?";
  static final String bundleID = "com.dc.booking";
  static final String verNo = "3.0.0715";


  ///檢查是否有更新app
  static getValidateVersionAPI() {
    String deviceType = "";
    try {
      if (Platform.isAndroid) {
        deviceType = "android";
      }
      else if (Platform.isIOS) {
        deviceType = 'ios';
      }
    } on PlatformException {
      
    }
    return "$wosDomainName/${getVersion}packageName=$bundleID&type=$deviceType&verNo=$verNo";
  }

  ///登入SSO
  static ssoLoginAPI(account, password, tokenId) {
    String deviceType = "";
    try {
      if (Platform.isAndroid) {
        deviceType = "android";
      }
      else if (Platform.isIOS) {
        deviceType = 'ios';
      }
    } on PlatformException {
      
    }
    return "$ssoDomain${getSsoKey}function=login&accNo=$account&passWord=$password&uniqueCode=12343234&sysName=booking&tokenType=$deviceType&tokenID=$tokenId&packageName=com.dc.booking&type=$deviceType";
  }
  ///-------------------- performance: WorkExpress api -------------------- ///
  ///登入業績api
  static performanceLogin(serviceURL, account, ssoKey) {
    return "$serviceURL?accNo=$account&ssoKey=$ssoKey&sysName=booking";
  }
  
  ///取得縣市選項
  static getCityCodeList(accNo, isValiData) {
    // var aesUri = AesUtils.aes128Encrypt("${kSNRHostName}SNRProcess?FunctionName=QuerySignalLog&CustCD=$custId");
    // var appendUrl = aesDomain + aesUri;
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!getCityCodeList.action?accNo=$accNo&isValiData=$isValiData";
    return appendUrl;
  }

  ///取得區域選項
  static getAreaCodeList(accNo, cityCode, isValiData) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!getAreaCodeList.action?accNo=$accNo&isValiData=$isValiData&cityCode=$cityCode";
    return appendUrl;
  }

  ///首頁第一頁裝機能量資料
  static getBookingReportList(accNo, wkDate, areaCode) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!bookReport.action?accNo=$accNo&wkDate=$wkDate";
    if (areaCode != null && areaCode != "") {
      appendUrl += "&areaCode=$areaCode";
    }
    return appendUrl;
  }

  ///取得統計分析
  static getStatisticalAnalysis(accNo, wkDate, cityCode, areaCode) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!getStatisticalAnalysis.action?accNo=$accNo&dataDate=$wkDate";
    if (cityCode != null && cityCode != "") {
      appendUrl += "&cityCode=$cityCode";
    }
    if (areaCode != null && areaCode != "") {
      appendUrl += "&areaCode=$areaCode";
    }
    return appendUrl;
  }

  ///取得區域分析
  static getPermissionsArea(accNo, wkDate, cityCode ) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!getPermissionsArea.action?accNo=$accNo&dataDate=$wkDate&cityCode=$cityCode";
    return appendUrl;
  }

  ///取得總工分析表
  static getWorkOrderAnalysis(accNo, wkDate, areaCode) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!workOrderAnalysisNew.action?accNo=$accNo&wkDate=$wkDate&areaCode=$areaCode";
    return appendUrl;
  }

  ///取得停機狀態
  static getM_StopCategory(accNo, wkDate) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!mStopCategory.action?accNo=$accNo&dataDate=$wkDate";
    return appendUrl;
  }

  ///取得繳費復機
  static getRestoreMM(accNo, wkDate) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!restoreMM.action?accNo=$accNo&dataDate=$wkDate";
    return appendUrl;
  }

  ///取得回收資料
  static geyRecyclingAnalysisList(accNo, wkDate, areaCode) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!recyclingAnalysisList.action?accNo=$accNo&dataDate=$wkDate&areaCode=$areaCode";
    return appendUrl;
  }

  ///取得戶籍戶數
  static geyCensusInfoAPI(accNo, wkDate) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!censusInfo.action?accNo=$accNo&dataDate=$wkDate";
    return appendUrl;
  }

  ///取得戶籍戶數分析
  static getCensusInfoAnalysis(accNo, wkDate) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!censusInfoAnalysis.action?accNo=$accNo&dataDate=$wkDate";
    return appendUrl;
  }

  ///取得業績分析
  static getWkempAnalysis(accNo, wkDate, areaCode) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!wkempAnalysis.action?accNo=$accNo&dataDate=$wkDate&areaCode=$areaCode";
    return appendUrl;
  }

  ///取得通路業績
  static getChannelWKEMPAPI(accNo, wkDate, areaCode) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!getChannelWKEMP.action?accNo=$accNo&dataDate=$wkDate&areaCode=$areaCode";
    return appendUrl;
  }

  ///取得通路區域
  static getAreaWKEMP(accNo, wkDate, lineNo, channDeptCD, deptCode) {

    var appendUrl = "${wosDomainName}WorkExpress/json/interface!getAreaWKEMP.action?accNo=$accNo&dataDate=$wkDate&lineNo=$lineNo&channDeptCD=$channDeptCD&deptCode=$deptCode";
    return appendUrl;

  }

  ///取得通路部門個人
  static getDeptWKEMP(accNo, wkDate, areaCode, deptCode) {
    var appendUrl = "${wosDomainName}WorkExpress/json/interface!getDeptWKEMP.action?accNo=$accNo&dataDate=$wkDate&areaCode=$areaCode&deptCode=$deptCode";
    return appendUrl;
  }

  ///走馬燈申請, post body
  static postInsertOSDTask() {
    var appendUrl = "$labediDomainName$urlOSDTask";
    return appendUrl;
  }

  ///取得走馬燈列表，post body
  static getOSDTaskList() {
    var appendUrl = "$labediDomainName$urlOSDTask";
    return appendUrl;
  }

  ///取得走馬燈最大字數，post body
  static getMaxMessageLength() {
    var appendUrl = "$labediDomainName$urlOSDTask";
    return appendUrl;
  }



  ///-------------------- publicWork: WorkReply api -------------------- ///
  ///取得派工部門列表
  static getOutDeptDailyList(dataDate, areaCode) {
    var appendUrl = "${wosDomainName}WorkReply/json/workInterface!outDeptDailyList.action?dataDate=$dataDate&areaCode=$areaCode";
    return appendUrl;
  }

  ///取得裝機未完工
  static getDtvReplyUnFinished(accNo, wkDate, areaCode, typeCode) {
    var appendUrl = "${wosDomainName}WorkReply/json/workInterface!bookingReplyUnFinished.action?accNo=$accNo&dataDate=$wkDate&areaCode=$areaCode&typeCode=$typeCode";
    return appendUrl;
  }

  ///取得維修完工
  static getServiceReply(accNo, wkDate, areaCode, isOpen, typeCode) {
    var appendUrl = "${wosDomainName}WorkReply/json/workInterface!repairReplyDataView.action?accNo=$accNo&dataDate=$wkDate&areaCode=$areaCode&isOpen=$isOpen&typeCode=$typeCode";
    return appendUrl;
  }

  ///取得裝機完工
  static getDtvReplyFinished(accNo, wkDate, areaCode, typeCode) {
    var appendUrl = "${wosDomainName}WorkReply/json/workInterface!bookingReplyFinished.action?accNo=$accNo&dataDate=$wkDate&areaCode=$areaCode&typeCode=$typeCode";
    return appendUrl;
  }




  ///-------------------- snr: snr api -------------------- ///
  ///小ping資料
  static getPingSNR(str) {
    String paraType = "";
    int type = 0;
    switch (type) {
      case 0: {
          paraType = "CustCode";
        }
        break;
      case 1: {
          paraType = "Telephone";
        }
        break;
      case 2: {
          paraType = "Address";
        }
        break;
      case 3: {
          paraType = "CMMAC";
        }
        break;
      default: {}
        break;

    }
    var aesUri = AesUtils.aes128Encrypt("$kSNRHostPingName/SNRping.php?Action=getSNR&$paraType=$str");
    var appendUrl = aesDomain + aesUri;
    return appendUrl;
  }
}