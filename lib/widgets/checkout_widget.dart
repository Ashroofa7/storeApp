import 'package:flutter/material.dart';
import 'package:store_app_th/tools/helper/customButton.dart';
import 'package:store_app_th/tools/helper/textfield.dart';
import 'package:store_app_th/tools/models/product_model.dart';
import 'package:store_app_th/widgets/products_widget.dart';

class Checkout extends StatefulWidget {
  Checkout(this.product, {Key? key}) : super(key: key);
  ProductModel product;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  var name = TextEditingController();
  var email = TextEditingController();
  var address = TextEditingController();
  var phone = TextEditingController();
  int x = 1;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Chekout',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Row(
                    children: [
                      // detail of image
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .25,
                        child: Image(
                          image: NetworkImage(
                            '${widget.product.image}',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Detail of title
                            Text(
                              widget.product.title!,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            //Detail of price and rating
                            Text(
                              '${widget.product.price}' r' $',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade900,
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (x < 1) {
                                            } else {
                                              setState(() {
                                                x--;
                                              });
                                            }
                                          },
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '$x',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              x++;
                                            });
                                          },
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: name,
                    type: TextInputType.text,
                    radius: 20,
                    hint: 'Name',
                    textColor: Colors.black,
                    valid: (v) {
                      if (v == null || v.isEmpty) {
                        return "plese enter your Name";
                      }
                    },
                    focusedBorderColor: Colors.blue.shade900,
                    labelText: 'Name',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    radius: 20,
                    controller: email,
                    type: TextInputType.emailAddress,
                    hint: 'E-mail',
                    textColor: Colors.black,
                    valid: (v) {
                      if (v == null || v.isEmpty) {
                        return "plese enter your E-Mail";
                      }
                    },
                    focusedBorderColor: Colors.blue.shade900,
                    labelText: 'E-mail',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    radius: 20,
                    controller: address,
                    type: TextInputType.streetAddress,
                    hint: 'Address',
                    textColor: Colors.black,
                    valid: (v) {
                      if (v == null || v.isEmpty) {
                        return "plese enter your Address";
                      }
                    },
                    focusedBorderColor: Colors.blue.shade900,
                    labelText: 'Address',
                    disabledBorderColor: Colors.orange,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: phone,
                    type: TextInputType.phone,
                    radius: 20,
                    hint: 'Mobile',
                    textColor: Colors.black,
                    valid: (v) {
                      if (v == null || v.isEmpty) {
                        return "plese enter your Phone Number";
                      }
                    },
                    focusedBorderColor: Colors.blue.shade900,
                    labelText: 'Mobile',
                    disabledBorderColor: Colors.orange,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 4.0, left: 4, right: 4),
                            child: Text(
                              'Total Price = ${widget.product.price * x}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomButton(
                        height: 40,
                        width: 120,
                        fontweight: FontWeight.w500,
                        fontsize: 25,
                        radius: 10,
                        Containercolor: Colors.orange,
                        Textcolor: Colors.white,
                        name: 'Checkout',
                        ontap: () {
                          if(formkey.currentState!.validate()){

                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return Products();
                              }), (route) => false);
                              print('gege');}
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
