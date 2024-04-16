import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CodePromos extends StatefulWidget {
  const CodePromos({super.key});

  @override
  _CodePromosState createState() => _CodePromosState();
}

class _CodePromosState extends State<CodePromos> {
  late Future<List<String>> _imageUrlsFuture;

  @override
  void initState() {
    super.initState();
    _imageUrlsFuture = fetchImageUrls();
  }

 Future<List<String>> fetchImageUrls() async {
  final response = await http.get(Uri.parse('https://nebta.onrender.com/api/CodePromo'));
  
  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    List<String> imageUrls = [];

    for (var codes in jsonData) {
      dynamic imageValue = codes['Image'];
      if (imageValue != null && imageValue is String) {
        String imageUrl = imageValue;
        imageUrls.add(imageUrl);
      } else {
        print('Skipping null or unexpected type for image URL.');
      }
    }

    return imageUrls;
  } else {
    throw Exception('Failed to load image URLs');
  }
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0,bottom: 10),
      child: SizedBox(
        height: 120,
        child: FutureBuilder<List<String>>(
          future: _imageUrlsFuture,
          builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left:4.0, right: 4.0),
                    child: Container(
                              height: MediaQuery.of(context).size.width * 0.4,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 227, 227, 227),
                                borderRadius: BorderRadius.circular(25),
                              )),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return CodePromosComp(imageUrl: snapshot.data![index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class CodePromosComp extends StatelessWidget {
  final String imageUrl;

  const CodePromosComp({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = base64Decode(imageUrl.split(',').last);

    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.08,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.memory(
            bytes,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
