DefinitionBlock ("", "SSDT", 2, "HIEP", "ALSD", 0)
{
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (ALSE, IntObj)

    Scope (_SB.PCI0.LPCB)
    {
        Method (_INI, 0, NotSerialized)
        {
            ALSE = 0x02
        }
    }
}
