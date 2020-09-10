part of 'pages.dart';

// class CobaGrid extends StatelessWidget {
//   Stream<QuerySnapshot> getArticleData(BuildContext context) async* {
//     yield* FirebaseFirestore.instance.collection('Artikel').snapshots();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//   }

//    Widget listData(BuildContext context) {
//     return ListView(

//     );
//   }

//   Widget articleCard(BuildContext context, DocumentSnapshot document) {
//     final artikel = Artikel.fromSnapshot(document);

//     return GestureDetector(
//       onTap: () {},
//       child: Card(
//           child: Row(
//         children: <Widget>[
//           Container(
//             width: 165,
//             height: 130,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                     height: 100,
//                     width: 165,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: NetworkImage(artikel.img1),
//                             fit: BoxFit.cover))),
//               ],
//             ),
//           ),
//           // Flexible(
//           //     child: Text(
//           //   "",
//           //   overflow: TextOverflow.ellipsis,
//           //   softWrap: true,
//           //   maxLines: 2,
//           // )),
//         ],
//       )),
//     );
//   }
//   //
// }
