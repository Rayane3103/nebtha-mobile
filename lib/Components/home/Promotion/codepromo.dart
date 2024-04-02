import 'package:flutter/cupertino.dart';

class CodePromos extends StatelessWidget {
  const CodePromos({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left:4.0),
              child: SizedBox(
        
                height: 120,
                child: ListView(
                scrollDirection: Axis.horizontal,
                 children:   const [
                    CodePromosComp(),
                    CodePromosComp(),
                    CodePromosComp(),
                    
                    

                  

              
                 ])));
  }
}

class CodePromosComp extends StatelessWidget {
  const CodePromosComp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        ),
                      child:Image.asset('assets/ramadan.png',fit: BoxFit.fitWidth,)
                          ),
                        ),
                      );
  }
}