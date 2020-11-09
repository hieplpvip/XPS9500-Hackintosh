DefinitionBlock ("", "SSDT", 2, "HIEP", "RTC", 0)
{
    External (_SB_.PCI0.LPCB.RTC_, DeviceObj)

    Scope (_SB.PCI0.LPCB.RTC)
    {
        Method (_STA, 0, NotSerialized)
        {
            Return (0x0F)
        }
    }
}

