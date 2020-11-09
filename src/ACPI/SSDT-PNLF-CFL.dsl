// Adding PNLF device for AppleBacklightSmoother.kext
DefinitionBlock("", "SSDT", 2, "HIEP", "PNLF-CFL", 0)
{
    External(_SB.PCI0.GFX0, DeviceObj)
    Device(_SB.PCI0.GFX0.PNLF)
    {
        Name(_ADR, Zero)
        Name(_HID, EisaId("APP0002"))
        Name(_CID, "backlight")
        Name(_UID, 0x13)
        Name(_STA, 0x0B)
    }
}
