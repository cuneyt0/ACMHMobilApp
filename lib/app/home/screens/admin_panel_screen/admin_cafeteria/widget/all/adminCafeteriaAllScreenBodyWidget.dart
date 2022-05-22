

import 'package:login_work/export_import.dart';

class AdminCafeteriaAllScreenBodyWidget extends StatelessWidget {
  const AdminCafeteriaAllScreenBodyWidget({
    Key? key,
    required this.viewModel,
    required this.widget,
  }) : super(key: key);

  final AdminCafeteriaGetAllViewModel? viewModel;
  final AdminCafeteriaAllScreen widget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel?.getAllResponse?.data?.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          onTap: (() => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => AdminCafeteriaDetailScreen(
                        model: widget.model,
                        responseData:
                            viewModel?.getAllResponse?.data?[index],
                      )),
                ),
              )),
          title: Text(viewModel?.getAllResponse?.data?[index].title ??
              mLoading),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Center(
                    child: Text(noticeDeleteText),
                  ),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(btnCancel),
                      ),
                      ElevatedButton(
                        onPressed: () => viewModel?.deleteCafeteria(
                            viewModel
                                    ?.getAllResponse?.data?[index].id ??
                                0),
                        child: const Text(noticeDeleteBtnText),
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
