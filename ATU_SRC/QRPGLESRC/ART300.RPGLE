**FREE
//%METADATA                                                                          *
// %TEXT Function Article                                                            *
//%EMETADATA                                                                         *
Ctl-Opt nomain;

Dcl-F ARTICLE1   Keyed usropn;

/COPY ../QPROTOSRC/ARTICLE.RPGLEINC

Dcl-Pr chainARTICLE1;
  articleID          Char(6)         value;
End-Pr;

Dcl-S K_ARID          LIKE(ARID);

//=============================================
Dcl-Proc GetArtDesc export;
  Dcl-Pi GetArtDesc like(ardesc);
    articleID          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleID
        );
  return ARDESC;
End-Proc GetArtDesc;
//=============================================
Dcl-Proc GetArtRefSalPrice export;
  Dcl-Pi GetArtRefSalPrice like(arsalepr);
    articleID          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleID
        );
  return ARSALEPR;
End-Proc;
//=============================================
Dcl-Proc GetArtStockPrice export;
  Dcl-Pi GetArtStockPrice like(arwhspr);
    articleID          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleID
        );
  return ARWHSPR;
End-Proc;
//=============================================
Dcl-Proc GetArtFam export;
  Dcl-Pi GetArtFam like(artifa);
    articleID          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleID
        );
  return ARTIFA;
End-Proc GetArtFam;
//=============================================
Dcl-Proc GetArtStock export;
  Dcl-Pi GetArtStock like(arstock);
    articleID          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleID
        );
  return ARSTOCK;
End-Proc GetArtStock;
//=============================================
Dcl-Proc GetArtMinStock export;
  Dcl-Pi GetArtMinStock like(arminqty);
    articleID          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleID
        );
  return ARMINQTY;
End-Proc GetArtMinStock;
//=============================================
Dcl-Proc GetArtVatCode export;
  Dcl-Pi GetArtVatCode like(arvatcd);
    articleID          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleID
        );
  return ARvatcd ;
End-Proc GetArtVatCode;
//=============================================
Dcl-Proc ExistArt export;
  Dcl-Pi ExistArt Ind;
    articleID          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleID
        );
  return %found(article1) and ardel <> 'X';
End-Proc ExistArt;

//=============================================
Dcl-Proc IsArtDeleted export;
  Dcl-Pi IsArtDeleted Ind;
    articleID          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleID
        );
  return ArDEL = 'X';
End-Proc IsArtDeleted;

Dcl-Proc chainARTICLE1;
  Dcl-Pi chainARTICLE1;
    articleID          Char(6)         value;
  End-Pi;
 if not %open(ARTICLE1);
   open ARTICLE1;
 endif;
  if articleID <> ARID;
    K_ARID =  articleID;
    clear *all FARTI;
    chain K_ARID ARTICLE1;
  endif;
End-Proc chainARTICLE1;

Dcl-Proc closeARTICLE1;
  Dcl-Pi closeARTICLE1 End-Pi;
 if %open(ARTICLE1);
   close ARTICLE1;
 endif;
End-Proc closeARTICLE1;