import 'dart:convert';

import 'package:wasl/core/class/stausrequest.dart';
import 'package:wasl/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class Crud {
  Future<Either<StatusRequest,Map>> postData({String? linkUrl,Map? data}) async {
    try{

      Future.delayed(const Duration(seconds: 3));
      if(await checkInternet()){
        print("link url ====== $linkUrl");
        print("data send ====== $data");
        var response = await http.post(Uri.parse(linkUrl.toString()),body:data);
        if(response.statusCode == 200 || response.statusCode == 201){
          print("status code ------ ${response.statusCode}");
          print("res ------ ${response.body}");
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        }
        else{
          //حطاء في الرابط او الصفحة
          return const Left(StatusRequest.serverFailure);
        }
      }else{//no internet
        return const Left(StatusRequest.offlineFailure);
      }

    }catch(_){
      print(_);
      print("catch -------- .");
      return const Left(StatusRequest.serverException);
    }
  }
}
