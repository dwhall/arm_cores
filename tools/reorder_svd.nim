## A command line tool that parses the given .svd input file
## and rearranges certain elements for beetter SVD compliance.
##

import std/[files, parseopt, paths, strformat, strutils, syncio]

const
  version = &"0.1\p"
  usage = "reorder_svd [option] [<input.svd>]\p"
  copyright = "Copyright 2026 Dean Hall. See LICENSE.txt for details.\p"
  help = &"""
reorder_svd - Manipulate an SVD file

{copyright}
Usage:
  {usage}
Options:
  -v / --version        show the version
  --help                show this help
"""

proc parseArgs(): Path
proc writeMsgAndQuit(outFile: File, msg: string, errorCode: int = QuitFailure)
proc processFile(fn: Path)
proc processLines(lines: seq[string]): seq[string]
func threeLinesMatch(lines: openArray[string], i: int): bool
func modifyLines(lines: openArray[string], i: int): seq[string]

proc main() =
  try:
    let fn = parseArgs()
    if not fileExists(fn):
      writeMsgAndQuit(stdout, usage)
    processFile(fn)
  except IOError as e:
    writeMsgAndQuit(stdout, "Error: " & e.msg & "\n" & usage)

proc parseArgs(): Path =
  ## Returns only if a proper combination of arguments are given;
  ## otherwise it prints a message and exits
  for kind, key, val in getopt():
    case kind
    of cmdArgument:
      result = absolutePath(Path(key))
    of cmdLongOption, cmdShortOption:
      case normalize(key)
      of "version", "v":
        writeMsgAndQuit(stdout, "reorder_svd v" & version)
      else:
        writeMsgAndQuit(stdout, help)
    of cmdEnd:
      break

proc writeMsgAndQuit(outFile: File, msg: string, errorCode: int = QuitFailure) =
  outFile.write(msg)
  outFile.flushFile()
  outFile.close()
  quit(errorCode)

proc processFile(fn: Path) =
  let
    contents = open(fn.string, fmRead).readAll
    lines = contents.splitLines()
    modifiedLines = processLines(lines)
    newFn = fn.string & "_reordered.svd"
  writeFile(newFn, modifiedLines.join "\p")

proc processLines(lines: seq[string]): seq[string] =
  var i = 0
  while i < len(lines):
    let line = lines[i]
    if not threeLinesMatch(lines, i):
      result.add line
      inc i
    else:
      result.add modifyLines(lines, i)
      inc i, 3

func isTagged(s: string, tag: string): bool =
  ## Returns true if s is of the form <tag>...</tag>
  s.startsWith("<" & tag & ">") and s.endsWith("</" & tag & ">")

func hasNoLowercaseLetters(s: string): bool =
  ## Returns true if all letters in s are uppercase (ignoring non-letters)
  for c in s:
    if c in 'a'..'z':
      return false
  return true

func contentsOfTag(s: string): string =
  ## Returns the contents of the tag in s, which is of the form <tag>...</tag>
  let contentStart = s.find(">") + 1
  let contentEnd = s.rfind("</") - 1
  result = s.substr(contentStart, contentEnd)

func threeLinesMatch(lines: openArray[string], i: int): bool =
  ## Returns true if the three lines match: name, displayName, description
  let line0 = lines[i + 0].strip
  if not (line0.isTagged("name") and line0.contains(" ")):
    return false
  let line1 = lines[i + 1].strip
  if not (line1.isTagged("displayName") and not line1.contains(" ") and contentsOfTag(line1).hasNoLowercaseLetters):
    return false
  let line2 = lines[i + 2].strip
  result = line2.isTagged("description")

func modifyLines(lines: openArray[string], i: int): seq[string] =
  ## Returns two lines: name and description.
  ## The displayName
  let
    indentLevel = indentation(lines[i])
    line0 = lines[i + 0].strip
    line1 = lines[i + 1].strip
    line2 = lines[i + 2].strip
  var line2contentsLowered = contentsOfTag(line2)
  line2contentsLowered[0] = line2contentsLowered[0].toLowerAscii
  result.add(indent("<name>" & contentsOfTag(line1) & "</name>", indentLevel))
  result.add(indent("<description>" & contentsOfTag(line0) & " " & line2contentsLowered & "</description>", indentLevel))

if isMainModule:
  main()
