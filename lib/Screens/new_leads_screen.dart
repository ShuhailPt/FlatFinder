import 'package:flutter/material.dart';
import 'package:leads/Controllers/main_provider.dart';

import 'package:provider/provider.dart';

import '../Constants/MyColors.dart';
import '../ModelClass/api_model.dart';
import 'new_flat_screen.dart';
import 'item_details_screen.dart';
import 'refactor_screen.dart';

class NewLeadsPage extends StatefulWidget {
  CustomerEstimateFlow estimate;
   NewLeadsPage({super.key,required this.estimate});

  @override
  State<NewLeadsPage> createState() => _NewLeadsPageState();
}

class _NewLeadsPageState extends State<NewLeadsPage> with TickerProviderStateMixin {
  late TabController tabController2;

  @override
  void initState() {
    super.initState();
    tabController2 = TabController(length: 3, vsync: this);
    tabController2.addListener(_handleTabChange);
  }


  @override
  void dispose() {
    tabController2.dispose();
    super.dispose();
  }


  void _handleTabChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    MainProvider prov =Provider.of<MainProvider>(context,listen: false);
    return Consumer<MainProvider>(
        builder: (context,val,child) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_new_sharp)),
                    SizedBox(width: 5),
                    Text("New Leads",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                actions:  [
                  IconButton(
                    onPressed:(){},icon:Badge.count(
                    count: 99,
                    child: Icon(Icons.notifications_none, size: 24),

                  ) ,),
                  SizedBox(width: 8),
                  Icon(Icons.search_outlined, size: 24),
                  SizedBox(width: 10),
                ],
              ),

              body:
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    TabBar(
                      controller: tabController2,
                      isScrollable: false,
                      indicatorColor: clRed,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: clRed,
                      unselectedLabelColor: clBlack,
                      labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      tabs: const [
                        Tab(text: "Items"),
                        Tab(text: "Floor Info"),
                        Tab(text: "Send Quote"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController2,
                        children: [
                          ItemDetailsPage(estimate:widget.estimate,),
                          FloorInfo(context,widget.estimate),
                          Center(child: Text("Follow Up Leads")),

                        ],
                      ),
                    ),
                  ],
                ),
              )
          );
        }
    );
  }
}
