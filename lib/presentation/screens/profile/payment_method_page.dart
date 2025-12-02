import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Payment History',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20 * ratio),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/payment_img.png', height: 200 * ratio),
              SizedBox(height: 20 * ratio),
              Container(
                height: 66 * ratio,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10 * ratio)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Color(0xff000000).withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 12.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/money_send_blue.svg',
                        height: 42 * ratio,
                      ),
                      SizedBox(width: 12 * ratio),
                      Text(
                        "Cash\n22.01.2024",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$ 500\n  \$ 12",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15 * ratio),
              Container(
                height: 66 * ratio,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10 * ratio)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Color(0xff000000).withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 12.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/money_send_blue.svg',
                        height: 42 * ratio,
                      ),
                      SizedBox(width: 12 * ratio),
                      Text(
                        "Transfer to bank\n15.02.2024",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "  \$ 500\n  \$ 100",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15 * ratio),
              Container(
                height: 185 * ratio,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10 * ratio)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Color(0xff000000).withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/money_send_red.svg',
                            height: 42 * ratio,
                          ),
                          SizedBox(width: 12 * ratio),
                          Text(
                            "Elite\n15.02.2024",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Text(
                            " -\$ 200\n  \$ 400",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15 * ratio),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/name_cargo.svg',
                            height: 18 * ratio,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Названия груза:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Колонка',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15 * ratio),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/invoice_no.svg',
                            height: 18 * ratio,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Инвойса №:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'DFG345',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15 * ratio),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/receipt.svg',
                            height: 18 * ratio,
                          ),
                          SizedBox(width: 8 * ratio),
                          Text(
                            "Квитанция:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '№: 2',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15 * ratio),
              Container(
                height: 66 * ratio,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10 * ratio)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Color(0xff000000).withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 12.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/money_send_blue.svg',
                        height: 42 * ratio,
                      ),
                      SizedBox(width: 12 * ratio),
                      Text(
                        "Deposit to bank\n05.05.2024",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "  \$ 600\n      \$ 0",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15 * ratio),
              Container(
                height: 66 * ratio,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10 * ratio)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Color(0xff000000).withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 12.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/money_send_red.svg',
                        height: 42 * ratio,
                      ),
                      SizedBox(width: 12 * ratio),
                      Text(
                        "By sea\n13.03.2024",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "  -\$ 300\n      \$ 12",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
