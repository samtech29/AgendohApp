import 'package:agendoh/homeScreen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quickalert/quickalert.dart';

class Addpayment_1 extends StatelessWidget {
  const Addpayment_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Add a payment "),
        //brightness: Brightness.light,
        // backgroundColor: Colors.white,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.push(
        //                           context,
        //                           MaterialPageRoute(
        //                               builder: (context) => HomePage()));
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     size: 20,
        //     color: Colors.white,
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [Text("Scan completed now verify your data")],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/card.png",
                        height: 150,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        "Card Information",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CardNumberFormatter(),
                        ],
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          // prefixIcon: Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Image.network(
                          //     'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/800px-Mastercard-logo.svg.png',
                          //     height: 30,
                          //     width: 30,
                          //   ),
                          // ),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Change',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                          border: const OutlineInputBorder(),
                          hintText: 'XXXX XXXX XXXX XXXX',
                          labelText: 'Card Number',
                        ),
                        maxLength: 19,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          // prefixIcon: Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Image.network(
                          //     'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/800px-Mastercard-logo.svg.png',
                          //     height: 30,
                          //     width: 30,
                          //   ),
                          // ),

                          border: const OutlineInputBorder(),
                          hintText: 'Enter Name',
                          labelText: 'Card Holder Name',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        // fillColor: Colors.white,
                        hintText: 'Expiry Date ',
                        hintStyle: TextStyle(fontSize: 16),
                        border: const OutlineInputBorder(),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        //   borderSide: BorderSide.none,
                        // ),
                        filled: false,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        // fillColor: Colors.white,
                        hintText: 'CVV ',
                        hintStyle: TextStyle(fontSize: 16),
                        border: const OutlineInputBorder(),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        //   borderSide: BorderSide.none,
                        // ),
                        filled: false,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(color: Colors.blue)))),
                            child: Text("Cancel")),
                      ),
                      SizedBox(
                        height: 40, //height of button
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                text: 'Transaction Completed Successfully!',
                              );
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(color: Colors.blue)))),
                            child: Text("Done")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
