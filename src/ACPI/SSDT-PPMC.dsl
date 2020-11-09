DefinitionBlock ("", "SSDT", 2, "HIEP", "PPMC", 0)
{
    External (_SB.PCI0, DeviceObj)
    Scope (_SB.PCI0)
    {
        Device (PPMC)
        {
            Name (_ADR, 0x001F0002)
        }
    }
}
