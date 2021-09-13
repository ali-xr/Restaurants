import 'package:flutter/material.dart';
import 'package:restaurant/Delicious/delicious.dart';
import 'package:restaurant/home/DishContainer.dart';
import 'package:restaurant/home/homePage.dart';
import '../size_config.dart';

class CheckOutPage2 extends StatefulWidget {
  @override
  _CheckOutPage2State createState() => _CheckOutPage2State();
}

class _CheckOutPage2State extends State<CheckOutPage2> {
  String pay = "Card";
  String pay1 = "Card1";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 248, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(245, 245, 248, 1),
        leading: Padding(
          padding: EdgeInsets.only(left: getProportionScreenWidth(15.0)),
          child: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios, size: 20.0,color: Colors.black,),
          ),
        ),
        title: Text("Checkout",style: TextStyle(fontSize: getProportionScreenWidth(18.0), fontWeight: FontWeight.w400, color: Colors.black),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getProportionScreenHeight(18.0),),
          Container(
            margin: EdgeInsets.only(left: getProportionScreenWidth(45.0)),
            width: getProportionScreenWidth(310.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionScreenHeight(34.0),
                      fontWeight: FontWeight.w400),
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.edit_outlined, size: 20.0, color: Colors.black,))
              ],
            ),
          ),
          SizedBox(height: getProportionScreenHeight(30.0),),
          Padding(
            padding: EdgeInsets.only(left: getProportionScreenWidth(48.0)),
            child: Text(
              "Adress details",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionScreenWidth(17.0),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: getProportionScreenHeight(7.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile(
                  value: "Card",
                  groupValue: pay,
                  onChanged: (String? sel) {
                    setState(() {
                      pay = sel!;
                    });
                  },
                  title: Row(
                    children: [
                      Container(
                        width: 35.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFF47B0A),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Icon(
                          Icons.payment,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Card",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 70.0, right: 20.0),
                  child: Divider(
                    thickness: 1.5,
                  ),
                ),
                RadioListTile(
                  value: "Mobile",
                  groupValue: pay,

onChanged: (String? sel) {
                    setState(() {
                      pay = sel!;
                    });
                  },
                  title: Row(
                    children: [
                      Container(
                        width: getProportionScreenWidth(40.0),
                        height: getProportionScreenHeight(40.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFEB4796),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                            child: Icon(
                              Icons.account_balance,
                              color: Colors.white,
                              size: 20.0,
                            )),
                      ),
                      SizedBox(width: getProportionScreenWidth(10.0)),
                      Text(
                        "Mobile Money (MTN,VODA)",
                        style: TextStyle(
                          fontSize: getProportionScreenWidth(17.0),
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            width: getProportionScreenWidth(351.0),
            margin: EdgeInsets.only(left: getProportionScreenWidth(30.0), top: getProportionScreenHeight(15.0)),
            height: getProportionScreenHeight(167.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1, 1),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: getProportionScreenHeight(50.0),left: getProportionScreenWidth(50.0), bottom:getProportionScreenHeight(20.0)),
            child: Text(
              "Delivery method.",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionScreenWidth(17.0),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: getProportionScreenWidth(10.0), top: getProportionScreenHeight(7.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile(
                    value: "Card1",
                    groupValue: pay1,
                    onChanged: (String? sel) {
                      setState(() {
                        pay1 = sel!;
                      });
                    },
                    title: Text(
                      "Door delivery",
                      style: TextStyle(
                          fontSize: getProportionScreenWidth(17.0),
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      ),
                    )
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 70.0, right: 20.0),
                  child: Divider(
                    thickness: 1.5,
                  ),
                ),
                RadioListTile(
                    value: "Mobile",
                    groupValue: pay1,
                    onChanged: (String? sel) {
                      setState(() {
                        pay1 = sel!;
                      });
                    },
                    title: Text(
                      "Pick up",
                      style: TextStyle(
                          fontSize: getProportionScreenWidth(17.0),
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      ),

)
                ),
              ],
            ),
            width: getProportionScreenWidth(315.0),
            margin: EdgeInsets.only(left: getProportionScreenWidth(51.0)),
            height: getProportionScreenHeight(156.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1, 1),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: getProportionScreenHeight(60.0),left: getProportionScreenWidth(50.0), right: getProportionScreenWidth(10.0)),
            width: getProportionScreenWidth(300.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",style: TextStyle(fontSize: getProportionScreenWidth(17.0), fontWeight: FontWeight.w400, color: Colors.black),),
                Text("23,000",style: TextStyle(fontSize: getProportionScreenWidth(22.0), fontWeight: FontWeight.w400, color: Colors.black),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionScreenWidth(45.0),top: getProportionScreenHeight(25.0)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(getProportionScreenWidth(314.0), getProportionScreenHeight(70.0)),
                  primary: Color(0xFFFA4A0C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    titlePadding: EdgeInsets.all(0),
                    contentPadding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    title: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(237, 237, 237, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        )
                      ),
                      height: getProportionScreenHeight(66.0),
                        width: SizeConfig.screenWidth,
                        child: Padding(
                          padding: EdgeInsets.only(left: getProportionScreenWidth(40.0), top: getProportionScreenHeight(17.0)),
                          child: Text('Please note',style: TextStyle(fontSize: getProportionScreenWidth(20.0), fontWeight: FontWeight.w500),),
                        )),
                    content: Container(
                      width: SizeConfig.screenWidth,
                      height: getProportionScreenHeight(160.0),
                      child: Padding(
                        padding: EdgeInsets.only(left: getProportionScreenWidth(40.0), right: getProportionScreenWidth(40.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: getProportionScreenHeight(18.0),),
                            Text("Delivery to trasaco",style: TextStyle(fontSize: getProportionScreenWidth(15.0), fontWeight: FontWeight.w400, color: Colors.grey.shade600),),
                            Text("GHS 2 - GH 3",style: TextStyle(fontSize: getProportionScreenWidth(17.0), fontWeight: FontWeight.w400, color: Colors.black),),
                            SizedBox(height: getProportionScreenHeight(10.0),),
                            Divider(
                              thickness: 1.5,

),
                            SizedBox(height: getProportionScreenHeight(10.0),),
                            Text("Delivery to campus",style: TextStyle(fontSize: getProportionScreenWidth(15.0), fontWeight: FontWeight.w400, color: Colors.grey.shade600),),
                            Text("GHS 1",style: TextStyle(fontSize: getProportionScreenWidth(17.0), fontWeight: FontWeight.w400, color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                              elevation: 0,
                              primary: Colors.white,
                              fixedSize: Size(getProportionScreenWidth(150.0), getProportionScreenHeight(60.0))
                            ),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel",style: TextStyle(fontSize: getProportionScreenWidth(17.0), fontWeight: FontWeight.w600, color: Colors.grey.shade700),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(250, 74, 12, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)
                                  ),
                                  fixedSize: Size(getProportionScreenWidth(159.0), getProportionScreenHeight(70.0))
                              ),
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Delicious()));
                              },
                              child: Text("Proceed",style: TextStyle(fontSize: getProportionScreenWidth(17.0), fontWeight: FontWeight.w600, color: Colors.white),),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              child: Text(
                "Process to payment",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}