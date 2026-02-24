# Comment out "if isMainModule: main()"
# in reorder_svd.nim to compile these tests

import unittest2

# file under test:
include reorder_svd

let
  lines = [
    "<name>Supported Parallel Port Sizes Register</name>\n",
    "<displayName>TPIU_SSPSR</displayName>\n",
    "<description>Indicates the supported parallel trace port sizes</description>\n",
  ]
  line0 = lines[0].strip
  line1 = lines[1].strip
  line2 = lines[2].strip

test "isTagged SHOULD fail due to wrong tag and capitalization":
  check not line0.isTagged("Name")
  check not line1.isTagged("DisplayName")
  check not line2.isTagged("Description")
  check not line0.isTagged("displayName")
  check not line1.isTagged("description")
  check not line2.isTagged("name")

test "line0 rules":
  check line0.isTagged("name")
  check line0.contains(" ")

test "line1 rules":
  check line1.isTagged("displayName")
  check not line1.contains(" ")
  check contentsOfTag(line1).hasNoLowercaseLetters

test "line2 rules":
  check line2.isTagged("description")
  check line2.isTagged("description")

test "Three lines match":
  check threeLinesMatch(lines, 0)

test "contentsOfTag SHOULD extract the content of the tag":
  check contentsOfTag(line0) == "Supported Parallel Port Sizes Register"
  check contentsOfTag(line1) == "TPIU_SSPSR"
  check contentsOfTag(line2) == "Indicates the supported parallel trace port sizes"

test "modifyLines SHOULD reorder and combine the three lines":
  let modifiedLines = modifyLines(lines, 0)
  check modifiedLines.len == 2
  check modifiedLines[0] == "<name>TPIU_SSPSR</name>"
  check modifiedLines[1] == "<description>Supported Parallel Port Sizes Register Indicates the supported parallel trace port sizes</description>"

test "splitLines removes newlines":
  let lines = """<name>Supported Parallel Port Sizes Register</name>
    <displayName>TPIU_SSPSR</displayName>
    <description>Indicates the supported parallel trace port sizes</description>""".splitLines
  check lines.len == 3
  check not lines[0].endsWith("\n")
  check not lines[1].endsWith("\n")
  check not lines[2].endsWith("\n")

test "indentation SHOULD return the number of leading spaces in a string":
  check indentation("<name") == 0
  check indentation("  <name") == 2
  check indentation("    <name") == 4
  check indentation("   <test\n   <test\n   \n") == 3

test "indent SHOULD add the specified number of spaces to the beginning of a string":
  check indent("<name>", 0) == "<name>"
  check indent("<name>", 2) == "  <name>"
  check indent("<name>", 4) == "    <name>"
  check indent("<name>" & "foo" & "</name>", 8) == "        <name>foo</name>"
