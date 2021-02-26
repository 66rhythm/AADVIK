// import 'package:flutter/material.dart';

// class CattleScreen extends StatelessWidget {
//   static const roueName = '/cattle';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Cattle Information')),
//       body: Center(
//         child: Text('Cattles over here coming soon'),
//       ),
//     );
//   }
// }
import 'package:Project/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import '../providers/cattle.dart';
import '../widgets/cattle_item.dart';

class CattleOverviewScreen extends StatelessWidget {
  final List<Cattle> loadedProducts = [
    Cattle(
      id: 'c1',
      name: 'Jaisalmeri Camel',
      description:
          'The breeding tract of Jaisalmeri breed encompasses the Jaisalmer, Barmer and part of Jodhpur district in Rajasthan.',
      consumption: 5,
      milkProduced: 6,
      imageUrl: 'https://nrccamel.icar.gov.in/images/brcamel2.jpg',
    ),
    Cattle(
      id: 'c2',
      name: 'Mewari Camel',
      description:
          'The Mewari breed of camel has derived its name from the Mewar area of Rajasthan and is well known for milk productin potential.',
      consumption: 3,
      milkProduced: 7,
      imageUrl: 'https://nrccamel.icar.gov.in/images/brcamel3.jpg',
    ),
    Cattle(
      id: 'c3',
      name: 'Jalori Camel',
      description:
          'The Jalori camel derives its name from the place of rearing. The geographical distribution of the breed encompasses chiefly the Jalore and Sirohi districts of Rajasthan',
      consumption: 5,
      milkProduced: 6,
      imageUrl: 'https://nrccamel.icar.gov.in/downloads/JALORI.jpg',
    ),
    Cattle(
      id: 'c4',
      name: 'Kacchi Camel',
      description:
          'The Kachchhi breed inhabits the ran of Kachchh in Gujarat state. The major breeding tract encompasses the Kachchh and Bansakantha districts of Gujarat and it extends in east from 68°20’ to 74° longitude and in north from 22°51’ to 24°37’ latitude.',
      consumption: 5,
      milkProduced: 6,
      imageUrl: 'https://nrccamel.icar.gov.in/images/brcamel4.jpg',
    ),
  ];
  static const roueName = '/cattle';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cattle Information'),
      ),
      drawer: AppDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => CattleItem(
          loadedProducts[i].id,
          loadedProducts[i].name,
          loadedProducts[i].imageUrl,
          loadedProducts[i].consumption,
          loadedProducts[i].milkProduced,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
