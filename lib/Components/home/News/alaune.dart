import 'package:flutter/cupertino.dart';

class LaUne extends StatelessWidget {
  const LaUne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left:4.0),
              child: SizedBox(
        
                height: 180,
                child: ListView(
                scrollDirection: Axis.horizontal,
                 children:   const [
                    LaUneComp(),
                    LaUneComp(),
                    LaUneComp(),
                    LaUneComp(),

                  

              
                 ])));
  }
}

class LaUneComp extends StatelessWidget {
  const LaUneComp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.only(right: 4.0,left: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        ),
                      child:Image.asset('assets/1.png')
                          ),
                        ),
                      );
  }
}