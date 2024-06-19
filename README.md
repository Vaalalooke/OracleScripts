# OracleScripts

Una colección de scripts para hacer la vida del DBA más sencilla.

## asm - ASM (Automatic Storage Management)

Scripts para administrar o monitorear ASM.

### DBDGUsage

Uso de los Grupos de Disco de la base, pregunta por db_name

### DiskGroups

Detalle de Grupos de Disco y su uso

### StorageUsage

Uso de todo el almacenamiento

## db_scripts - Database Scripts

Scripts de monitoreo y uso para la base de datos de Oracle.

### FlashRecoveryArea

Detalle del Área de Recuperación Flash (FRA)

### InstanceStatus

Estado de la Instancia, hora de inicio, nombre único, estado de Data Guard

## prompt - Several prompts for sqlplus

Estos archivos permiten modificar el prompt y mostrar información valiosa.

### prompt10g

Crea un prompt con el usuario y el nombre de la base de datos

### promptpre10g

Crea un prompt con el usuario y el nombre de la base de datos, utilizar en motores previos a 10g

## tablespaces - Tablespaces scripts

Estos scripts te permiten encontrar cuanto espacio se ha reservado, libre i si se utilizan de manera adecuada, se puede encontrar el crecimiento y los patrones de uso de la base de datos.  

### AllWithoutUNDO

Lista todos los tablespaces excepto el de UNDO

### AllWithoutUNDOGb

Lista todos los tablespaces mostrando el espacio en Gb excepto el UNDO

### DataFilesDetailFromFileName

Solicita un nombre de archivo y lista todos los archivos que coincidan

### DataFilesDetailFromTSNAME

Solicita un nombre de tablespace y lista todos los archivos de datos y su detalle que le pertenezcan o coincidan con el nombre

### DataFilesFromTSNAME

Solicita un nombre de tablespace y lista todos los archivos de datos que le pertenezcan o coincidan con el nombre

### FilterObjectsInDataFileName

Busca objetos en el nombre del archivo de datos provisto por el usuario

### FilterTBSP

Filtra tablespaces

### FilterTBSPAndDataFileName

Filtra tablespaces y los muestra y sus archivos de datos

### FilterTBSPFileName

Filtra tablespaces por nombre de archivo

### FilterTBSPOverPERC

Muestra los tablespace que exceden PERC (el porcentaje) dado por el usuario

### SegmentsNextExtentNotFit

Lista segmentos (objetos) los cuales el siguiente segmento no cabrá en el espacio libre

### TBSPOver80pc

Lista tablespaces que están sobre el 80%

### TBSPOver90pc

Lista tablespaces que están sobre el 90%

### TempDetail

Lista el detalle del tablespace temporal

### TempFiles

Lista el detalle de los datafiles del tablespace temporal

### TempFreeSpace

Muestra el espacio libre en el tablespace temporal

### TempSegmentPerSession

Muestra el uso de segmentos temporales por sesión

### TempSegments

Muestra segmentos temporales

### TempUsage

Muestra el uso del tablespace temporal

### TrueTempFreeSpace

Muestra el espacio libre real en el tablespace temporal

### UNDO

Muestra el uso del UNDO