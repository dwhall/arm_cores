import std/[os, strformat, strutils]

proc doExec(cmd: string) =
  let prefix = when defined(windows): "cmd /C " else: ""
  let (output, exitCode) = gorgeEx(prefix & cmd)
  if exitCode != QuitSuccess: quit(output, exitCode)

task build, "Builds all Cortex-M packages":
  let seggerDir = joinPath(getCurrentDir(), "src", "segger")
  echo "minisvd2nim converting:"
  for fullFn in listFiles(seggerDir):
    let (dir, name, ext) = splitFile(fullFn)
    if name.startsWith("Cortex-M") and ext.endsWith("svd"):
      echo name, ext
      doExec &"minisvd2nim --force --segger {fullFn}"
