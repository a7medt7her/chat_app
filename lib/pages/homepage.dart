import 'package:chat_app/cubit/message_cubit.dart';
import 'package:chat_app/widgets/chatBuble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  static const String routeName = 'homepage';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void initState() {
    super.initState();
    context.read<MessageCubit>().getMessages();
  }

  final _controller = ScrollController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessageCubit, MessageState>(
      listener: (context, state) {
        if (state is MessageError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is MessageSuccess) {
          _controller.animateTo(
            _controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 22, 94, 170),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/scholar.png', height: 40),
              Text(
                'Chat App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<MessageCubit, MessageState>(
                builder: (context, state) {
                  if (state is MessageSuccess) {
                    final messages = state.messages;
                    return ListView.builder(
                      controller: _controller,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return Chatbuble(text: message.text);
                      },
                    );
                  } else if (state is MessageLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(child: Text('No messages yet'));
                  }
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: messageController,

                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 12, 104, 202),
                    ),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 12, 0, 0),
                    ),
                  ),
                  hintText: 'Type your message',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  suffixIcon: BlocBuilder<MessageCubit, MessageState>(
                    builder: (context, state) {
                      final isLoading = state is MessageLoading;
                      return IconButton(
                        icon: isLoading
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(
                                Icons.send,
                                color: Color.fromARGB(255, 22, 94, 170),
                              ),
                        onPressed: isLoading
                            ? null
                            : () {
                                final text = messageController.text.trim();
                                if (text.isEmpty) return;

                                context.read<MessageCubit>().sendMessage(text);

                                messageController.clear();
                              },
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
