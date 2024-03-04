# OracleScripts

A collection of DBA scripts to make life easier.

## asm

### DBDGUsage

Usage of database Disk Groups, it will ask for db_name

### DiskGroups

Detail of Disk Groups and usage

### StorageUsage

Usage of all storage

## db_scripts

### FlashRecoveryArea

Detail of Flash Recovery Aarea

### InstanceStatus

Status of Instance, startup time, unique name, Data Guard status

## prompt

### prompt10g

Creates a prompt with user and db name

### promptpre10g

Creates a prompt with user and db name, use on db engine previous to 10g

## tablespaces

### AllWithoutUNDO

Lists all tablespaces but UNDO

### AllWithoutUNDOGb

Lists all tablespaces with space in Gb but UNDO

### DataFilesDetailFromFileName

Requests a file name and lists data files that match

### DataFilesDetailFromTSNAME

Requests tablespace name and lists all datafiles detail that belong to it or match

### DataFilesFromTSNAME

Requests tablespace name and lists all datafiles that belong to it or match

### FilterObjectsInDataFileName

Searchs for objects in a data file name provided by user

### FilterTBSP

Filters tablespaces

### FilterTBSPAndDataFileName

Filters tablespaces and shows them and data file names

### FilterTBSPFileName

Filters tablespace by file name

### FilterTBSPOverPERC

Shows tablespaces that are over PERC given by user

### SegmentsNextExtentNotFit

Lists segments (objects) which next segment will not fit in free space

### TBSPOver80pc

Lists tablespaces that are over 80%

### TBSPOver90pc

Lists tablespaces that are over 90%

### TempDetail

Lists detail of temporary tablespace

### TempFiles

Lists detail of temporary data files

### TempFreeSpace

Shows free space in the temporary tablespace

### TempSegmentPerSession

Shows usage of temporary segments by session

### TempSegments

Shows temporary segments

### TempUsage

Shows usage of temporary tablespace

### TrueTempFreeSpace

Shows true free space in temporary tablespace

### UNDO

Shows undo usage