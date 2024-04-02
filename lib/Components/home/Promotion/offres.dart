import 'package:flutter/cupertino.dart';

class Offres extends StatelessWidget {
  const Offres({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left:4.0),
              child: SizedBox(
        
                height: 180,
                child: ListView(
                scrollDirection: Axis.horizontal,
                 children:   const [
                    OffreComp(),
                    OffreComp(),
                    OffreComp(),
                    

                  

              
                 ])));
  }
}

class OffreComp extends StatelessWidget {
  const OffreComp({super.key});
  
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