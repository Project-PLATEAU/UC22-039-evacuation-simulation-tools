@echo off

mkdir log

: �u�x�����ϐ��̓W�J�v�͕K�v�Ȃ�
for %%M in (00000 00010 00020) do (
  title ���� %%Mmin
  echo ==================================================
  echo ���� %%Mmin
  "C:\Program Files\FME\fme.exe" Converter_Flood_Meshes_to_3DTiles.fmw ^
    --���̓t�@�C�� data\high_tide\BP001_SHAPE\BP001_%%Mm.SHP ^
    --�o�̓p�X out ^
    --���ʒ��p���W�n JGD2K-02 ^
    --�ő�ʐ� 10000 ^
    --LOG_FILE log\log_high_tide_BP001_%%Mm.txt
)

pause
