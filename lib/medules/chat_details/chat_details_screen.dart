import 'package:firebase_app/layout/cubit/cubit.dart';
import 'package:firebase_app/layout/cubit/states.dart';
import 'package:firebase_app/models/message_model.dart';
import 'package:firebase_app/models/social_user_model.dart';
import 'package:firebase_app/shared/styles/colors.dart';
import 'package:firebase_app/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailsScreen  extends StatelessWidget {
  ChatDetailsScreen ({Key? key,required this.userModel}) : super(key: key);
  final SocialUserModel userModel;
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SocialCubit.get(context).getMessages(receiverId: userModel.uId);
        return BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return  Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        userModel.image,
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      userModel.name,
                    ),
                  ],
                ),
              ),
              body: SocialCubit.get(context).messages.isNotEmpty ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index)
                        {
                          var message = SocialCubit.get(context).messages[index];

                          if(SocialCubit.get(context).userModel!.uId == message.senderId) {
                            return buildMyMessage(message);
                          }else{
                            return buildMessage(message);
                          }
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15.0,
                        ),
                        itemCount: SocialCubit.get(context).messages.length,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              child: TextFormField(
                                controller: messageController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'type your message here ...',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50.0,
                            color: defaultColor,
                            child: MaterialButton(
                              onPressed: () {
                                SocialCubit.get(context).sendMessage(
                                  receiverId: userModel.uId,
                                  text: messageController.text,
                                );
                                messageController.text = '';
                              },
                              minWidth: 1.0,
                              child: const Icon(
                                IconBroken.Send,
                                size: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ) : const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      }
    );
  }
  Widget buildMessage(MessageModel model) => Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(
            10.0,
          ),
          topStart: Radius.circular(
            10.0,
          ),
          topEnd: Radius.circular(
            10.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Text(
        model.text,
      ),
    ),
  );

  Widget buildMyMessage(MessageModel model) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      decoration: BoxDecoration(
        color: defaultColor.withOpacity(
          .2,
        ),
        borderRadius: const BorderRadiusDirectional.only(
          bottomStart: Radius.circular(
            10.0,
          ),
          topStart: Radius.circular(
            10.0,
          ),
          topEnd: Radius.circular(
            10.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Text(
        model.text,
      ),
    ),
  );
}
