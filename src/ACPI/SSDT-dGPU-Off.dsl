/* Based off of Rebaman's work:
*  https://github.com/RehabMan/OS-X-Clover-Laptop-Config/blob/master/hotpatch/SSDT-DDGPU.dsl
*/
DefinitionBlock("", "SSDT", 2, "HIEP", "dGPU-Off", 0)
{
    External(_SB.PCI0.PEG0.PEGP._OFF, MethodObj)

    Device(RMD1)
    {
        Name(_HID, "RMD10000")

        Method(_INI)
        {
            // disable discrete graphics (Nvidia/Radeon) if it is present
            If (CondRefOf(\_SB.PCI0.PEG0.PEGP._OFF)) { \_SB.PCI0.PEG0.PEGP._OFF() }
        }
    }
}
