// Padding(
// padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
// child: Text(
// "Order Summary",
// style: mainText,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 30),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// "Subtotal",
// style: TextStyle(fontSize: 16, color: Colors.black),
// ),
// Text(
// commandEmpty == false
// ? "960 DZD".toUpperCase()
//     : "00 dzd".toUpperCase(),
// style: TextStyle(fontSize: 16, color: Colors.black),
// ),
// ],
// ),
// ),
// SizedBox(
// height: 10,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 30),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// "Shipping",
// style: TextStyle(fontSize: 16, color: Colors.black),
// ),
// Text(
// commandEmpty == false
// ? "10 DZD".toUpperCase()
//     : "00 dzd".toUpperCase(),
// style: TextStyle(fontSize: 16, color: Colors.black),
// ),
// ],
// ),
// ),
// const Divider(
// color: Colors.black,
// endIndent: 30,
// indent: 30,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 30),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// "Total",
// style: TextStyle(
// fontSize: 16,
// color: Colors.black,
// fontWeight: FontWeight.bold),
// ),
// Text(
// commandEmpty == false
// ? "970 DZD".toUpperCase()
//     : "00 dzd".toUpperCase(),
// style: TextStyle(
// fontSize: 16,
// color: Colors.black,
// fontWeight: FontWeight.bold),
// ),
// ],
// ),
// ),
// SizedBox(
// height: 30,
// )