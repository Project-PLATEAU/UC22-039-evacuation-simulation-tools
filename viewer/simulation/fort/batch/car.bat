@echo off
title �F�{���Q_�����ԃp�[�\�i��

:goto step3

set time_stamp=%~1
set saigai_case=%~2
set hinan_case=%~3

:-----------------------------------------------------
:step1
echo �o���n�̍Ŋ��̃����N�i�Z�N�V�����j�̏����Q�b�g
:-----------------------------------------------------
echo STEP1 carSection_P Start
set RC=03
set F01=10,formatted,old    ,..\NW\���v�p_�����ԃZ�N�V�����f�[�^.txt
set F02=11,formatted,old    ,..\param\%time_stamp%.txt
set F03=30,formatted,unknown,..\out\5��Section_%time_stamp%.txt
..\exe\15_carSection_P.exe
:..\slib\15_carSection_P\x64\debug\15_carSection_P.exe
if errorlevel 1 echo ERROR LEVEL 1
if errorlevel 1 goto err


:-----------------------------------------------------
:step2
echo �����Ԕ��̏o���Z�N�V�����̊m��
:-----------------------------------------------------
echo STEP2 carInitial Start
set RC=05
set F01=10,formatted,old    ,..\NW\������NW_case_%saigai_case%.txt
set F02=11,formatted,old    ,..\NW\���n�_�e�[�u���i�����ԁj.csv
set F03=12,formatted,old    ,..\NW\�����NSQNst.txt
set F04=15,formatted,old    ,..\out\5��Section_%time_stamp%.txt
set F05=30,formatted,unknown,..\out\6��Initial_%time_stamp%.csv
..\exe\25_carInitial_P.exe
:..\slib\25_carInitial_P\x64\debug\25_carInitial_P.exe
if errorlevel 1 echo ERROR LEVEL 1
if errorlevel 1 goto err


:--------------------------------------------------------
:step3
echo �����Ԃ̃p�[�\�i�����s���V�~�����[�V����
:--------------------------------------------------------
echo STEP3 carPersonal Start
set RC=11
set F01=10,formatted,old    ,..\settings\�����ԏ���1_case_%saigai_case%.txt
set F02=11,formatted,old    ,..\settings\�����ԏ���2.txt
set F03=12,formatted,old    ,..\NW\������NW_case_%saigai_case%.txt
set F04=13,formatted,old    ,..\NW\�Z�N�V�����f�[�^.csv
set F05=14,formatted,old    ,..\NW\�M������.csv
set F06=15,formatted,old    ,..\NW\�����_���.txt
set F07=20,formatted,old    ,..\out\6��Initial_%time_stamp%.csv
set F08=21,unformatted,old  ,..\case_data\case_%saigai_case%_%hinan_case%\�����N���.txt
set F09=22,unformatted,old  ,..\case_data\case_%saigai_case%_%hinan_case%\�Z�N�V�������.txt
set F10=23,formatted,old    ,..\NW\�Z�N�V�����Z������_case_%saigai_case%.csv
set F11=30,formatted,unknown,..\out\7��_�����_%time_stamp%.txt
..\exe\50_carpersonal_v5.exe
:..\slib\50_carpersonal_v5\x64\Debug\50_carpersonal_v5.exe
:..\slib\50_carpersonal_v5\x64\release\50_carpersonal_v5.exe
if errorlevel 1 echo ERROR LEVEL 1
if errorlevel 1 goto err


:--------------------------------------------------------
:step4
echo �����Ԕ��̌o�H�f�[�^�z��̍쐬
:--------------------------------------------------------
echo STEP4 carRoute Start
set RC=04
set F01=07,formatted,unknown,..\out\8��_�o�H�f�[�^�z��_%time_stamp%.txt
set F02=10,formatted,old    ,..\NW\3�������W�e�[�u��_�ȉ~�̍�_������NW_�Ԑ���.csv
set F03=11,formatted,old    ,..\out\7��_�����_%time_stamp%.txt
set F04=20,formatted,unknown,..\personal\%time_stamp%.json
..\exe\make_car_route_array.exe
if errorlevel 1 echo ERROR LEVEL 1
if errorlevel 1 goto err

goto end

:err
exit /b 1

:end
exit /b 0
