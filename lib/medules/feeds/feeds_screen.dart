import 'package:firebase_app/layout/cubit/cubit.dart';
import 'package:firebase_app/layout/cubit/states.dart';
import 'package:firebase_app/models/post_model.dart';
import 'package:firebase_app/shared/styles/colors.dart';
import 'package:firebase_app/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        if(cubit.posts.isNotEmpty && cubit.userModel != null){
          return SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 20,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      FadeInImage(
                        placeholder: const AssetImage('assets/images/default_image.png'),
                        image: NetworkImage(
                            cubit.userModel!.cover
                        ),
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'communicate with friends',
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(itemBuilder: (context, index) =>
                  BuildPostCard(postModel: cubit.posts[index],index: index),
                  separatorBuilder: (context, index) => const SizedBox(height: 15,),
                  itemCount: cubit.posts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              ],
            ),
          );
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class BuildPostCard extends StatelessWidget {
  BuildPostCard({Key? key,required this.postModel,required this.index}) : super(key: key);
  final PostModel postModel;
  final int index;
  FocusNode textFieldFocus = FocusNode();

  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
               postModel.image != null ? CircleAvatar(
                  backgroundImage: NetworkImage(postModel.image!),
                  radius: 25,
                ) : Container(),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children:  [
                            Text(
                              postModel.name,
                              style: const TextStyle(height: 1),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: defaultColor,
                              size: 18,
                            )
                          ],
                        ),
                        Text(
                          postModel.dateTime,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(height: 1.5),
                        ),
                      ],
                    )),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                height: 2,
                color: Colors.grey[300],
              ),
            ),
            Text(postModel.text ?? '',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                height: 1.2,
              ),),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                children: [
                  SizedBox(
                    height: 25,
                    child: MaterialButton(
                      onPressed: (){},
                      height: 25,
                      minWidth: 1,
                      padding: EdgeInsets.zero,
                      child: const Text('#software',style: TextStyle(color: defaultColor),),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: MaterialButton(
                      onPressed: (){},
                      height: 25,
                      minWidth: 1,
                      padding: EdgeInsets.zero,
                      child: const Text('#software',style: TextStyle(color: defaultColor),),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: MaterialButton(
                      onPressed: (){},
                      height: 25,
                      minWidth: 1,
                      padding: EdgeInsets.zero,
                      child: const Text('#software',style: TextStyle(color: defaultColor),),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: MaterialButton(
                      onPressed: (){},
                      height: 25,
                      minWidth: 1,
                      padding: EdgeInsets.zero,
                      child: const Text('#software',style: TextStyle(color: defaultColor),),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: MaterialButton(
                      onPressed: (){},
                      height: 25,
                      minWidth: 1,
                      padding: EdgeInsets.zero,
                      child: const Text('#software_developer',style: TextStyle(color: defaultColor),),
                    ),
                  ),

                ],
              ),
            ),
            postModel.postImage == null ? Container() :
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 20),
              child: Container(
                height: 150.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(postModel.postImage!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        children: [
                          const Icon(IconBroken.Heart,color: Colors.red,),
                          const SizedBox(width: 5,),
                          Text(SocialCubit.get(context).likes[index].toString(),
                            style: Theme.of(context).textTheme.caption,)
                        ],
                      ),
                      onTap: (){},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(IconBroken.Chat,color: Colors.amber,),
                          const SizedBox(width: 5,),
                          Text(SocialCubit.get(context).comments[index].toString(),
                            style: Theme.of(context).textTheme.caption,)
                        ],
                      ),
                      onTap: (){},
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey[300],
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(SocialCubit.get(context).userModel!.image),
                        radius: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
             /*           Text(
                        'write a comment ....',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(height: 1.5),
                      ),*/
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: textFieldController,
                          //focusNode: textFieldFocus,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (value) {
                            (value.isNotEmpty && value.trim() != '')
                                ? SocialCubit.get(context).setWritingTo(true)
                                : SocialCubit.get(context).setWritingTo(false);
                          },
                          decoration: const InputDecoration(
                            hintText: 'write a comment ....',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                borderSide: BorderSide.none),
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            filled: true,
                            fillColor: Color(0xff676c74),
                          ),
                        ),
                      ),
                      SocialCubit.get(context).isWriting
                          ? Container(
                       // margin: const EdgeInsets.only(left: 10),
                        decoration: const BoxDecoration(
                            gradient:  LinearGradient(
                                colors: [Color(0xff00b6f3), Color(0xff0184dc)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(
                            Icons.send,
                            size: 12,
                          ),
                          onPressed: () => SocialCubit.get(context).addCommentPost(
                              SocialCubit.get(context).postsId[index],
                              textFieldController.text),
                        ),
                      )
                          : Container()
                    ],
                  ),
                ),
                InkWell(
                  child: Row(
                    children: [
                      const Icon(IconBroken.Heart,color: Colors.red,),
                      const SizedBox(width: 5,),
                      Text('Like',style: Theme.of(context).textTheme.caption,)
                    ],
                  ),
                  onTap: (){
                    SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );

  }

}

