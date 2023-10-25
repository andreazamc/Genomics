#Identificación de genes de fusion de NTRK en gliomas de pacientes infantiles  
# elaborado por Andrea Zambrano 
# Fecha de elaboración 21-10-2023
# Fecha de última modificación

# Abrir el archivo seq1 que se encuentra en la carpeta Downloads 

getwd()
seq1=readLines("data/seq1.txt")

#Para saber cuantos genes tengo en mi archivo

length(grep(">contig", seq1))


#Extraer nombre de los genes

G1 = unlist(strsplit(seq1[grep(">contig", seq1)], " ")) [grep(">contig",G1)]

# Extraer la secuencia en FASTA del primer gen del documento seq1 en una sola fila

L1 = paste(seq1[2:10], collapse = "")

REF = paste(seq1[12:21], collapse ="")

# Comparar las secuencias con el genoma de referencia con cada gen del paciente 
#numero de caracteres

nchar(L1)
nchar(L2)

L1a=unlist(strsplit(L1,""))
REFa = unlist(strsplit(REF,""))

AA=0
RR=c()
POS = c()




for (ii in 1:min(c(nchar(L1),nchar(REF))) ){

if (L1a[ii]==REFa[ii]){ } else {AA=AA+1; RR=c(RR,paste(REFa[ii], L1a[ii],sep="-")); POS=c(POS, ii) }

}

if (length(L1a)>length(REFa)) { AA = AA+(length(L1a)-length(REFa))} else  { AA = AA+(length(REFa)-length(L1a))}

if (length(L1a)>length(REFa)) { RR = c(RR, paste(rep(NA,abs(length(L1a)-length(REFa) )), L1a[(length(REFa)+1):length(L1a)], sep="-" ))} else { RR = c(RR, paste( REFa[(length(L1a)+1):length(REFa)], rep(NA,(length(REFa)-length(L1a)) ), sep="-"))}

if (length(L1a)>length(REFa)) { POS = c(POS,length(L1a):(length(REFa)+1))} else { POS = c(POS,(length(L1a)+1):length(REFa))}

                     
# Reportar cambio de la base y posición. Número de bases. 

Balance = data.frame(Parciente= "NOMBRE", GEN = G1[1], MODIFICACION=RR, POSICION=POS)

Bal2=table (Balance$MODIFICACION )


