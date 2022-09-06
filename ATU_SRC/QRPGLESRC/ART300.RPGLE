      *%METADATA                                                                          *
      * %TEXT Function Article                                                            *
      *%EMETADATA                                                                         *
     h nomain

     FARTICLE1  if   e           k disk    usropn

      /COPY ../QPROTOSRC/ARTICLE.RPGLEINC

     d chainARTICLE1   pr
     D article                         6A    value

     D artId          S                     LIKE(ARID)

     C     kf            klist
     C                   KFLD                    artId

      *=============================================
     PGetArtDesc       B                     export
     DGetArtDesc       PI                   like(ardesc)
     D article                         6A    value
      /free
         chainARTICLE1(article
               );
         return ARDESC;
      /end-free
     pGetArtDesc       e
      *=============================================
     PGetArtRefSalPrice...
     P                 B                     export
     DGetArtRefSalPrice...
     D                 PI                   like(arsalepr)
     D article                         6A    value
      /free
         chainARTICLE1(article
               );
         return ARSALEPR;
      /end-free
     p                 e
      *=============================================
     PGetArtStockPrice...
     P                 B                     export
     DGetArtStockPrice...
     D                 PI                   like(arwhspr)
     D article                         6A    value
      /free
         chainARTICLE1(article
               );
         return ARWHSPR;
      /end-free
     p                 e
      *=============================================
     PGetArtFam        B                     export
     DGetArtFam        PI                   like(artifa)
     D article                         6A    value
      /free
         chainARTICLE1(article
               );
         return ARTIFA;
      /end-free
     pGetArtFam        e
      *=============================================
     PGetArtStock      B                     export
     DGetArtStock      PI                   like(arstock)
     D article                         6A    value
      /free
         chainARTICLE1(article
               );
         return ARSTOCK;
      /end-free
     pGetArtStock      e
      *=============================================
     PGetArtMinStock   B                     export
     DGetArtMinStock   PI                   like(arminqty)
     D article                         6A    value
      /free
         chainARTICLE1(article
               );
         return ARMINQTY;
      /end-free
     pGetArtMinStock   e
      *=============================================
     PGetArtVatCode    B                     export
     DGetArtVatCode    PI                   like(arvatcd)
     D article                         6A    value
      /free
         chainARTICLE1(article
               );
         return ARvatcd ;
      /end-free
     pGetArtVatCode    e
      *=============================================
     P ExistArt        B                     export
     D ExistArt        PI              n
     D article                         6A    value
      /free
         chainARTICLE1(article
               );
         return %found(article1) and ardel <> 'X';
      /end-free
     p ExistArt        e

      *=============================================
     PIsArtDeleted     B                     export
     DIsArtDeleted     PI              n
     D article                         6A    value
      /free
         chainARTICLE1(article
               );
         return ArDEL = 'X';
      /end-free
     pIsArtDeleted     e

     p chainARTICLE1   b
     d chainARTICLE1   pi
     D article        6A    value
      /free
        if not %open(ARTICLE1);
          open ARTICLE1;
        endif;
         if article <> ARID;
           artId =  article;
           clear *all FARTI;
           chain kf ARTICLE1;
         endif;
      /end-free
     p chainARTICLE1   e

     p closeARTICLE1   b
     d closeARTICLE1   pi
      /free
        if %open(ARTICLE1);
          close ARTICLE1;
        endif;
      /end-free
     p closeARTICLE1   e


