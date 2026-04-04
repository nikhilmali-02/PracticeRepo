// class TaskScreen extends StatefulWidget {
//   @override
//   State<TaskScreen> createState() => _TaskScreenState();
// }
// class _TaskScreenState extends State<TaskScreen> {
//
//   late Future<List<String>> _taskFuture;  // what type?
//   @override
//   void initState() {
//     super.initState();
//     _taskFuture = _taskFetch();  // what goes here?
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<String>>(  // what type?
//         future:_taskFuture,  // what goes here?
//         builder: (context, snapshot) {
//           if (snapshot. connectionState== ConnectionState.waiting) {
//             return  CircularProgressIndicator();  // loading widget
//           }
//           if (snapshot.hasError) {
//             return Text('Error = ${snapshot.error}');  // error widget
//           }
//           return ListView.builder(itemCount:snapshot.data!.length,itemBuilder: ... ); // success widget
//         },
//       ),
//     );
//   }
// }