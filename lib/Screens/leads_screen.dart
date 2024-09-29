import 'package:flutter/material.dart';
import 'package:leads/Controllers/main_provider.dart';
import 'package:provider/provider.dart';

import '../Constants/MyColors.dart';
import 'new_flat_screen.dart';
import 'item_details_screen.dart';
import 'refactor_screen.dart';

class LeadsPage extends StatefulWidget {
  const LeadsPage({super.key});

  @override
  State<LeadsPage> createState() => _LeadsPageState();
}

class _LeadsPageState extends State<LeadsPage> with TickerProviderStateMixin {
  late TabController tabController;
  late TabController tabController2;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    tabController2 = TabController(length: 3, vsync: this);
    tabController.addListener(_handleTabChange);
    tabController2.addListener(_handleTabChange);
    Future.microtask(() =>
        Provider.of<MainProvider>(context, listen: false).fetchPurchaseData());
  }


  @override
  void dispose() {
    tabController.dispose();
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
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.white, Colors.grey],
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                  "Leads",
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

          body:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    indicatorColor: clRed,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: clRed,
                    unselectedLabelColor: clBlack,
                    labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    labelPadding: EdgeInsets.only(right: 20),
                    indicatorPadding: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    tabs: const [
                      Tab(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("All"),
                        ),
                      ),
                      Tab(text: "New"),
                      Tab(text: "Follow Up"),
                      Tab(text: "Booked"),
                      Tab(text: "In Transit"),
                    ],
                  ),
                ),



                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Center(child: Text("All Leads")),
                      NewFlatPage(),
                      Center(child: Text("Follow Up Leads")),
                      Center(child: Text("Booked Leads")),
                      Center(child: Text("In Transit Leads")),
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
