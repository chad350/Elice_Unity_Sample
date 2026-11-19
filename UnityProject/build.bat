start "" /wait "C:\Program Files\Unity\Hub\Editor\6000.3.28f1\Editor\Unity.exe" -batchmode -nographics -quit ^
  -projectPath "C:\monster\live\Elice_Unity_Sample\UnityProject" ^
  -buildTarget Win64 ^
  -executeMethod ExpeditionCamp.EditorTools.BuildScript.BuildForTest ^
  -logFile Logs\build_windows.log

echo %ERRORLEVEL%