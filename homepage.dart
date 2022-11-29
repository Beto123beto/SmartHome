
  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();

}
const height1 = 45.0;
final color1 = Colors.grey[800];

class _HomePageState extends State <HomePage> {
  //List Of Smart Devices
  List mySmartDevices =[
    ["RM1-Light", "assets/images/light.png", true],
    ["RM2-Light", "assets/images/light.png", true],
    ["Fan", "assets/images/yfan.png", true],
    
    ["Temp", "assets/images/ytemp.png", true],



  ];

  //Power Button Switched

  void powerSwitchedChanged(bool value , int index){
    setState(() {
      mySmartDevices[index][2]=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
     body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            Padding(
               padding: const EdgeInsets.symmetric(
                   horizontal: 25,
                 vertical: 25


               ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 //Menu Icon
                 Icon(Icons.menu,
                   size: height1,
                   color: color1,

                 ),
                 //Account Icon
                 Icon(
                   Icons.person,
                   size: height1,
                   color: color1,

                 ),
               ],
             ),
           ),
const SizedBox(height: 20,),


          //Welcome
Padding(
    padding:const EdgeInsets.symmetric(horizontal: height1),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:  [
      Text(
        "Welcome",
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey[700]
        )
      ),
      Text(
        "Kings S-Home",
        style: GoogleFonts.bebasNeue(
          fontSize: 40,
          color: Colors.deepPurple,
        ),
      ),
    ],
  ),
),

           const SizedBox(height: 20,),


           //Smart Devices + Grid



            const Padding(
               padding: EdgeInsets.symmetric(horizontal: height1),
             child: Text(
                 "Smart Devices",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 24,


               ),

             ),
           ),

           Expanded(
               child: GridView.builder(
                 itemCount: mySmartDevices.length,
                   padding:const EdgeInsets.all(25),
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     childAspectRatio: 1 /1.4,

                   ),
                   itemBuilder: (context, index){
                     return Padding(
                         padding: EdgeInsets.all(1),
                        child: SmartDeviceBox(
                          smartDeviceName: mySmartDevices[index][0],
                          iconPath: mySmartDevices[index][1],
                          powerOn: mySmartDevices[index][2],
                          onChanged: (value) => powerSwitchedChanged(value, index),
                        )
                     );
                   }
               )
           ),
           Center(
               child: Text(
                   "Enjoy The best Experience @ Kings-Production ltd",
                 style: GoogleFonts.aBeeZee(
                   textStyle: TextStyle(
                     fontSize: 10,
                     fontWeight: FontWeight.bold,
                   )
                 ),

               )
           )

         ],
       ),
     ),

    );
  }
}
