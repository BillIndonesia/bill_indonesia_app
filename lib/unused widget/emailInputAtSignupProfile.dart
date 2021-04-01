// Container(
//     margin: EdgeInsets.fromLTRB(
//         MediaQuery.of(context).size.width * 0.045,
//         MediaQuery.of(context).size.width * 0.05,
//         MediaQuery.of(context).size.width * 0.045,
//         0),
//     child: Text('Email',
//         style: TextStyle(
//             fontFamily: 'Montserrat',
//             fontSize: 14,
//             fontWeight: FontWeight.normal,
//             color: Color(0xFF999494)))),
// Container(
//     margin: EdgeInsets.fromLTRB(
//         MediaQuery.of(context).size.width * 0.045,
//         MediaQuery.of(context).size.width * 0.00,
//         MediaQuery.of(context).size.width * 0.045,
//         MediaQuery.of(context).size.width * 0.00),
//     child: TextFormField(
//       validator: (value) {
//         if (value == '') {
//           return 'Email tidak boleh kosong';
//         }
//         return null;
//       },
//       keyboardType: TextInputType.emailAddress,
//       controller: emailController,
//       style: TextStyle(
//           fontFamily: 'Montserrat',
//           fontSize: 16,
//           fontWeight: FontWeight.normal,
//           color: Color(0xFF6C6565)),
//       textAlign: TextAlign.left,
//       decoration: new InputDecoration(
//           focusedBorder: new UnderlineInputBorder(
//               borderSide: new BorderSide(
//                   color: Colors.black87, width: 1.0))),
//     )),
