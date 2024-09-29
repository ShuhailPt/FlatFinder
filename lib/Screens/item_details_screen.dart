import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leads/Screens/refactor_screen.dart';
import 'package:provider/provider.dart';

import '../Constants/MyColors.dart';
import '../Controllers/main_provider.dart';
import '../ModelClass/api_model.dart';

class ItemDetailsPage extends StatelessWidget {
  CustomerEstimateFlow estimate;
   ItemDetailsPage({super.key,required this.estimate});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer<MainProvider>(
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

                  ...estimate.items.inventory.map((inventory) =>
                      ExpansionTile(
                        title: Text(inventory.displayName),
                        children: inventory.category.map((category) =>
                            ListTile(
                              title: Text(category.displayName),
                              subtitle: Text('${category.items.length} items'),
                              onTap: () {
                              },
                            )
                        ).toList(),
                      )
                  ).toList(),
                ],
              ),
            );
          }
      ),
    );
  }
}

