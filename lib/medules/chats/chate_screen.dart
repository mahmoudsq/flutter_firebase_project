import 'package:firebase_app/layout/cubit/cubit.dart';
import 'package:firebase_app/layout/cubit/states.dart';
import 'package:firebase_app/medules/chat_details/chat_details_screen.dart';
import 'package:firebase_app/models/social_user_model.dart';
import 'package:firebase_app/shared/components/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return ListView.separated(
            itemBuilder: (context, index) => buildChatItem(cubit.users[index],context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: cubit.users.length);
      },
    );
  }

  Widget buildChatItem(SocialUserModel model, context) => InkWell(
    onTap: (){
      navigateTo(context, ChatDetailsScreen(userModel: model,),);
    },
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(
              model.image,
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            model.name,
            style: const TextStyle(
              height: 1.4,
            ),
          ),
        ],
      ),
    ),
  );
}
