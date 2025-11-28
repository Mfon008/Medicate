// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:medicate_app/ui/widget/text.dart';
// import 'package:medicate_app/ui/widget/text_form_widget.dart';

// import '../../core/config/colors.dart';
// import '../../core/connect_end/view_model/pharm_auth_view_model.dart';

// class StateBottomSheet extends StatelessWidget {
//   final PharmViewModel model;
//   const StateBottomSheet({super.key, required this.model});

//   @override
//   Widget build(BuildContext context) {
//     print('pt${model.countryController}');
//     return FutureBuilder(
//       future: model.fetchStates(model.countryController.text),
//       builder: (context, snapshot) {
//         return _body(context);
//       },
//     );
//   }

//   Widget _body(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//       ),
//       child: DraggableScrollableSheet(
//         expand: false,
//         initialChildSize: 0.5, // 50% of screen height
//         minChildSize: 0.3, // Can be dragged to 30% of screen height
//         maxChildSize: 0.9, // Can be dragged to 90% of screen height
//         builder: (context, scrollController) {
//           return SingleChildScrollView(
//             controller: scrollController,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 22.0.h),
//                 Padding(
//                   padding: EdgeInsets.all(12.w),
//                   child: TextFormWidget(
//                     label: 'Search state',
//                     isFilled: true,
//                     borderTopLeft: 10.r,
//                     borderTopRight: 10.r,
//                     borderBottomLeft: 10.r,
//                     borderBottomRight: 10.r,
//                     fillColor: AppColors.grey,
//                     onChange: (p0) {
//                       model.queryState = p0;
//                       model.notifyListeners();
//                     },
//                     suffixIcon: Icons.search_sharp,
//                     controller: model.stateController,
//                   ),
//                 ),
//                 SizedBox(height: 16.h),
//                 model.queryState == ''
//                     ? model.isLoading
//                           ? SpinKitFadingFour(
//                               color: AppColors.primary1,
//                               size: 40.sp,
//                             )
//                           : Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 if (model.getStateResponseModel != null &&
//                                     model
//                                         .getStateResponseModel!
//                                         .data!
//                                         .states!
//                                         .isNotEmpty)
//                                   ...model.getStateResponseModel!.data!.states!
//                                       .map(
//                                         (e) => GestureDetector(
//                                           onTap: () {
//                                             model.stateController.text =
//                                                 e.name!;
//                                             Navigator.pop(context);
//                                             model.notifyListeners();
//                                           },
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               color: AppColors.white,
//                                             ),
//                                             padding: EdgeInsets.symmetric(
//                                               vertical: 4.6.w,
//                                               horizontal: 20.w,
//                                             ),
//                                             child: Container(
//                                               padding: EdgeInsets.all(6.w),
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 color: AppColors.transparent,
//                                               ),
//                                               child: TextView(
//                                                 text: '${e.name}',
//                                                 textOverflow:
//                                                     TextOverflow.ellipsis,
//                                                 textStyle: TextStyle(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: 'Arial',
//                                                   fontSize: 17.2.sp,

//                                                   color: AppColors.black,
//                                                 ),
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                               ],
//                             )
//                     : Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           if (model.getStateResponseModel != null &&
//                               model
//                                   .getStateResponseModel!
//                                   .data!
//                                   .states!
//                                   .isNotEmpty)
//                             ...model.getStateResponseModel!.data!.states!
//                                 .where(
//                                   (o) => o.name!.toLowerCase().contains(
//                                     model.queryState.toLowerCase(),
//                                   ),
//                                 )
//                                 .map(
//                                   (e) => GestureDetector(
//                                     onTap: () {
//                                       model.stateController.text = e.name!;
//                                       Navigator.pop(context);
//                                       model.notifyListeners();
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: AppColors.white,
//                                       ),
//                                       padding: EdgeInsets.symmetric(
//                                         vertical: 4.6.w,
//                                         horizontal: 20.w,
//                                       ),
//                                       child: Container(
//                                         padding: EdgeInsets.all(6.w),
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(
//                                             10,
//                                           ),
//                                           color: AppColors.transparent,
//                                         ),
//                                         child: TextView(
//                                           text: '${e.name}',
//                                           textOverflow: TextOverflow.ellipsis,
//                                           textStyle: TextStyle(
//                                             fontWeight: FontWeight.w400,
//                                             fontFamily: 'Arial',
//                                             fontSize: 17.2.sp,

//                                             color: AppColors.black,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                         ],
//                       ),
//                 SizedBox(height: 14.0.h),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
