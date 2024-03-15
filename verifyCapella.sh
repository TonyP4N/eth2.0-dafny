#!/bin/bash

# Color definitions for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

error=0
processedfiles=0

declare -a filesToCheck=(
"src/dafny/beacon/BeaconChainTypes.dfy"
"src/dafny/beacon/Helpers.dfy"
"src/dafny/beacon/statetransition/EpochProcessing.dfy"
"src/dafny/beacon/statetransition/EpochProcessing.s.dfy"
"src/dafny/beacon/statetransition/StateTransition.dfy"
"src/dafny/beacon/validators/Validators.dfy"
"src/dafny/ssz/Constants.dfy"
"src/dafny/utils/Eth2Types.dfy"
"test/dafny/merkle/third_party_implementations/PySszBitlistMerkleisation.py"
"src/dafny/beacon/Helpers.cap.dfy"
"src/dafny/beacon/statetransition/stateTransition.cap.dfy"
)

defaultverifconf="/dafnyVerify:1 /compile:0 /noCheating:1"

# Function to process each file
process_file() {
  local file=$1
  # Check if the file exists
  if [ ! -f "$file" ]; then
    echo -e "${RED}File $file not found.${NC}"
    return
  fi

  processedfiles=$((processedfiles + 1))
  local config=$(grep "//@dafny" "$file" | sed 's/\/\/[ \t]*@dafny[ \t]*//g' | sed 's/[ \t]*$//g')

  [ -z "$config" ] && config="$defaultverifconf"

  echo -e "${BLUE}-------------------------------------------------------${NC}"
  echo -e "Processing ${file} with configuration: ${config}"

  dafny $config $file
  if [ $? -eq 0 ]; then
      echo -e "${GREEN}PASS: No errors detected in ${file}.${NC}"
  else
      echo -e "${RED}FAIL: Errors found in ${file}.${NC}"
      error=$((error + 1))
  fi
}

echo -e "${BLUE}Starting Dafny verification process...${NC}"

# Loop through and process each specified file
for file in "${filesToCheck[@]}"; do
  process_file $file
done

echo -e "${BLUE}-------------------------------------------------------${NC}"
echo -e "Verification Summary:\nProcessed files: $processedfiles\nErrors detected: $error"
if [ $error -ne 0 ]; then
  echo -e "${RED}Some files contain errors. Please review the above output for details.${NC}"
  exit 1
else
  echo -e "${GREEN}All files verified successfully with no errors detected.${NC}"
  exit 0
fi
