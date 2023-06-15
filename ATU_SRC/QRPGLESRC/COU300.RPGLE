**FREE
//%METADATA                                                                          *
// %TEXT Functions Country                                                           *
//%EMETADATA                                                                         *
Ctl-Opt nomain;

Dcl-F COUNTRY    Keyed usropn;

/COPY ../QPROTOSRC/COUNTRY.RPGLEINC

Dcl-Pr chainCOUNTRY;
  P_COID          Char(2)         value;
End-Pr;

Dcl-S K_COID          LIKE(COID);

//=============================================
Dcl-Proc GetCountryName export;
  Dcl-Pi GetCountryName like(countr);
    P_COID          Char(2)         value;
  End-Pi;
  chainCOUNTRY(P_COID
        );
  return COUNTR;
End-Proc GetCountryName;
//=============================================
Dcl-Proc GetCountryIso3 export;
  Dcl-Pi GetCountryIso3 like(coiso);
    P_COID          Char(2)         value;
  End-Pi;
  chainCOUNTRY(P_COID
        );
  return COISO;
End-Proc GetCountryIso3;

//=============================================
Dcl-Proc ExistCountry export;
  Dcl-Pi ExistCountry Ind;
    P_COID          Char(2)         value;
  End-Pi;
  chainCOUNTRY(P_COID
        );
  return %found(country);
End-Proc ExistCountry;

Dcl-Proc chainCOUNTRY;
  Dcl-Pi chainCOUNTRY;
    P_COID          Char(2)         value;
  End-Pi;
 if not %open(COUNTRY);
   open COUNTRY;
 endif;
  if P_COID <> COID;
    K_COID =  P_COID;
    clear *all FCOUN;
    chain K_COID COUNTRY;
  endif;
End-Proc chainCOUNTRY;

Dcl-Proc closeCOUNTRY;
  Dcl-Pi closeCOUNTRY End-Pi;
 if %open(COUNTRY);
   close COUNTRY;
 endif;
End-Proc closeCOUNTRY;