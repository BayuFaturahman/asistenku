// import 'package:get/get.dart';
// import 'package:possuperapp/src/biller/page_bpjs.dart';
// import 'package:possuperapp/src/biller/page_ecommerce.dart';
// import 'package:possuperapp/src/biller/page_ewallet.dart';
// import 'package:possuperapp/src/biller/page_mpn_g3.dart';
// import 'package:possuperapp/src/biller/page_pajak.dart';
// import 'package:possuperapp/src/biller/page_pdam.dart';
// import 'package:possuperapp/src/biller/page_telco.dart';
// import 'package:possuperapp/src/biller/page_tiket.dart';
// import 'package:possuperapp/src/biller/page_tv_kabel.dart';
// import 'package:possuperapp/src/biller/page_va.dart';
// import 'package:possuperapp/src/biller/pln/page_pln_tagihan.dart';
// import 'package:possuperapp/src/biller/pln/page_pln_token.dart';
// import 'package:possuperapp/src/biller/pulsadata/page_pulsa_data.dart';
// import 'package:possuperapp/src/transfer/page_transfer.dart';
//
// class NavigationFavorite {
//   static goToPage(String category, String productCode, String accountNo,
//       String productId, String productName) {
//     if (category.toLowerCase().contains("transfer")) {
//       return Get.to(() => PageTransfer(
//             destAccountNo: accountNo,
//             destBankCode: productCode,
//           ));
//     } else if (category.toLowerCase().contains("transfer bank")) {
//       return Get.to(() => PageTransfer(
//             destAccountNo: accountNo,
//             destBankCode: productCode,
//           ));
//     } else if (category.toLowerCase().contains("perusahaan air minum")) {
//       return Get.to(() => PagePdam(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category.toLowerCase().contains("bpjs")) {
//       return Get.to(() => PageBpjs(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category
//             .toLowerCase()
//             .contains("pembayaran pajak & penerimaan negara") &&
//         productName.toLowerCase().contains('mpn')) {
//       return Get.to(() => PageMpnG3(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category
//         .toLowerCase()
//         .contains("pembayaran pajak & penerimaan negara")) {
//       return Get.to(() => PagePajak(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category.toLowerCase().contains("pln paska bayar") &&
//         productName.toLowerCase().contains('token')) {
//       return Get.to(() => PagePlnToken(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category.toLowerCase().contains("pln paska bayar") &&
//         productName.toLowerCase().contains('tagihan')) {
//       return Get.to(() => PagePlnTagihan(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category.toLowerCase().contains("pembayaran tv kabel")) {
//       return Get.to(() => PageTvKabel(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category.toLowerCase().contains("pembayaran transportasi")) {
//       return Get.to(() => PageTiket(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category.toLowerCase().contains("bayar belanja online")) {
//       return Get.to(() => PageEcommerce(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category.toLowerCase().contains("pembayaran jasa telkom")) {
//       return Get.to(() => PageTelco(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category
//         .toLowerCase()
//         .contains("pembayaran virtual account giropos")) {
//       return Get.to(() => PageVa(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category
//         .toLowerCase()
//         .contains("pembayaran top up atau deposit")) {
//       return Get.to(() => PageEwallet(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category.toLowerCase().contains("pembayaran gas")) {
//       // return Navigation.pushWithSlideTransition(() => GasPage(
//       //       customerNo: accountNo,
//       //       productCode: productCode,
//       //     ));
//     } else if (category.toLowerCase().contains("pulsa & paket data")) {
//       return Get.to(() => PagePulsaData(
//             productCode: productCode,
//             customerNo: accountNo,
//           ));
//     } else if (category
//             .toLowerCase()
//             .contains("pembayaran zakat, infak, sedekah") &&
//         productCode == '1619') {
//       // return Get.to(() => PageZakatInfaqBaznas());
//     } else if (category
//             .toLowerCase()
//             .contains("pembayaran zakat, infak, sedekah") &&
//         productCode == '1620') {
//       // return Navigation.pushWithSlideTransition(() => PageFormRumahZakat(
//       //       customerNo: accountNo,
//       //     ));
//     } else {
//       return;
//     }
//   }
// }
