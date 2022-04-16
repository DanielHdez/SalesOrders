namespace com.dhl;


using {
  cuid,
  managed,
  Country
} from '@SAP/cds/common';

type status : Integer enum {
  Submitted  = 1;
  Fullfiller = 2;
  Shipped    = 3;
  Cancel     = -1;
}

define entity HeaderSales : cuid {

  key email        : String(40) not null;
      firstname    : String(40);
      lastname     : String(40);
      country      : Country;
      //country      : String(30);
      createon     : DateTime default $now;
      deliverydate : DateTime;
      orderstatus  : status default 1;
      imagenurl    : String(100);
      item         : Composition of many SalesItems
                       on  item.Header  = $self

}

define entity SalesItems {
  key ID              : UUID;
  //key email           : String(40) not null;
  //key posicion        : Integer not null;
      name            : String(40);
      description     : String(40);
      releasedate     : DateTime default $now;
      discontinuedate : DateTime;
      price           : Decimal(12, 2);
      height          : Decimal(12, 2);
      weidth          : Decimal(15, 3);
      depth           : Decimal(12, 2);
      quantity        : Decimal(16, 2);
      unitofmesure    : String(2);
      tounitofmesure  : Association to UnitOfMesure
                          on tounitofmesure.ID = unitofmesure;
      Header          : Association to HeaderSales;
}

define entity UnitOfMesure {
  ID   : String(2);
  name : String;
}

/*define entity ItemSel as
  select from SalesItems {
    *,   (
      quantity * price
    ) as TotalPrice : Decimal(15, 2)
  };
  */
 
