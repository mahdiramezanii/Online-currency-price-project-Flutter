
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {

  runApp(MyApp2());
  
}


class MyApp2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
     

      localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('fa',''), // English
  
  ],
      theme: ThemeData(
        fontFamily: "dana",
       textTheme:const  TextTheme(
        headline1: 
        TextStyle(
          fontFamily: "dana",
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w700
        ),

        headline2: 
        TextStyle(
          fontFamily: "dana",
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w300
        ),

        

       
       )
      ),

      home: Home(),
          
    );
  }



}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Image.asset("assets/images/icon.png"),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,17,0,0),
            child: Text("نرخ آنلاین ارز",style: Theme.of(context).textTheme.headline1,),
          ),
          
          Expanded(child: Align(alignment: Alignment.centerLeft,child: Image.asset("assets/images/menu.png"))),
          SizedBox(width: 8,)
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
          
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
              Image.asset("assets/images/q.png"),
               SizedBox(width: 8,),
              Text("نرخ آنلاین ارز چیست؟",style: Theme.of(context).textTheme.headline1 ,),
             
            ],)
            ,
            SizedBox(height: 8,),
            Text(" نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند."
        ,textDirection: TextDirection.rtl,style: Theme.of(context).textTheme.headline2,),
        SizedBox(height: 13,),

        Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(1000)),
            color:Color.fromARGB(255, 113, 113, 113),
          
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            
            Text("نام آزاد ارز",style: Theme.of(context).textTheme.headline1,),
            Text("قیمت",style: Theme.of(context).textTheme.headline1,),
            Text("تغییر",style: Theme.of(context).textTheme.headline1,)
          ],),

        ),

        Container(
          height: 20,
          width: double.infinity,
          decoration:BoxDecoration(
            color:Color.fromARGB(255, 184, 143, 143)
          ),

          child: ListView.builder(itemBuilder: (BuildContext context,int position){

                return Container(
                  height: 20,
          width: double.infinity,
          decoration:BoxDecoration(
            color:Color.fromARGB(255, 184, 143, 143)
          ),
                )
          }),
        )
      
          
          
        ]),
      ),
      );
  }
}

