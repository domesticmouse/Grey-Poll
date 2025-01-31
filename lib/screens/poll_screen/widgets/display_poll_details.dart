import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/vote_model.dart';
import '../../../state/vote_state.dart';
import '../../../utils/app_theme.dart';
import 'display_options.dart';
import 'poll_info.dart';

class DisplayPollDetails extends StatelessWidget {
  final AppTheme theme = AppTheme();
  DisplayPollDetails({
    Key? key,
    required this.activeVote,
    required this.pollOptions,
  }) : super(key: key);

  final VoteModel? activeVote;
  final List<String> pollOptions;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    VoteState provider = Provider.of<VoteState>(context, listen: false);
    return Column(
      children: [
        PollInfo(size: size, activeVote: activeVote),
        const SizedBox(
          height: 20,
        ),
        for (String option in pollOptions)
          DisplayOptions(provider: provider, option: option),
      ],
    );
  }
}
