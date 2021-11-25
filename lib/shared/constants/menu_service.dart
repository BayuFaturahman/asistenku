// ignore_for_file: prefer_const_constructors
import 'package:asistenku/shared/constants/assets.dart';
import 'package:flutter/material.dart';


class MenuService {
  static List listMenuService = [
    {
      "title": "Pos Instan Plus",
      "icon": AppIcons.icPosInstanPlus,
      "isImplemented": true,
    },
    {
      "title": "Sameday",
      "icon": AppIcons.icPosSameDay,
      "isImplemented": true,
    },
    {
      "title": "Next Day",
      "icon": AppIcons.icPosNextDay,
      "isImplemented": true,
    },
    {
      "title": "Regular",
      "icon": AppIcons.icPosRegular,
      "isImplemented": true,
    },
    {
      "title": "Order Booking",
      "icon": AppIcons.icOrderBooking,
      "isImplemented": false,
    },
    {
      "title": "Cek Tarif",
      "icon": AppIcons.icCheckPrice,
      "isImplemented": false,
    },
    {
      "title": "Lacak Kiriman",
      "icon": AppIcons.icTrackingPacket,
      "isImplemented": false,
    }, // End Layanan Kurir Index 0 - 6
    {
      "title": "Beli & Bayar Tagihan",
      "icon": AppIcons.icPaymentPos,
      "isImplemented": true,
    },
    {
      "title": "Wesel Pos",
      "icon": AppIcons.icWeselPos,
      "isImplemented": false,
    }, // End Layanan Keuangan Index 7 - 8
    {
      "title": "Meterai",
      "icon": AppIcons.icMeterai,
      "isImplemented": true,
    },
    {
      "title": "Filateli",
      "icon": AppIcons.icFilateli,
      "isImplemented": true,
    }, // End Galeri Pos Index 9 - 10
    {
      "title": "Traveloka",
      "icon": AppIcons.icTraveloka,
      "isImplemented": false,
    },
    {
      "title": "Peduli Lindungi",
      "icon": AppIcons.icPeduliLindungi,
      "isImplemented": false,
    }, // End Lainnya Index 11 - 12
    {
      "title": "Lainnya",
      "icon": AppIcons.icOther,
      "isImplemented": true, // Other Service Index 13
    },
  ];

  // static List<Widget> listPageMenuService = [
  //   // PageComingSoon(text: "Pos Instan Plus"), // PagePosInstanPlus()
  //   PageCourierKirim(
  //     serviceId: "Q9C",
  //     layananPengiriman: 'Pos Instan Plus',
  //     courierType: 0,
  //   ),
  //   // PageComingSoon(text: "Page Pos Sameday"), // PagePosSameday()
  //   PageCourierKirim(
  //     serviceId: "2Q9",
  //     layananPengiriman: 'Pos Sameday',
  //     courierType: 1,
  //   ),
  //   PageCourierKirim(
  //     serviceId: "447",
  //     layananPengiriman: 'Pos Netx Day',
  //     courierType: 2,
  //   ), // PagePosNextDay()
  //   PageCourierKirim(
  //     serviceId: "240",
  //     layananPengiriman: 'Pos Regular',
  //     courierType: 3,
  //   ), // PagePosRegular()
  //   PageCourierLanding(), // PageOrderBooKing()
  //   Api1().isLogged
  //       ? PageCekTarifKirim(
  //           serviceId: "",
  //           layananPengiriman: '',
  //           courierType: 0,
  //         )
  //       : PageCekTarifKirim(
  //           serviceId: "",
  //           layananPengiriman: '',
  //           courierType: 0,
  //         ), // PageCheckPrice()
  //   // PageComingSoon(text: "Page Cek Tarif"), // PageCheckPrice()
  //   PageLacakKiriman(), // PageTrackingPacket() // End Layanan Kurir Index 0 - 6
  //   PageComingSoon(), // PageBuyAndBill()
  //   PageWessel(), // PageWesselPos() // End Layanan Keuangan Index 7 - 8
  //   PageComingSoon(), // PageMaterai()
  //   PageComingSoon(), // PageFilateli() // End Galeri Pos Index 9 - 10
  //   PageComingSoon(), // PageTraveloka()
  //   PageComingSoon(), // PagePeduliLindungi() // End Lainnya Index 11 - 12
  //   PageComingSoon(), // other service
  // ];
}
