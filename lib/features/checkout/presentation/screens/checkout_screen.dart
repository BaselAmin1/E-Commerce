import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_button.dart';
import 'package:e_commerce/features/checkout/business_logic/cubit/checkout_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/screens/address_screen.dart';
import 'package:e_commerce/features/checkout/presentation/screens/delivery_screen.dart';
import 'package:e_commerce/features/checkout/presentation/screens/payment_screen.dart';
import 'package:e_commerce/features/checkout/presentation/screens/summary_screen.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<Widget> screens = [
    const DeliveryScreen(),
    const AddressScreen(),
    const PaymentScreen(),
    const SummaryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        var cubit = CheckoutCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 70.h,
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Checkout',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                EasyStepper(
                  activeStep: cubit.checkoutIndex,
                  lineLength: 70.h,
                  stepShape: StepShape.rRectangle,
                  stepBorderRadius: 15.r,
                  borderThickness: 2,
                  padding: 20.h,
                  stepRadius: 28.r,
                  finishedStepBorderColor: primaryColor,
                  activeStepTextColor: primaryColor,
                  unreachedStepTextColor: Colors.grey,
                  finishedStepTextColor: primaryColor,
                  finishedStepBackgroundColor: primaryColor,
                  activeStepIconColor: primaryColor,
                  showLoadingAnimation: false,
                  enableStepTapping: true,
                  steps: const [
                    EasyStep(
                      icon: Icon(Icons.add_task_rounded),
                      title: 'delivery',
                    ),
                    EasyStep(
                      icon: Icon(Icons.category_rounded),
                      title: 'address',
                    ),
                    EasyStep(
                      icon: Icon(Icons.local_shipping_rounded),
                      title: 'payment',
                    ),
                    EasyStep(
                      icon: Icon(Icons.door_back_door_outlined),
                      title: 'Summary',
                    ),
                  ],
                  onStepReached: (index) => (() => cubit.checkoutIndex = index),
                ),
                Column(
                  children: [
                    SizedBox(
                        height: 550.h, child: screens[cubit.checkoutIndex]),
                    Row(
                      children: [
                        cubit.checkoutIndex == 0
                            ? const Spacer()
                            : Padding(
                                padding: EdgeInsets.all(12.0.h),
                                child: SizedBox(
                                  height: 60.h,
                                  width: 170.w,
                                  child: CustomButton(
                                    onPress: () {
                                        setState(() {
                                    cubit.checkoutIndex -= 1;
                                });
                                    },
                                    text: 'Back',
                                  ),
                                ),
                              ),
                        cubit.checkoutIndex != 0 ? const Spacer() : Container(),
                        Padding(
                          padding: EdgeInsets.all(12.0.h),
                          child: SizedBox(
                            height: 60.h,
                            width: 170.w,
                            child: CustomButton(
                              onPress: () {
                                setState(() {
                                    cubit.checkoutIndex += 1;
                                });
                              
                              },
                              text: 'Next',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
