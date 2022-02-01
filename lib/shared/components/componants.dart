
import 'package:firebase_app/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultTextButton({
required VoidCallback function,
required String text,
}) => TextButton(onPressed: function, child: Text(text.toUpperCase()));

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget defaultFormField(
    {required TextEditingController controller,
      required TextInputType type,
      ValueChanged<String>? onSubmit,
      ValueChanged<String>? onChange,
      GestureTapCallback? onTap,
      bool isPassword = false,
      required FormFieldValidator<String> validate,
      required String label,
      required IconData prefix,
      IconData? suffix,
      VoidCallback? suffixPress,
      bool isClickable = true}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPress,
          icon: Icon(suffix,),
        )
            : null,
        border: const OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
  context,MaterialPageRoute(builder: (context) => widget,)
);


void navigateAndFinish(context, widget,) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget,),
          (route) {
        return false;
      },
    );


void showToast({required BuildContext context,required GlobalKey<ScaffoldState> globalKey,
  required String text,required Color color}) {

  globalKey.currentState!.showSnackBar(
    SnackBar(
      content: Text(text,textAlign: TextAlign.center,),
      backgroundColor: color,
      //padding: const EdgeInsets.all(30)
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))),
      margin: const EdgeInsets.all(20),
    ),
  );
}

PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) => AppBar(
  leading: IconButton(
    onPressed: ()
    {
      Navigator.pop(context);
    },
    icon: const Icon(
      IconBroken.Arrow___Left_2,
    ),
  ),
  titleSpacing: 5.0,
  title: Text(
    title ?? '',
  ),
  actions: actions,
);
