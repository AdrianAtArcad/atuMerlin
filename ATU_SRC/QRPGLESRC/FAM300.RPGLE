**FREE
//%METADATA                                                                          *
// %TEXT Functions article familly                                                   *
//%EMETADATA                                                                         *
Ctl-Opt nomain;

Dcl-F FAMILLY    Keyed usropn;

/COPY ../QPROTOSRC/FAMILLY.RPGLEINC

Dcl-Pr chainFAMILLY;
  P_FAID          Char(3)         value;
End-Pr;

Dcl-S K_FAID          LIKE(FAID);

//=============================================
Dcl-Proc GetArtFamDesc export;
  Dcl-Pi GetArtFamDesc like(fadesc);
    P_FAID          Char(3)         value;
  End-Pi;
  chainFAMILLY(P_FAID
        );
  return FADESC;
End-Proc GetArtFamDesc;
//=============================================
Dcl-Proc ExistArtFam export;
  Dcl-Pi ExistArtFam Ind;
    P_FAID          Char(3)         value;
  End-Pi;
  chainFAMILLY(P_FAID
        );
  return %found(familly);
End-Proc ExistArtFam;

//=============================================
Dcl-Proc IsArtFamDeleted export;
  Dcl-Pi IsArtFamDeleted Ind;
    P_FAID          Char(3)         value;
  End-Pi;
  chainFAMILLY(P_FAID
        );
  return FADEL = 'X';
End-Proc IsArtFamDeleted;

Dcl-Proc chainFAMILLY;
  Dcl-Pi chainFAMILLY;
    P_FAID          Char(3)         value;
  End-Pi;
 if not %open(FAMILLY);
   open FAMILLY;
 endif;
  if P_FAID <> FAID;
    K_FAID =  P_FAID;
    clear *all FFAMI;
    chain K_FAID FAMILLY;
  endif;
End-Proc chainFAMILLY;

Dcl-Proc closeFAMILLY;
  Dcl-Pi closeFAMILLY End-Pi;
 if %open(FAMILLY);
   close FAMILLY;
 endif;
End-Proc closeFAMILLY;