#DEFINE _GOSUB asm CALL
#DEFINE _RETURN asm RET
#DEFINE _GOTO asm JMP
Function ROR (ByVal DATA_ As UInteger, ByVal bits As Integer) As UInteger''   right ROR bits
   Asm   'Return (DATA_ Shr bits) Or (DATA_ Shl (32 - bits))
     mov ecx, [bits]
     mov eax, [DATA_]
     Ror eax, cl
     mov [Function], eax
   End Asm
End Function
