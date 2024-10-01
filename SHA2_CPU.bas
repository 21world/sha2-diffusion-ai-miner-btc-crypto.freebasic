ASM SHA2:
DIM AS UInteger I,A,B,C,D,E,F,G,H,S0,S1,MAJ,T0,T1,CH,HH(8),STAGE
DIM AS UInteger K(63)={ _ ''2^32 times the cube root of the first 64 primes 2..311
&h428a2f98, &h71374491, &hb5c0fbcf, &he9b5dba5, &h3956c25b, &h59f111f1,&h923f82a4, &hab1c5ed5,_'7
&hd807aa98, &h12835b01, &h243185be, &h550c7dc3,&h72be5d74, &h80deb1fe, &h9bdc06a7, &hc19bf174,_'15
&he49b69c1, &hefbe4786,&h0fc19dc6, &h240ca1cc, &h2de92c6f, &h4a7484aa, &h5cb0a9dc, &h76f988da, _'23
&h983e5152, &ha831c66d, &hb00327c8, &hbf597fc7, &hc6e00bf3, &hd5a79147,&h06ca6351, &h14292967,_'31
&h27b70a85, &h2e1b2138, &h4d2c6dfc, &h53380d13,&h650a7354, &h766a0abb, &h81c2c92e, &h92722c85,_'39
&ha2bfe8a1, &ha81a664b,&hc24b8b70, &hc76c51a3, &hd192e819, &hd6990624, &hf40e3585, &h106aa070, _'47
&h19a4c116, &h1e376c08, &h2748774c, &h34b0bcb5, &h391c0cb3, &h4ed8aa4a,&h5b9cca4f, &h682e6ff3,_'55
&h748f82ee, &h78a5636f, &h84c87814, &h8cc70208,&h90befffa, &ha4506ceb, &hbef9a3f7, &hc67178f2 }'63
DIM AS STRING M_S:DIM AS UINTEGER W(64) 'MESSAGE 16X32BIT=512BITS
M_S="000187a287320b1a1426674f2fa722ce"'NONCE(32BITS)+96BITS=128BITS(16BYTES) IN STRING 'MESSAGE STAGE1 /512bit chunk2/
W(3)=Val("&h" &MID(M_S,1,8)):W(2)=Val("&h" &MID(M_S,9,8)):W(1)=Val("&h" &MID(M_S,17,8)):W(0)=Val("&h" &MID(M_S,25,8))
W(4)=&B10000000000000000000000000000000'1 AT THE END OF MESSAGE
W(15)=640'LENGTH OF MESSAGE 128BITS

FOR STAGE=1 TO 2
IF STAGE=2 THEN'MESSAGE STAGE2=STAGE 1 SHA2 HASH
 W(0)=HH(0):W(1)=HH(1):W(2)=HH(2):W(3)=HH(3):W(4)=HH(4):W(5)=HH(5):W(6)=HH(6):W(7)=HH(7)
 W(8)=&B10000000000000000000000000000000'1 AT THE END OF MESSAGE
 W(15)=256'LENGTH OF MESSAGE 256BITS
ENDIF

'PRINT INFO ON SCREEN
?:?:?:?:COLOR RGB(200,200,200):?"INPUT MESSAGE IN HEX":COLOR RGB(50,200,50)
?HEX(W(0),8);" ";HEX(W(1),8);" ";HEX(W(2),8);" ";HEX(W(3),8);" ";HEX(W(4),8);" ";HEX(W(5),8);" ";HEX(W(6),8);" ";HEX(W(7),8)
?HEX(W(8),8);" ";HEX(W(9),8);" ";HEX(W(10),8);" ";HEX(W(11),8);" ";HEX(W(12),8);" ";HEX(W(13),8);" ";HEX(W(14),8);" ";HEX(W(15),8)
COLOR RGB(200,200,200):?"INPUT MESSAGE IN BIN":COLOR RGB(50,200,50)
?BIN(W(0),32);" ";BIN(W(1),32);" ";BIN(W(2),32) : ?BIN(W(3),32);" ";BIN(W(4),32);" ";BIN(W(5),32)
?BIN(W(6),32);" ";BIN(W(7),32);" ";BIN(W(8),32) : ?BIN(W(9),32);" ";BIN(W(10),32);" ";BIN(W(11),32)
?BIN(W(12),32);" ";BIN(W(13),32);" ";BIN(W(14),32) : ?BIN(W(15),32)
?"(";W(15);" BITS LONG MESSAGE)"
'''''''''''''''''''''''END PRINT'

   For I=16 To 63'Extend the sixteen(16) 32-bit words into sixty-four(64) 32-bit words:
     S0=ROR(W(i-15),7) Xor ROR(W(i-15),18) Xor (W(i-15)shr 3)
     S1=ROR(W(i-2),17) Xor ROR(W(i-2),19)  Xor (W(i-2)shr 10)
     W(i)=W(i-16)+S0+W(i-7)+S1
   Next I
   
IF STAGE=1 THEN ''MIDSTATE INITIAL VALUES ON FIRST SHA2
HH(7)=&h4679ba4e:HH(6)=&hc99876bf:HH(5)=&h4bfe0860:HH(4)=&h82b40025
HH(3)=&h4df6c356:HH(2)=&h45147113:HH(1)=&h9a3afa71:HH(0)=&he48f544a
ENDIF

IF STAGE=2 THEN 'ORIG. INITIAL VALUES ON SECOND SHA2
HH(0)=&h6a09e667:HH(1)=&hbb67ae85:HH(2)=&h3c6ef372:HH(3)=&ha54ff53a
HH(4)=&h510e527f:HH(5)=&h9b05688c:HH(6)=&h1f83d9ab:HH(7)=&h5be0cd19:ENDIF
?HEX(HH(0),8);" ";HEX(HH(1),8);" ";HEX(HH(2),8);" ";HEX(HH(3),8);" ";HEX(HH(4),8);" ";HEX(HH(5),8);" ";HEX(HH(6),8);" ";HEX(HH(7),8);" ";"  <--INITIAL VALUES"
A=HH(0):B=HH(1):C=HH(2):D=HH(3):E=HH(4):F=HH(5):G=HH(6):H=HH(7)'Initialize hash value for this chunk:

 For I=0 To 63
   S0=ROR(A,2) Xor ROR(A,13) Xor ROR (A,22)
   MAJ=(A And B) Xor (B And C) Xor (C And A)
   T0=S0+MAJ
   S1=ROR(E,6) Xor ROR(E,11) Xor ROR (E,25)
   CH=(E And F) Xor (Not E And G)
   T1=H+S1+CH+K(i)+W(i)
   H=G:G=F:F=E:E=D+T1:D=C:C=B:B=A:A=T0+T1
 Next I
  
HH(0)=HH(0)+A:HH(1)=HH(1)+B:HH(2)=HH(2)+C:HH(3)=HH(3)+D:HH(4)=HH(4)+E:HH(5)=HH(5)+F:HH(6)=HH(6)+G:HH(7)=HH(7)+H

COLOR RGB(200,200,200):?"-------------------------------- SHA 2 -------------------------------- ";" STAGE=";STAGE'PRINT RESULT SHA2 ON SCREEN
?HEX(HH(0),8);" ";HEX(HH(1),8);" ";HEX(HH(2),8);" ";HEX(HH(3),8);" ";HEX(HH(4),8);" ";HEX(HH(5),8);" ";HEX(HH(6),8);" ";HEX(HH(7),8);" "

NEXT STAGE
_RETURN
