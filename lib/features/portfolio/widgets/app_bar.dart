// import 'package:flutter/material.dart';
// import 'package:zoncan/localization/src/languages/strings.g.dart';

// class ZoncanAppBars {
//   final AppBar? appBar;
//   final SliverAppBar? sliverAppBar;

//   ZoncanAppBars.main()
//       : appBar = AppBar(
//           toolbarHeight: 80,
//           title: Row(
//             children: [
//               PopupMenuButton<Locale>(
//                 shape: const RoundedRectangleBorder(
//                   side: BorderSide(width: 1.0, style: BorderStyle.none),
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 icon: const Icon(Icons.arrow_drop_down),
//                 child: Text(val),
//                 onSelected: (Locale value) {
//                   print(value.countryCode.toString());
//                   LocaleSettings.setLocaleRaw(value.countryCode.toString());
//                 },
//                 itemBuilder: (BuildContext context) {
//                   return LocaleSettings.supportedLocales.map<PopupMenuItem<Locale>>((value) {
//                     print(value.countryCode);
//                     return PopupMenuItem(
//                         value: value,
//                         child: SizedBox(width: 100 / 5, child: Text(value.toString())));
//                   }).toList();
//                 },
//               ),
//               const Icon(Icons.more_vert),
//               Expanded(child: Container()),
//               IconButton(
//                   icon: const Icon(
//                     Icons.settings,
//                     color: Colors.deepPurpleAccent,
//                   ),
//                   onPressed: () {}),
//               Stack(
//                 children: [
//                   IconButton(
//                       icon: Icon(
//                         Icons.notifications,
//                         color: Colors.deepPurpleAccent.withOpacity(.7),
//                       ),
//                       onPressed: () {}),
//                   Positioned(
//                     top: 7,
//                     right: 7,
//                     child: Container(
//                       width: 12,
//                       height: 12,
//                       padding: const EdgeInsets.all(4),
//                       decoration: BoxDecoration(
//                           color: Colors.redAccent,
//                           borderRadius: BorderRadius.circular(30),
//                           border: Border.all(color: Colors.lightBlueAccent, width: 2)),
//                     ),
//                   )
//                 ],
//               ),
//               Container(
//                 width: 1,
//                 height: 22,
//                 color: Colors.blueGrey,
//               ),
//               const SizedBox(
//                 width: 24,
//               ),
//               const Text(
//                 "Hadi Rafiei",
//                 style: TextStyle(
//                   color: Colors.blueGrey,
//                 ),
//               ),
//               const SizedBox(
//                 width: 16,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.blueGrey.withOpacity(.5),
//                     borderRadius: BorderRadius.circular(30)),
//                 child: Container(
//                   decoration:
//                       BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
//                   padding: const EdgeInsets.all(2),
//                   margin: const EdgeInsets.all(2),
//                   child: const CircleAvatar(
//                     backgroundColor: Colors.blueGrey,
//                     child: Icon(
//                       Icons.person_outline,
//                       color: Colors.blueGrey,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           actions: [
//             IconButton(
//                 icon: Icon(
//                   Icons.notifications,
//                   color: Colors.deepPurpleAccent.withOpacity(.7),
//                 ),
//                 onPressed: () {}),
//             IconButton(
//                 icon: Icon(
//                   Icons.notifications,
//                   color: Colors.deepPurpleAccent.withOpacity(.7),
//                 ),
//                 onPressed: () {}),
//           ],
//           iconTheme: const IconThemeData(color: Colors.blueGrey),
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//         ),
//         sliverAppBar = null;
// }
