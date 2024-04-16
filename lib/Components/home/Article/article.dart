import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:intl/intl.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Article(
        image:  'assets/doctor.jpg',
        name: 'Dr.Nafissa', 
        job: 'General Doctor', 
        title: 'The 25 Healthiest Fruits You Can Eat According to a Nutrionist', 
        paragraph: 'The 25 Healthiest Fruits You Can Eat According to a NutrionistThe 25 Healthiest Fruits You Can Eat According to a Nutrionist', 
        date: DateTime.now()),
        Article(
        image:  'assets/doctor.jpg',
        name: 'Dr.Nafissa', 
        job: 'General Doctor', 
        title: 'The 25 Healthiest Fruits You Can Eat According to a Nutrionist', 
        paragraph: 'The 25 Healthiest Fruits You Can Eat According to a NutrionistThe 25 Healthiest Fruits You Can Eat According to a Nutrionist', 
        date: DateTime.now()),
        Article(
        image: 'assets/doctor.jpg',
        name: 'Dr.Nafissa', 
        job: 'General Doctor', 
        title: 'The 25 Healthiest Fruits You Can Eat According to a Nutrionist', 
        paragraph: 'The 25 Healthiest Fruits You Can Eat According to a NutrionistThe 25 Healthiest Fruits You Can Eat According to a Nutrionist', 
        date: DateTime.now()),
      ],
    );
  }
}
class Article extends StatefulWidget {
  final String image;
  final String name;
  final String job;
  final String title;
  final String paragraph;
  final DateTime date;
   const Article({super.key, required this.image, required this.name, required this.job, required this.title, required this.paragraph, required this.date});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children:  [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             SizedBox(width: 50,height: 50,child: CircleAvatar(backgroundImage: AssetImage(widget.image),)),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Text(widget.job,style: const TextStyle(fontSize: 14,color: Colors.grey),),
              ],
            )
          ],),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
           Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text(widget.title,
            style: const TextStyle(fontSize: 23.5,color: primaryColor,fontWeight: FontWeight.w600),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left:8.0),
            child:  Text(widget.paragraph,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
              ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Row(children: [
  SizedBox(
    width: 130, 
    height: 30, 
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            side: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      onPressed: () {},
      child: const Text(
        "Lire l'article",
        style: TextStyle(color: primaryColor),
      ),
    ),
  ),
  SizedBox(width:  MediaQuery.of(context).size.width*0.01,),
  IconButton(
    onPressed: () {
      setState(() {
        isLiked = !isLiked;
      });
    },
    icon: isLiked ? const Icon(Icons.favorite, size: 30, color: primaryColor) : const Icon(Icons.favorite_outline, size: 30, color: primaryColor),
  ),
  SizedBox(width: MediaQuery.of(context).size.height * 0.015,),
  const Icon(Icons.calendar_today, color: Colors.grey,),
  SizedBox(width: MediaQuery.of(context).size.height * 0.01,),
  Text(DateFormat('yyyy-MM-dd').format(widget.date))
]),
        
        ],
        
      ),
    );
  }

  bool isLiked = false;
}


