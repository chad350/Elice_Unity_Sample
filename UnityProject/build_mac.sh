#!/bin/bash
UNITY="/Applications/Unity/Hub/Editor/6000.3.20f1/Unity.app/Contents/MacOS/Unity"

cd "$(dirname "$0")"
mkdir -p Logs

"$UNITY" -batchmode -nographics -quit \
  -projectPath "$(pwd)" \
  -buildTarget OSXUniversal \
  -executeMethod ExpeditionCamp.EditorTools.BuildScript.BuildForTest \
  -logFile Logs/build_mac.log
RESULT=$?

if [ $RESULT -ne 0 ]; then
  echo "BUILD FAILED. Last lines of Logs/build_mac.log:"
  tail -n 30 Logs/build_mac.log
  exit 1
fi

ditto -c -k --keepParent Builds/Game.app Builds/Game.zip
echo "BUILD SUCCEEDED: Builds/Game.app"
exit 0