@echo off 
title �����Ӳ����Ϣ��ѯ
color 0B
mode con cols=79 lines=45
cls
echo. 
echo.      _______________������Ӳ�����________________
echo.
echo.    ����:
for /f "tokens=* delims=" %%a in ('reg query "HKLM\HARDWARE\DESCRIPTION\System\BIOS" /v "SystemManufacturer"') do (set "Brand=%%a")
echo.            Ʒ�ƣ�%Brand:~36%
for /f "tokens=* delims=" %%a in ('reg query "HKLM\HARDWARE\DESCRIPTION\System\BIOS" /v "BaseBoardProduct"') do (set "model=%%a")
echo.            �ͺţ�%model:~34%
)
echo.
echo.����
wmic csproduct get Name
echo.Ӳ���������к�___
wmic diskdrive get serialnumber
echo.����CPU���к�___
wmic cpu get serialnumber
echo.����biso���к�___
wmic bios get serialnumber
echo.�����������к�___
wmic baseboard get serialnumber
echo.����UUID
wmic csproduct get uuid

echo.������ϢMAC
@echo off&color 0B&&setlocal EnableDelayedExpansion
for /f "tokens=*" %%i in ('ipconfig /all^|findstr /i "���� ������ַ"') do set "qq=%%i"&&set "qq=!qq:. =!"&&echo.!qq!
echo.
for /f "tokens=*" %%i in ('ipconfig /all^|findstr /i "DUID"') do set "qq=%%i"&&set "qq=!qq:. =!"&&echo.!qq!
getmac
title ��ѯ��ϣ�
echo.
echo.������,���س�������
pause>nul
goto exit


