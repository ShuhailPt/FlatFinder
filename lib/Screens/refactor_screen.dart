import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leads/Constants/MyColors.dart';
import 'package:leads/Controllers/main_provider.dart';
import 'package:provider/provider.dart';

import '../ModelClass/api_model.dart';

Widget ItemsPage(BuildContext context){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Consumer<MainProvider>(
    builder: (context,val,child) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15,),
            InkWell(
              onTap: (){
                val.changeLiving();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: width,
                height: 40,
                color: clgrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(
                    'Living Room',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.red),
                  ),
        
                  Icon(val.livingBool?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down)
                ],),
              ),
            ),
            val.livingBool?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
                      child: Text(
                        "Furniture",
                        style: GoogleFonts.poppins(
                          color: clBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    FurnitureItem(
                      icon: Icons.bed_outlined,
                      title: "L Type Sofa",
                      subtitle: "Small | Leather",
                      quantity: 1,
                    ),
                    FurnitureItem(
                      icon: Icons.chair_outlined,
                      title: "Single Seater Sofa",
                      subtitle: "Large | Leather",
                      quantity: 1,
                    ),
                    FurnitureItem(
                      icon: Icons.table_bar_outlined,
                      title: "Tea Table",
                      subtitle: "Medium | Wooden",
                      quantity: 1,
                    ),
                    FurnitureItem(
                      icon: Icons.tv_sharp,
                      title: "Entertainment Unit",
                      subtitle: "Medium | Wooden",
                      quantity: 1,
                    ),
                    FurnitureItem(
                      icon: Icons.chair_alt_outlined,
                      title: "Wooden Chairs",
                      subtitle: "Small",
                      quantity: 2,
                    ),
                    FurnitureItem(
                      icon: Icons.weekend_outlined,
                      title: "Swing",
                      subtitle: "Large | Wooden",
                      quantity: 1,
                    ),
                    FurnitureItem(
                      icon: Icons.chair_alt_sharp,
                      title: "Foldable Chairs",
                      subtitle: "Small | Steel",
                      quantity: 4,
                    ),
        
                  ],
                )
                :SizedBox(),
            const SizedBox(height: 15,),
        
        
            InkWell(
              onTap: (){
                val.changeBedRoom();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: width,
                height: 40,
                color: clgrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bed Room',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.red),
                    ),
        
                    Icon(!val.bedBool?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down)
                  ],),
              ),
            ),
            !val.bedBool?
            Column(
              children: [
                FurnitureItem(
                  icon: Icons.bed,
                  title: "King Size Bed",
                  subtitle: "Large | Wooden",
                  quantity: 1,
                ),
        
              ],
            )
                :SizedBox(),
            const SizedBox(height: 15,),
        
            InkWell(
              onTap: (){
                val.changeCustom();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: width,
                height: 40,
                color: clgrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Custom Items',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.red),
                    ),
        
                    Icon(!val.customBool?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down)
                  ],),
              ),
            ),
            !val.customBool?
            Column(
              children: [
                FurnitureItem(
                  icon: Icons.local_laundry_service,
                  title: "Washing Machine",
                  subtitle: "Large | Automatic",
                  quantity: 1,
                ),
        
              ],
            )
                :SizedBox(),
        
            Text3(
              title: "Antique Clock",
              description:
              "200 year old British Period wooden perpetual clock, very unique and rare.",
              dimensions: "L: 6 ft    W: 6 ft    H: 6 ft",
            ),
            const Divider(),
            Text3(
              title: "Antique Clock",
              description:
              "200 year old British Period wooden perpetual clock, very unique and rare.",
              dimensions: "L: 6 ft    W: 6 ft    H: 6 ft",
            ),
          ],
        ),
      );
    }
  );
}

Widget FloorInfo(BuildContext context,CustomerEstimateFlow estimate){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: width,
          height: 40,
          color: clgrey,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Existing house details',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        FloorInfoWidget(title: 'Floor No.', subtitle: estimate.oldFloorNo,),
        const SizedBox(height: 15,),
        FloorInfoWidget(title: 'Elevator available', subtitle: estimate.oldElevatorAvailability,),
        const SizedBox(height: 15,),
        FloorInfoWidget(title: 'Packing required', subtitle: 'yes',),
        const SizedBox(height: 15,),
        FloorInfoWidget(title: 'Distance from door to truck', subtitle: estimate.oldParkingDistance,),
        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Additional information",
            style: GoogleFonts.poppins(fontSize:15,color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,bottom: 10),
          child: Text(estimate.oldHouseAdditionalInfo,
            // "Dog is available so please call once you reach",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: width,
          height: 40,
          color: clgrey,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'New house details',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        FloorInfoWidget(title: 'Floor No.', subtitle: estimate.newFloorNo,),
        const SizedBox(height: 15,),
        FloorInfoWidget(title: 'Elevator available', subtitle: estimate.newElevatorAvailability,),
        const SizedBox(height: 15,),
        FloorInfoWidget(title: 'Packing required', subtitle: 'yes',),
        const SizedBox(height: 15,),
        FloorInfoWidget(title: 'Distance from door to truck', subtitle: estimate.newParkingDistance,),
        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Additional information",
            style: GoogleFonts.poppins(fontSize:15,color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,bottom: 10),
          child: Text(
            estimate.newHouseAdditionalInfo,
            // "Dog is available so please call once you reach",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
    
    
    
      ],
    ),
  );
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconWithText({required this.icon, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.red, size: 20),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

class FurnitureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final int quantity;

  FurnitureItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 32, color: Colors.black87),
      title: Text(
        title,
        style: GoogleFonts.poppins(color: Colors.grey),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(color: Colors.black87,fontWeight: FontWeight.w600),
      ),
      trailing: Text(
        '$quantity',
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}

class Text3 extends StatelessWidget {
  final String title;
  final String description;
  final String dimensions;

  Text3({
    required this.title,
    required this.description,
    required this.dimensions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            dimensions,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class FloorInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;


  FloorInfoWidget({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Text(
        title,
        style: GoogleFonts.poppins(fontSize:14,color: Colors.grey),
      ),
      trailing: Text(
        subtitle,
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
