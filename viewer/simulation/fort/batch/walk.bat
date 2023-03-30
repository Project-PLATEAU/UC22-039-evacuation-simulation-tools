@echo off
title �F�{���Q_�k���p�[�\�i��

:goto step3

set time_stamp=%~1
set saigai_case=%~2

:-----------------------------------------------------
:step1
echo STEP1:�����Ŋ��̃����N�ɐ������Ђ�
:-----------------------------------------------------
set RC=03
set F01=10,formatted,old    ,..\NW\�k��NW_case_%saigai_case%.txt
set F02=11,formatted,old    ,..\param\%time_stamp%.txt
set F03=30,formatted,unknown,..\out\1�k��suisen_%time_stamp%.txt
..\exe\10_suisen_P.exe
if errorlevel 1 echo ERROR LEVEL 1
if errorlevel 1 goto err


:-----------------------------------------------------
:step2
echo STEP2:�k�����̍ۂ̌o�H����t������ �s����͎w��ς�
:-----------------------------------------------------
set RC=05
set F01=05,formatted,old    ,..\param\%time_stamp%.txt
set F02=10,formatted,old    ,..\NW\�k��NW_case_%saigai_case%.txt
set F03=11,formatted,old    ,..\NW\���e�[�u���i�k���j.prn
set F04=15,formatted,old    ,..\out\1�k��suisen_%time_stamp%.txt
set F05=30,formatted,unknown,..\out\2�k��Initial_%time_stamp%.txt
..\exe\21_TohoInitial_P.exe
:..\slib\21_TohoInitial_P\x64\debug\21_TohoInitial_P.exe
if errorlevel 1 echo ERROR LEVEL 1
if errorlevel 1 goto err


:-----------------------------------------------------
:step3
echo STEP3:�k�����V�~�����[�V����
:-----------------------------------------------------
set RC=06
set F01=04,formatted,old    ,..\param\%time_stamp%.txt
set F02=05,formatted,old    ,..\settings\�k������_case_%saigai_case%.txt
set F03=10,formatted,old    ,..\NW\�k��NW_case_%saigai_case%.txt
set F04=11,formatted,old    ,..\NW\���e�[�u���i�k���j.prn
set F05=15,formatted,old    ,..\out\2�k��Initial_%time_stamp%.txt
set F06=35,formatted,unknown,..\out\3�k��_�����_%time_stamp%.csv
..\exe\40_tohosim_v2_P.exe
:..\slib\40_tohosim_v2_P\x64\debug\40_tohosim_v2_P.exe
if errorlevel 1 echo ERROR LEVEL 1
if errorlevel 1 goto err


:-----------------------------------------------------
:step4
echo STEP4:�k�����̌o�H�f�[�^�z��̍쐬
:-----------------------------------------------------
set F01=..\out\3�k��_�����_%time_stamp%.csv
set F02=..\NW\���s�җp�l�b�g���[�N_link4_3d.geojson
set F03=..\personal\%time_stamp%.json
Powershell.exe -ExecutionPolicy RemoteSigned -File ..\exe\make_walk_route_array.ps1 %F01% %F02% %F03%
if errorlevel 1 echo ERROR LEVEL 1
if errorlevel 1 goto err

goto end


:err
exit /b 1

:end
exit /b 0
