using {com.dhl as dhl} from '../db/Schema';

//define service SalesOrders {
  //  entity HeaderSales as select from dhl.HeaderSales;
   // entity SalesItems as select from dhl.SalesItems;
    //entity UnitOfMesure as select from dhl.UnitOfMesure;
    //entity ItemSel as select from dhl.ItemSel;
//}



define service SalesOrders{

    entity Header as select from dhl.HeaderSales {
        ID as Order_Number @mandatory,
        email @mandatory,
        firstname,
        lastname,
        country as Country,
        createon,
        deliverydate,
        orderstatus,
        imagenurl as Imagen,
        item as toItem

    };

    entity Items as select from dhl.SalesItems {
        ID as Item_Number,
       // email,
       // posicion,
        name as Name,
        description,
        releasedate,
        discontinuedate,
        price,
        height,
        weidth,
        depth,
        quantity,
        unitofmesure as tounitofmesure @mandatory,
        Header as toheadersales @readonly
    };
    @readonly
    entity unitofmesure as select from dhl.UnitOfMesure{
        ID,
        name        
    };
}

 