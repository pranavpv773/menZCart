import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/user/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreenProvider with ChangeNotifier {
  late Razorpay razorpay;

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout(int amount, BuildContext context) async {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': amount,
      'name': 'MenzClub',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': context.read<User>().userName,
        'email': context.read<User>().userMail
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint(
        Razorpay.UNKNOWN_ERROR.toString(),
      );
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: "SUCCESS: ${response.paymentId!}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: " ${response.message!}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "EXTERNAL_WALLET: ${response.walletName!}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
