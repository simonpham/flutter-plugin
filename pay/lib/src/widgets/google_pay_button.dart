part of '../../pay.dart';

class GooglePayButton extends StatelessWidget {
  
    const GooglePayButton({
    Key? key,
    required this.client,
    required this.onPressed,
    this.onError,
    this.childOnError,
    this.childOnLoading,
    this.type,
    this.color,
  }) : super(key: key);

  GooglePayButton.fromAsset({
    Key? key,
    required String assetName,
    required this.onPressed,
    this.onError,
    this.childOnError,
    this.childOnLoading,
    this.type,
    this.color,
  })  : client = Pay.fromAsset(assetName),
        super(key: key);
  
  
  final Pay client;
  final Function(Object?)? onError;
  final Widget? childOnError;
  final Widget? childOnLoading;
  final PayGestureTapCallback onPressed;

  final GooglePayButtonType? type;
  final GooglePayButtonColor? color;

  @override
  Widget build(BuildContext context) {
    return PayButton(
      client: client,
      onPressed: onPressed,
      onError: onError,
      childOnError: childOnError,
      childOnLoading: childOnLoading,
      allowedProviders: [
        Provider.google_pay,
      ],
      style: PayButtonStyle(
        googlePayColor: color,
        googlePayType: type,
      ),
    );
  }
}
