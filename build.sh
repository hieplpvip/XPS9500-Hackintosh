#!/bin/bash

IASL='./tools/iasl -vw 3073 -vi -vr -p'
SRCACPI='src/ACPI'

rm -rf build && mkdir build

# Copy OpenCore EFI folder
cp -R download/oc/OpenCorePkg/X64/EFI build

OCFOLDER="build/EFI/OC"

# Build ACPI
$IASL $OCFOLDER/ACPI/SSDT-AWAC.aml $SRCACPI/SSDT-AWAC.dsl
$IASL $OCFOLDER/ACPI/SSDT-EC-USBX.aml $SRCACPI/SSDT-EC-USBX.dsl
$IASL $OCFOLDER/ACPI/SSDT-GPRW.aml $SRCACPI/SSDT-GPRW.dsl
#$IASL $OCFOLDER/ACPI/SSDT-MEM2.aml $SRCACPI/SSDT-MEM2.dsl
$IASL $OCFOLDER/ACPI/SSDT-PLUG.aml $SRCACPI/SSDT-PLUG.dsl
#$IASL $OCFOLDER/ACPI/SSDT-PMCR.aml $SRCACPI/SSDT-PMCR.dsl
$IASL $OCFOLDER/ACPI/SSDT-PNLF-CFL.aml $SRCACPI/SSDT-PNLF-CFL.dsl
#$IASL $OCFOLDER/ACPI/SSDT-PPMC.aml $SRCACPI/SSDT-PPMC.dsl
#$IASL $OCFOLDER/ACPI/SSDT-SBUS-MCHC.aml $SRCACPI/SSDT-SBUS-MCHC.dsl
$IASL $OCFOLDER/ACPI/SSDT-XOSI.aml $SRCACPI/SSDT-XOSI.dsl

# Copy UEFI Drivers
cp -R download/drivers/* $OCFOLDER/Drivers/

# Copy kexts
cp -R download/kexts/* $OCFOLDER/Kexts/
#cp -R src/Kexts/* $OCFOLDER/Kexts/

# Copy OpenCore config
cp src/config.plist $OCFOLDER/config.plist

# Replace SMBIOS
if [ -e src/smbios.txt ]; then
    . src/smbios.txt
else
    . src/smbios-sample.txt
fi
sed -i "" -e "s/MLB_PLACEHOLDER/$MLB/" \
          -e "s/Serial_PLACEHOLDER/$SystemSerialNumber/" \
          -e "s/SmUUID_PLACEHOLDER/$SystemUUID/" $OCFOLDER/config.plist

# Remove unused UEFI Drivers
find $OCFOLDER/Drivers ! -name AudioDxe.efi \
                       ! -name HfsPlus.efi \
                       ! -name OpenRuntime.efi -type f -delete

# Remove unused UEFI Tools
rm -rf $OCFOLDER/Tools
