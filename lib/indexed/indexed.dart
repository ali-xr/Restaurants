import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/deliverService/deliverService.dart';
import 'package:restaurant/favorite/favoriteService.dart';
import 'package:restaurant/payment/payment.dart';

class Indexed extends StatefulWidget {
  QueryDocumentSnapshot indexed;
  int raqam;

  Indexed(this.indexed, this.raqam, {Key? key}) : super(key: key);

  @override
  _IndexedState createState() => _IndexedState();
}

class _IndexedState extends State<Indexed> {
  PageController _controller = PageController();

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.indexed);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 30.0),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 17.0,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0, top: 30.0),
            child: IconButton(
              onPressed: () async{
                 await FavoriteService(uidMeal: "${widget.raqam}").writeFirestore(
                    "${widget.indexed['rasm']}",
                    "${widget.indexed['ism1']}",
                    "${widget.indexed['ism2']}",
                    "${widget.indexed['narxi']}",
                    widget.raqam);
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.favorite_border,
                size: 19.0,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 241.21,
            width: 241.21,
            color: Colors.transparent,
            child: PageView.builder(
              onPageChanged: (inde) {
                setState(() {
                  pageIndex = inde;
                });
              },
              controller: _controller,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120),
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.indexed['rasm'],
                      ),
                      fit: BoxFit.cover),
                ));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 4.0,
                  backgroundColor: pageIndex == 0 ? Colors.red : Colors.grey,
                ),
              ),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 4.0,
                  backgroundColor: pageIndex == 1 ? Colors.red : Colors.grey,
                ),
              ),
              SizedBox(width: 10.0),
              CircleAvatar(
                radius: 4.0,
                backgroundColor: pageIndex == 2 ? Colors.red : Colors.grey,
              ),
              SizedBox(width: 10.0),
              CircleAvatar(
                radius: 4.0,
                backgroundColor: pageIndex == 3 ? Colors.red : Colors.grey,
              ),
            ],
          ),
          SizedBox(height: 30.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.indexed['ism1'] + " ",
                  style: TextStyle(fontSize: 23.0, color: Colors.black),
                ),
                TextSpan(
                  text: widget.indexed['ism2'],
                  style: TextStyle(fontSize: 23.0, color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            widget.indexed['narxi'],
            style: TextStyle(color: Colors.red, fontSize: 18.0),
          ),
          SizedBox(height: 25.0),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 33.0, right: 33.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery info",
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Delivered between monday aug and",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black26,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "thursday 20 from 8pm to 91.32pm",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black26,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    "Return policy",
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "All our foods are double checked before",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black26,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "leaving our stores so by any case you found",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black26,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "a broken food please contact our hotline",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black26,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "immediately",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 36.0, right: 36.0),
            child: ElevatedButton(
              onPressed: () async {
                await DeliverService(uidMeal: "${widget.raqam}").writeFirestore(
                    "${widget.indexed['rasm']}",
                    "${widget.indexed['ism1']}",
                    "${widget.indexed['ism2']}",
                    widget.indexed['narxi'],
                    widget.raqam);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckOutPage()));
              },
              child: Text("Add to cart"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  fixedSize: Size(MediaQuery.of(context).size.width, 60.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0))),
            ),
          )
        ],
      ),
    );
  }
}
