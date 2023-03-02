**FREE
//%METADATA                                                                          *
// %TEXT Function Article                                                            *
//%EMETADATA                                                                         *
Ctl-Opt nomain;

Dcl-F ARTICLE1   Keyed usropn;

/COPY ../QPROTOSRC/ARTICLE.RPGLEINC

Dcl-Pr chainARTICLE1;
  articleid          Char(6)         value;
End-Pr;

Dcl-S K_ARID          LIKE(ARID);

//=============================================
Dcl-Proc GetArtDesc export;
  Dcl-Pi GetArtDesc like(ardesc);
    articleid          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleid
        );
  return ARDESC;
End-Proc GetArtDesc;
//=============================================
Dcl-Proc GetArtRefSalPrice export;
  Dcl-Pi GetArtRefSalPrice like(arsalepr);
    articleid          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleid
        );
  return ARSALEPR;
End-Proc;
//=============================================
Dcl-Proc GetArtStockPrice export;
  Dcl-Pi GetArtStockPrice like(arwhspr);
    articleid          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleid
        );
  return ARWHSPR;
End-Proc;
//=============================================
Dcl-Proc GetArtFam export;
  Dcl-Pi GetArtFam like(artifa);
    articleid          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleid
        );
  return ARTIFA;
End-Proc GetArtFam;
//=============================================
Dcl-Proc GetArtStock export;
  Dcl-Pi GetArtStock like(arstock);
    articleid          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleid
        );
  return ARSTOCK;
End-Proc GetArtStock;
//=============================================
Dcl-Proc GetArtMinStock export;
  Dcl-Pi GetArtMinStock like(arminqty);
    articleid          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleid
        );
  return ARMINQTY;
End-Proc GetArtMinStock;
//=============================================
Dcl-Proc GetArtVatCode export;
  Dcl-Pi GetArtVatCode like(arvatcd);
    articleid          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleid
        );
  return ARvatcd ;
End-Proc GetArtVatCode;
//=============================================
Dcl-Proc ExistArt export;
  Dcl-Pi ExistArt Ind;
    articleid          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleid
        );
  return %found(article1) and ardel <> 'X';
End-Proc ExistArt;

//=============================================
Dcl-Proc IsArtDeleted export;
  Dcl-Pi IsArtDeleted Ind;
    articleid          Char(6)         value;
  End-Pi;
  chainARTICLE1(articleid
        );
  return ArDEL = 'X';
End-Proc IsArtDeleted;

Dcl-Proc chainARTICLE1;
  Dcl-Pi chainARTICLE1;
    articleid          Char(6)         value;
  End-Pi;
 if not %open(ARTICLE1);
   open ARTICLE1;
 endif;
  if articleid <> ARID;
    K_ARID =  articleid;
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