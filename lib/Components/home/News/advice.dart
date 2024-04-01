import 'package:flutter/cupertino.dart';

class Advice extends StatelessWidget {
  const Advice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left:4.0),
              child: SizedBox(
        
                height: 170,
                child: ListView(
                scrollDirection: Axis.horizontal,
                 children:   const [
                    AdviceComp(),
                    AdviceComp(),
                    AdviceComp(),
                    

                  

              
                 ])));
  }
}

class AdviceComp extends StatelessWidget {
  const AdviceComp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.35,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        ),
                      child:Image.network(
                              'https://i.postimg.cc/0QzNcHnq/2.png',
                               fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
  }
}