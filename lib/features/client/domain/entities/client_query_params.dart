import 'package:appointments_manager/features/client/data/models/client.dart';
import 'package:appointments_manager/objectbox.g.dart';

class ClientQueryParamsDto {
  final bool descending;
  final String? filterByName;
  final bool orderByDate;
  final int limit;
  final int offset;

  ClientQueryParamsDto(
      {this.filterByName,
      this.descending = true,
      this.limit = 10,
      this.offset = 0,
      this.orderByDate = true});

  Query<ClientModel> toObjectBoxQuery(Store store){
    Condition<ClientModel>? listCondition;
    if(filterByName!=null){
      listCondition= ClientModel_.name.contains(filterByName!, caseSensitive: false); 
    }
    QueryBuilder<ClientModel> queryBuilder= store.box<ClientModel>().query(listCondition);
    if(orderByDate){
      queryBuilder= queryBuilder.order(ClientModel_.lastUpdate, flags: descending? Order.descending: Order.unsigned);
    }
    final query= queryBuilder.build();
    query.offset=offset;
    query.limit=limit;

    return query;
  }


}
