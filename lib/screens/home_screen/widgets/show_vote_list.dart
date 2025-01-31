import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/vote_model.dart';
import '../../../state/vote_state.dart';
import 'poll_card.dart';

class ShowVoteList extends StatelessWidget {
  const ShowVoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<VoteState>(
      builder: (context, provider, child) {
        return Visibility(
          visible: provider.pollListAvailable,
          replacement: const Center(child: CircularProgressIndicator(),),
          child: ListView.builder(
            itemCount: provider.voteList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 15.0),
                  child: Text(
                    'Ongoing Polls',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                );
              }
              VoteModel vote = provider.voteList[index - 1];
              return PollCard(
                provider: provider,
                vote: vote,
                index: index,
              );
            },
          ),
        );
      },
    );
  }
}
