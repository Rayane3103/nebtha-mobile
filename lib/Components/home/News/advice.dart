import 'package:flutter/cupertino.dart';

class Advice extends StatelessWidget {
  const Advice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left:4.0),
              child: SizedBox(
        
                height: 150,
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
                  padding: const EdgeInsets.only(right: 4.0,left: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.35,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        ),
                      child:Image.asset('assets/1.png')
                          ),
                        ),
                      );
  }
}