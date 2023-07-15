import 'package:crud/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestAPI/RestClient.dart';
class ProductCreateScreen extends StatefulWidget {

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {

  Map<String,String> FormValues ={
    "Img":"",
    "ProductCode":"",
    "ProductName":"",
    "Qty":"",
    "TotalPrice":"",
    "UnitPrice":""
  };


  bool Loading=false;

  InputOnchange(Mapkey,Textvalue){
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue());
    });
  }

  //Validation
  FormOnSubmit() async {
    if(FormValues['Img']!.length ==0){
      ErrorToast('Image Link Requard');

    }
    else if(FormValues['ProductCode']!.length ==0){
      ErrorToast('ProductCode Requard');

    }
    else if(FormValues['ProductName']!.length ==0){
      ErrorToast('Product Name Requard');
    }
    else if(FormValues['Qty']!.length ==0){
      ErrorToast('Product Qty Requard');
    }
    else if(FormValues['TotalPrice']!.length ==0){
      ErrorToast('Total Price Requard');
    }
    else if(FormValues['UnitPrice']!.length ==0){
      ErrorToast('Unit Price Requard');
    }else{


      setState(() {
        Loading=true;
      });

     await ProductCreateRequest(FormValues);

     setState(() {
       Loading=false;
     });


    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          //Background Graphics
          ScreenBackground(context),
          Container(
              child:Loading?(Center(child: CircularProgressIndicator(),)):((SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnchange("ProductName",Textvalue);
                      },
                      decoration: AppInputDecoration('Product Name'),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnchange("ProductCode",Textvalue);
                      },
                      decoration: AppInputDecoration('Product Code'),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnchange("Img",Textvalue);
                      },
                      decoration: AppInputDecoration('Product Image'),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnchange("UnitPrice",Textvalue);
                      },
                      decoration: AppInputDecoration('Unit Price'),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnchange("TotalPrice",Textvalue);
                      },
                      decoration: AppInputDecoration('Total Price'),
                    ),

                    SizedBox(height: 20),

                    AppDropDownStyle(
                        DropdownButton(
                          value:FormValues['Qty'] ,
                          items:[
                            DropdownMenuItem(child: Text('Select Qt'),value: "",),
                            DropdownMenuItem(child: Text('1 pcs'),value: "1 pcs",),
                            DropdownMenuItem(child: Text('2 pcs'),value: '2 pcs',),
                            DropdownMenuItem(child: Text('3 pcs'),value: '3 pcs',),
                            DropdownMenuItem(child: Text('4 pcs'),value: '4 pcs',),
                          ],
                          onChanged: (Textvalue){
                            InputOnchange("Qty",Textvalue);
                          },
                          underline: Container(),
                          isExpanded: true,
                        )
                    ),

                    SizedBox(height: 20),

                    Container(
                        child:ElevatedButton(
                            style: AppButtonStyle(),
                            onPressed: (){
                              FormOnSubmit();
                            },
                            child: SuccessButtonChild('Submit')
                        )
                    )
                  ],
                ),
              )))
          )
        ],
      ),
    );
  }
}
