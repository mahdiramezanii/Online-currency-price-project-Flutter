
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Model/Model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import "dart:convert" as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() {

  runApp(MyApp2());
  
}


class MyApp2 extends StatefulWidget{
  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
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

        headline3: TextStyle(
          fontFamily: "dana",
          fontSize:16,
          fontWeight: FontWeight.w300,
          color:Colors.red
        ),

        headline4: TextStyle(
          fontFamily: "dana",
          fontSize:16,
          fontWeight: FontWeight.w300,
          color:Colors.green
        )


       )
      ),

      home: Home(),
          
    );
  }
}


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
List<Currency> currency=[];

    Future get_data(BuildContext context) async{

      var url="https://sasansafari.com/flutter/api.php?access_key=flutter123456";

      var value =await http.get(Uri.parse(url));

        if (value.statusCode==200){

          _showmsg(context, "به روز رسانی با موفقیت انجام شد");

              List Jsonlist = convert.jsonDecode(value.body);

              if (currency.length  == 0 ){

                if (Jsonlist.length > 0){

                  for (int i=0;i<Jsonlist.length;i++){

                    setState(() {
                      currency.add(Currency(id: Jsonlist[i]["id"], 
                    titel: Jsonlist[i]["title"], 
                    price: Jsonlist[i]["price"], 
                    change: Jsonlist[i]["changes"], 
                    status: Jsonlist[i]["status"]));
                    });
                  }
                }
              }
        };

        return value;
      
    }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_data(context);
  }
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
          
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
              Image.asset("assets/images/q.png"),
              const SizedBox(width: 8,),
              Text("نرخ آنلاین ارز چیست؟",style: Theme.of(context).textTheme.headline1 ,),
             
            ],)
            ,
            const SizedBox(height: 8,),
            Text(" نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند."
        ,style: Theme.of(context).textTheme.headline2,),
        const SizedBox(height: 13,),

        Container(
          height: 30,
          decoration: const BoxDecoration(
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
          height: 350,
          width: double.infinity,
  
          child:FutureBuilder(builder: (context,snapshot){

                return (snapshot.hasData? ListView.separated(
            itemCount: currency.length,
            itemBuilder:(BuildContext context,int postion){

              return itemlist2(postion,currency);

          }, separatorBuilder: (BuildContext context, int index) { 
              if (index % 9 == 0){
                  return itemlist();
              }else{
                return SizedBox(width: 0,);
              }
            
           },):Center(child: CircularProgressIndicator(),));
          },future: get_data(context),),
        ),
       Padding(
         padding: const EdgeInsets.fromLTRB(0,12,0,0),
         child: Container(
          height: 50,
          width:double.infinity ,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 210, 210, 210),
            borderRadius: BorderRadius.circular(1000),
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            SizedBox(
              height: 50,
              child: TextButton.icon(
                style: ButtonStyle(backgroundColor:
                 MaterialStateProperty.all(Color.fromARGB(255, 216, 210, 246)),
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>
                 (RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)))
                 ),

                onPressed: (){

                  currency.clear;

                  FutureBuilder(builder: (context,snapshot){

                return (snapshot.hasData? ListView.separated(
            itemCount: currency.length,
            itemBuilder:(BuildContext context,int postion){

              return itemlist2(postion,currency);

          }, separatorBuilder: (BuildContext context, int index) { 
              if (index % 9 == 0){
                  return itemlist();
              }else{
                return SizedBox(width: 0,);
              }
            
           },):Center(child: CircularProgressIndicator(),));
          },future: get_data(context),);
                  
                }, icon: Icon(Icons.refresh,color: Colors.black,),
               label: Padding(
                 padding: const EdgeInsets.fromLTRB(8,0,0,0),
                 child: Text("به روز رسانی",style: Theme.of(context).textTheme.bodyText1,),
               )),
            ),
            Text("آخرین به روز رسانی ${_get_time()}"),
            SizedBox(width: 1,)
          ]) 
          ,
         ),
       )
      
          
          
        ]),
      ),
      );
  }
}

String _get_time(){



  DateTime now=DateTime.now();

  return DateFormat("kk:mm:ss").format(now);

}


void _showmsg(BuildContext context,String msg){

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg,style: Theme.of(context).textTheme.headline1,),backgroundColor: Colors.green,));
}


class itemlist extends StatelessWidget {
  const itemlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,10,0,0),
      child: Container(
    
        
        width: double.infinity,
        height: 60,
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 1.2,
              color: Colors.grey
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          color: Color.fromARGB(255, 213, 12, 12),
        ),
    
        child: 
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround
          ,children: [
          Text("تبلیغات",style: TextStyle(color: Colors.white,fontFamily: "dana",fontSize: 18),),
        
        ]),
      ),
    );
  }
}




class itemlist2 extends StatelessWidget {

 
  int postion;
  List<Currency> currency;

  itemlist2( this.postion,this.currency);

  @override
  Widget build(BuildContext context) {

    

    return Padding(
      padding: const EdgeInsets.fromLTRB(0,10,0,0),
      child: Container(
    
        
        width: double.infinity,
        height: 60,
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 1.2,
              color: Colors.grey
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
    
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround
          ,children: [
          Text(currency[postion].titel!
          ,style: Theme.of(context).textTheme.headline2,),

          Text(currency[postion].price!
          ,style: Theme.of(context).textTheme.headline2,),
          Text(currency[postion].change!
          ,style:currency[postion].status=="n"?Theme.of(context).textTheme.headline3:Theme.of(context).textTheme.headline4,),
        ]),
      ),
    );
  }
}
