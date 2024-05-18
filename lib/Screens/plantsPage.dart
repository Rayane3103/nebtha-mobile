import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nebtha/Components/plants%20page/product_card.dart';
import 'dart:convert';

import 'package:nebtha/Constants/design.dart';
import 'package:nebtha/Services/auth_account.dart';

class PlantsPage extends StatefulWidget {
 final Map<String, dynamic> profileData;
   final Function(List<Map<String, dynamic>>) updateSelectedProducts; // Add this line

   const PlantsPage({super.key, required this.profileData, required this.updateSelectedProducts});

  @override
  _PlantsPageState createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
   List<Map<String, dynamic>> selectedProducts = [];

  List<Map<String, dynamic>> nocifs_products = [];
  List<Map<String, dynamic>> reco_products = [];
  Random random = Random();
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
      selectedProducts = []; // Initialize selectedProducts list
    fetchNocif();
    fetchRecomonde();
final List<String> nocif = widget.profileData['nocif'] != null
    ? List<String>.from(widget.profileData['nocif'])
    : [];
  }

  @override
  void dispose() {
    // Dispose of any resources here
    super.dispose();
  }

  Future<void> fetchNocif() async {
  try {
    
    if (widget.profileData['nocif'] != null) {

      for (String productId in widget.profileData['nocif']) {
        final response = await http.get(
          Uri.parse('https://nebta.onrender.com/api/product/$productId'),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          final productData = json.decode(response.body);
          print(productData['ProductName']);
          setState(() {
            nocifs_products.add(productData);
          });
        } else {
          throw Exception('Failed to load product with ID: $productId');
        }
      }
                isLoading = false;

    }
  } catch (e) {
    print(e);
  }
}
List<Map<String, dynamic>> cart_products=[];



Future<void> fetchRecomonde() async {
  try {
    
    if (widget.profileData['recomonde'] != null) {

      for (String productId in widget.profileData['recomonde']) {
        final response = await http.get(
          Uri.parse('https://nebta.onrender.com/api/product/$productId'),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          final productData = json.decode(response.body);
          print(productData['ProductName']);
          setState(() {
            reco_products.add(productData);
          });
        } else {
          throw Exception('Failed to load product with ID: $productId');
        }
      }
                isLoading = false;

    }
  } catch (e) {
    print(e);
  }
}



  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Column(
        children: [
           const TabBar(
            labelColor: primaryColor,
            indicatorColor: primaryColor,
            tabs: [
                            Tab(text: 'Recomondé'),

              Tab(text: 'Nocifs'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                                _buildProductGridView(products: reco_products, reco: true),

                _buildProductGridView(products: nocifs_products, reco: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGridView(
      {required List<Map<String, dynamic>> products, required bool reco}) {
    return isLoading
        ? _buildLoadingIndicator()
        : GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: MediaQuery.of(context).size.height * 0.43,
            ),
            itemBuilder: (BuildContext context, int index) {
              final product = products[index];
              return ProductCard(
                color: Colors.white,
                reco: reco,
                ProductName: product['ProductName'],
                ProductArabicName: product['ProductArabicName'],
                Productdesc: product['Productdesc'],
                Price: product['Price'],
                Image: product['Image'], 
                Propriete: [product['Propriete']],
               onPurchase: () {
  setState(() {
    selectedProducts.add(product);
    print('added ${product['ProductName']}');

    widget.updateSelectedProducts(selectedProducts);
  });
  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Produit ajouté au panier avec succès', style: TextStyle(color: Colors.white)),
                      backgroundColor: primaryColor,
                      duration: const Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'Fermer',
                        textColor: Colors.white,
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
},
              );
            },
          );
  }

  Widget _buildLoadingIndicator() {
    return GridView.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: MediaQuery.of(context).size.height * 0.43,
            ),
            itemBuilder: (BuildContext context, int index) {
              
              return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.41,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 227, 227, 227),
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Color.fromARGB(255, 227, 227, 227),
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
      ));
    });
    }
}