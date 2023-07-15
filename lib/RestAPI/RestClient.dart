import 'dart:convert';
import 'package:crud/Style/Style.dart';
import 'package:http/http.dart' as http;


//Product List
Future<List> ProductGridViewListRequest() async {
  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var PostHeader={"Content-Type":"application/json"};
  var response= await http.get(URL,headers:PostHeader);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SucccessToast("Request Success");
    return ResultBody['data'];
  }
  else{
    ErrorToast("Request fail ! try again");
    return [];
  }
}

//Product Create
Future<bool> ProductCreateRequest(FormValues) async{
  var URL=Uri.parse("https://crud.devnextech.com/api/v1/CreateProduct");
  var PostBody=json.encode(FormValues);
  var PostHeader={"Content-Type":"application/json"};
  var response= await  http.post(URL,headers:PostHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SucccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}


//Product Delete
Future<bool> ProductDeleteRequest(id) async{
  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
  var PostHeader={"Content-Type":"application/json"};
  var response=await http.get(URL,headers: PostHeader);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SucccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}



//Product Update
Future<bool> ProductUpdateRequest(FormValues,id) async{
  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);
  var PostBody=json.encode(FormValues);
  var PostHeader={"Content-Type":"application/json"};
  var response= await  http.post(URL,headers:PostHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SucccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}





