#!/bin/bash

sudo xattr -r -d com.apple.quarantine /System/Library/Extensions/NVMeGeneric.kext
sudo spctl --master-enable