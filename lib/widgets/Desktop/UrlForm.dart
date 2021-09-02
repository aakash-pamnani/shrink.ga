import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urlshortner_flutter/consts/GenerateUrl.dart';
import 'package:urlshortner_flutter/consts/Size.dart';

class UrlForm extends StatefulWidget {
  @override
  _UrlFormState createState() => _UrlFormState();
}

class _UrlFormState extends State<UrlForm> {
  static String url = "", customString = "";
  TextEditingController customUrlController = TextEditingController();
  String errorMsg = "";
  final _formKey = GlobalKey<FormState>();
  final GlobalKey outputKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = Size.getWidth(context);
    double height = Size.getHeight(context);
    return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          SizedBox(
            width: width * 0.5,
            height: height * 0.5,
            child: SvgPicture.asset(
              "assets/photo.svg",
            ),
          ),
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: width > 800 ? width * 0.3 : width * 0.7),
              child: Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      onSaved: (value) {
                        url = value ?? "";
                      },
                      validator: (value) {
                        RegExp url = RegExp(
                            "(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,})");

                        if (!url.hasMatch(value ?? "")) {
                          return "Enter Valid Url";
                        } else {
                          return null;
                        }
                      },
                      decoration:
                          InputDecoration(hintText: "Enter Long Url..."),
                    ),
                    Row(
                      children: [
                        Text(GenerateUrl.url,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Size.getTextSize(2, context))),
                        Expanded(
                          child: TextFormField(
                            onSaved: (value) {
                              customString = value ?? "";
                            },
                            onChanged: (value) {
                              setState(() {
                                errorMsg = "";
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter short url";
                              } else {
                                return null;
                              }
                            },
                            style: TextStyle(
                                fontSize: Size.getTextSize(2, context)),
                            decoration: InputDecoration(
                                hintText: "Custom Url",
                                errorText: errorMsg == "" ? null : errorMsg),
                            controller: customUrlController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          if (!await checkIfCustomUrlExists(customString)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(seconds: 3),
                                content: Text("Please wait...")));
                            print(url);
                            print(customString);
                            createShortUrl();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(seconds: 2),
                                content: Text("Url Already Exists")));
                          }
                        } else {}
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Short"),
                      ),
                    ),
                  ])))
        ]);
  }

  Future<void> createShortUrl() async {
    String shorturl =
        (await GenerateUrl.generateShortUrl(url, customString))["shortUrl"];

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(shorturl),
          ElevatedButton(
              onPressed: () async {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                await Clipboard.setData(ClipboardData(text: shorturl)).then(
                    (value) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Copied to clipboard"))));
              },
              child: Text("Copy Link"))
        ])));
  }

  Future<bool> checkIfCustomUrlExists(String? customUrl) async {
    return await GenerateUrl.ifCustomUrlAlreadyExists(customUrl ?? "");
  }
}
