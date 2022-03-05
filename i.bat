@echo ---------------------------------------------------------
@echo Copying base ROM (mother3.gba) to new test ROM (test.gba)
@echo ---------------------------------------------------------
@echo.
@copy mother3j.gba testj.gba
@copy mother3e.gba teste.gba
@echo.
@echo.
@echo ---------------------------------------------------------
@echo Compiling .asm files and inserting all new data files
@echo ---------------------------------------------------------
@echo.
@xkas testj.gba m3hackj.asm
@xkas teste.gba m3hack.asm
@echo.
@echo.
@echo COMPLETE!
@echo.
@PAUSE