@echo off
setlocal
cd /d "%~dp0"
set "BASE_JAR=%~1"
if "%BASE_JAR%"=="" set "BASE_JAR=%~dp0baseline\OUT_OF_SPEC_RPG_IronSpell_SAO_Mobility_Stage1_1.jar"
if not exist "%BASE_JAR%" (
  echo ERROR: Stage 1.1 base JAR was not found: "%BASE_JAR%"
  exit /b 2
)
where java >nul 2>nul || (echo ERROR: Java was not found. Install JDK 17.& exit /b 2)
where javac >nul 2>nul || (echo ERROR: javac was not found. Install a full JDK 17.& exit /b 2)
where gradle >nul 2>nul || (echo ERROR: Gradle was not found. Install Gradle 8.x and put it on PATH.& exit /b 2)
if not exist "baseline" mkdir baseline
if /I not "%BASE_JAR%"=="%~dp0baseline\OUT_OF_SPEC_RPG_IronSpell_SAO_Mobility_Stage1_1.jar" copy /Y "%BASE_JAR%" "baseline\OUT_OF_SPEC_RPG_IronSpell_SAO_Mobility_Stage1_1.jar" >nul
if errorlevel 1 (echo ERROR: Could not copy Stage 1.1 baseline.& exit /b 2)
echo Running the full Stage 5.3.25 ForgeGradle build and creating the merged installable JAR...
gradle clean build
if errorlevel 1 (echo ERROR: Gradle build failed.& exit /b 3)
echo.
echo [SUCCESS] Final JAR:
echo %~dp0build\libs\OUT_OF_SPEC_RPG_IronSpell_SAO_Stage5_3_25_ContactAwareHandPoses.jar
echo Original Stage 1.1 baseline was not modified.
exit /b 0
