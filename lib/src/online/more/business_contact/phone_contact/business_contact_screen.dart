// ignore_for_file: deprecated_member_use

import 'dart:developer';
import '../../../../../imports.dart';

class BusinessContactsScreen extends StatelessWidget {
  const BusinessContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: pPagePadding_10,
        child: Container(
          margin: pPagePadding_10,
          child: SafeArea(
            child: Consumer<BusinessContactProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomHeader(
                          title: AppLocalizations.of(context)!.businessContacts,
                        ),
                        Checkbox(
                          value: provider.showCheckboxes,
                          onChanged: (value) {
                            provider.setShowCheckboxes(value ?? false);
                            if (!(value ?? false)) {
                              provider.clearSelectedContacts();
                            }
                          },
                        )
                      ],
                    ),
                    sizedBoxHeight10,
                    Row(
                      children: [
                        sizedBoxWidth10,
                        Expanded(
                          child: TextField(
                            controller: provider.contactController,
                            onChanged: (query) {
                              provider.searchContacts(query);
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  provider.contactController.clear();
                                  provider.clearSearch();
                                },
                                icon: const Icon(Icons.search),
                              ),
                              hintText:
                                  AppLocalizations.of(context)!.searchContact,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(rRadius_10),
                              ),
                            ),
                          ),
                        ),
                        sizedBoxWidth10,
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddContactScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 50.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: cMainGreen,
                              borderRadius: BorderRadius.circular(rRadius_10),
                            ),
                            child: Icon(
                              Icons.person_add,
                              color: cWhiteColor,
                            ),
                          ),
                        ),
                        sizedBoxWidth5,
                      ],
                    ),
                    sizedBoxHeight15,
                    Expanded(
                      child: provider.isLoading
                          ? Image.asset(
                              imgContactLoading,
                              scale: 1,
                            )
                          : provider.searchedContacts.isEmpty
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        imgNoContact,
                                        scale: 1,
                                      ),
                                      Text(
                                          AppLocalizations.of(context)!
                                              .noContactsFound,
                                          textAlign: TextAlign.center,
                                          style: tsRegularText),
                                    ],
                                  ),
                                )
                              // : sizedBoxHeight0,
                              : ListView.builder(
                                  itemCount: provider.searchedContacts.length,
                                  itemBuilder: (context, index) {
                                    Contact contact =
                                        provider.searchedContacts[index];
                                    bool isSelected = provider.selectedContacts
                                        .contains(contact);
                                    return ListTile(
                                      leading: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (provider.showCheckboxes)
                                            Checkbox(
                                              value: isSelected,
                                              onChanged: (value) {
                                                provider.toggleSelectedContact(
                                                    contact);
                                              },
                                            ),
                                          CircleAvatar(
                                            backgroundColor: cGreyColor,
                                            backgroundImage:
                                                contact.thumbnail != null
                                                    ? MemoryImage(
                                                        contact.thumbnail!)
                                                    : null,
                                            radius: 20,
                                            child: contact.thumbnail == null
                                                ? Text(
                                                    contact.displayName
                                                            .isNotEmpty
                                                        ? contact.displayName
                                                            .substring(0, 1)
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                        ],
                                      ),
                                      title: Text(
                                        contact.displayName,
                                        style: tsRegularTextBold,
                                      ),
                                      subtitle: contact.phones.isNotEmpty
                                          ? Text(
                                              contact.phones.first.number,
                                            )
                                          : Text(
                                              AppLocalizations.of(context)!
                                                  .noPhoneNumber,
                                            ),
                                      trailing: isSelected
                                          ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                backgroundColor: cMainGreen,
                                                foregroundColor: cWhiteColor,
                                              ),
                                              onPressed: () {
                                                sendMessageToWhatsApp(
                                                  contact.phones.first.number,
                                                  'Hello, check out the Towner app: https://play.google.com/store/search?q=towner&c=apps',
                                                );
                                              },
                                              child: const Text('Send'),
                                            )
                                          : const SizedBox(),
                                      onTap: () {
                                        provider.toggleSelectedContact(contact);
                                      },
                                    );
                                  },
                                ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onTap: () {
                              provider.fetchContacts();
                            },
                            title: AppLocalizations.of(context)!.syncContacts,
                          ),
                        ),
                        sizedBoxWidth10,
                        Container(
                          decoration: BoxDecoration(
                            color: cDarkBlack,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: IconButton(
                            onPressed: () {
                              provider.sendContactsToBackend(context);
                            },
                            icon: Icon(
                              Icons.save,
                              color: cWhiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxHeight40,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void sendMessageToWhatsApp(String phoneNumber, String message) async {
    final whatsappUrl =
        "whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      log("Unable to launch WhatsApp");
    }
  }
}
