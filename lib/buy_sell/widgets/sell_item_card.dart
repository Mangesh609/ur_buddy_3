import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_buddy_3/models/classified.dart';

class SaleItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imageUrl;
  final String id;

  const SaleItemCard({
    this.imageUrl,
    this.title,
    this.subtitle,
    this.price,
    this.id,
  });

  _deleteClassified(BuildContext context, String classifiedId) async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          'Are you sure ?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              'YES',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'NO',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
    print(result);
    if (result) {
      await Provider.of<ClassifiedsProvider>(
        context,
        listen: false,
      ).deleteClassifiedFromId(classifiedId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color.fromRGBO(240, 236, 236, 1),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.all(8),
                  color: Colors.red,
                  child: imageUrl == null
                      ? Image.asset("images/placeholder.png", fit: BoxFit.cover)
                      : FadeInImage.assetNetwork(
                          placeholder: "images/placeholder.png",
                          image: imageUrl,
                          fit: BoxFit.cover,
                        ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 0,
                        ),
                        title: Text(
                          title,
                          style: _theme.textTheme.headline6.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          subtitle,
                          style: TextStyle(fontSize: 15),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: Text(
                        'Rs $price',
                        style: _theme.textTheme.headline6.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => _deleteClassified(context, id),
                  child: Text(
                    'Remove',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(44, 44, 49, 1),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 12),
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
