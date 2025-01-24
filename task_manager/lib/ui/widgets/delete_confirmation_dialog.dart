import 'package:flutter/material.dart';

class ConfirmationDialog {
  static Future<bool> showDeleteConfirmationDialog(BuildContext context) async {
    bool isConfirmed = false;

    // Show the dialog and wait for the user's response
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Cancel action
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Confirm deletion
                isConfirmed = true;
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    // Return the result
    return isConfirmed;
  }
}