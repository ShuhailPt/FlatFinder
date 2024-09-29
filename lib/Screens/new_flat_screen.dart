import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leads/Controllers/main_provider.dart';
import 'package:leads/Controllers/main_provider.dart';
import 'package:leads/Controllers/main_provider.dart';
import 'package:leads/Controllers/main_provider.dart';
import 'package:leads/Controllers/main_provider.dart';
import 'package:leads/Controllers/main_provider.dart';
import 'package:leads/Controllers/main_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../ModelClass/api_model.dart';
import 'item_details_screen.dart';
import 'new_leads_screen.dart';


class NewFlatPage extends StatelessWidget {
  const NewFlatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context,MainProvider, child) {
        if (MainProvider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (MainProvider.error != null) {
          return Center(child: Text(MainProvider.error!));
        }

        if (MainProvider.purchase == null) {
          return Center(child: Text('No data available'));
        }

        final purchase = MainProvider.purchase!;

        return ListView.builder(
          itemCount: purchase.customerEstimateFlow.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final estimate = purchase.customerEstimateFlow[index];
            return _buildEstimateCard(context, estimate);
          },
        );
      },
    );
  }

  Widget _buildEstimateCard(BuildContext context, CustomerEstimateFlow estimate) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 12, right: 5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('MMM').format(estimate.movingOn),
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('dd').format(estimate.movingOn),
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('HH:mm').format(estimate.movingOn),
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: width/3,
                        child: Text(
                          estimate.fromAddress.fromCity,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(width: width/4),
                      Text(
                        estimate.estimateId,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: width / 1.5,
                    child: Text(
                      estimate.fromAddress.fromAddress,
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_downward_outlined,
                        size: 34,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 10),
                      IconWithText(icon: Icons.home, text: estimate.propertySize),
                      const SizedBox(width: 10),
                      IconWithText(icon: Icons.badge, text: "${estimate.totalItems} items"),
                      const SizedBox(width: 10),
                      IconWithText(icon: Icons.archive, text: "${_countBoxes(estimate)} boxes"),
                      const SizedBox(width: 10),
                      IconWithText(icon: Icons.location_on, text: "${estimate.distance}"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: width/1.5,
                    child: Text(
                      estimate.toAddress.toCity,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: width / 1.5,
                    child: Text(
                      estimate.toAddress.toAddress,
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.red),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>NewLeadsPage(estimate: estimate,)));
                        },
                        child: const Text(
                          "View Details",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {
                        },
                        child: const Text(
                          "Submit Quote",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
        ],
      ),
    );
  }

  int _countBoxes(CustomerEstimateFlow estimate) {
    return estimate.items.inventory
        .expand((inventory) => inventory.category)
        .expand((category) => category.items)
        .where((item) => item.name.toLowerCase().contains('box'))
        .length;
  }
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