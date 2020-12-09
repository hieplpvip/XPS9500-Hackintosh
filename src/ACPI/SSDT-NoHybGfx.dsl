/*
* Disable discrete graphics (c) Bumblebee-Project
* >> https://github.com/Bumblebee-Project/Bumblebee/wiki/ACPI-for-Developers#acpi-and-the-nvidia-card
* ---
* Important: Change all ACPI paths accordingly.
* Credit to Maemo for original idea and midi1996 for the SSDT
*/
DefinitionBlock ("", "SSDT", 2, "HIEP", "NoHybGfx", 0)
{
    External (_SB_.PCI0.PEG0.PEGP._DSM, MethodObj)
    External (_SB_.PCI0.PEG0.PEGP._PS3, MethodObj)

    Device (NHG1)
    {
        Name (_HID, "NHG10000")

        Method (_INI, 0, NotSerialized)
        {
            If ((CondRefOf (\_SB.PCI0.PEG0.PEGP._DSM) && CondRefOf (\_SB.PCI0.PEG0.PEGP._PS3)))
            {
                // Card Off Request
                \_SB.PCI0.PEG0.PEGP._DSM (ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0"), 0x0100, 0x1A, Buffer (0x04)
                    {
                        0x01, 0x00, 0x00, 0x03
                    })
                // Card Off
                \_SB.PCI0.PEG0.PEGP._PS3 ()
            }
        }
    }
}

