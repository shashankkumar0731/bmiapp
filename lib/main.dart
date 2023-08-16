import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   var wtController = TextEditingController();
   var ftController = TextEditingController();
   var inController = TextEditingController();
   var result = "";
   var bgcolor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('yourBMI'),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text('BMI',style: TextStyle(
              fontSize: 35, fontWeight:FontWeight.w700
            ),),

                SizedBox(height: 22,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in kgs'),
                        prefixIcon: Icon(Icons.line_weight)

                  ),
                  keyboardType: TextInputType.number ,
                ),
                SizedBox(height: 12,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (in Feet)'),
                      prefixIcon: Icon(Icons.height)

                  ),
                  keyboardType: TextInputType.number ,
                ),
                SizedBox(height: 12,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (in inch)'),
                      prefixIcon: Icon(Icons.height)

                  ),
                  keyboardType: TextInputType.number ,
                ),
                SizedBox(height: 12,),

                ElevatedButton(onPressed:()
    {
        var wt = wtController.text.toString();
        var ft = ftController.text.toString();
        var inch = inController.text.toString();

        if (wt != "" && ft != "" && inch != ""){
          //BMI Calculation

          var iwt = int.parse(wt);
          var iFt = int.parse(ft);
          var iInch = int.parse(inch);

          var tinch = (iFt*12) + iInch;

          var tcm = tinch*2.54;
          var tM = tcm/100;
          var bmi = iwt/(tM*tM);

          var msg = "";


          if (bmi>30 ){
            msg = "you are overweigh!!!";
            bgcolor = Colors.orange.shade200;

          } else if(bmi<15){
            msg = "you are underweight!!";
            bgcolor = Colors.red.shade200;

          } else {
            msg = "you are healthy!!!";
            bgcolor = Colors.green.shade200;

          }
          setState(() {

          });
          result = "$msg \n your BMI is: ${bmi.toStringAsFixed(3)}";

        } else {
          setState(() {
            result = "please fill the all the required spaces! ! ";
          });

        }




                }, child: Text('CalCulate')),
                SizedBox(height: 12,),

                Text(result,style: TextStyle(fontSize: 22),)
              ],
            ),
          ),
        ),
      )
    );
  }
}
