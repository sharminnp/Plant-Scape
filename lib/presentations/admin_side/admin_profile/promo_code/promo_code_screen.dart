import 'package:flutter/material.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/promo_code_model.dart';
import 'package:plant_app/presentations/admin_side/admin_profile/promo_code/add_promo_code.dart';

class PromoCodeScreen extends StatelessWidget {
  const PromoCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: StreamBuilder(
          stream: getPromoCode(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              final promoList = snapshot.data!;
              return promoList.isEmpty
                  ? const Center(
                      child: Text("No Promo code added"),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return kHeight10;
                      },
                      itemBuilder: (context, index) {
                        final promoCode = promoList[index];
                        return ListTile(
                          iconColor: Colors.black,
                          textColor: Colors.green[800],
                          leading: Icon(Icons.offline_pin_rounded),
                          title: Text(promoCode.discountName),
                          subtitle: Text(promoCode.discountPrice.toString()),
                          trailing: IconButton(
                              onPressed: () async {
                                await deletePromoCode(
                                    discountName: promoCode.discountName);
                              },
                              icon: Icon(Icons.delete)),
                        );
                      },
                      itemCount: promoList.length,
                    );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddPromoCode(),
            ),
          );
        },
      ),
    );
  }
}
