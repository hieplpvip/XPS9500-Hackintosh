/*
 * AppleUsbPower compatibility table for Skylake+.
 *
 * Be warned that power supply values can be different
 * for different systems. Depending on the configuration
 * these values must match injected IOKitPersonalities
 * for com.apple.driver.AppleUSBMergeNub. iPad remains
 * being the most reliable device for testing USB port
 * charging support.
 *
 * Try NOT to rename EC0, H_EC, etc. to EC.
 * These devices are incompatible with macOS and may break
 * at any time. AppleACPIEC kext must NOT load.
 * See the disable code below.
 *
 * Reference USB: https://applelife.ru/posts/550233
 * Reference EC: https://applelife.ru/posts/807985
 */
DefinitionBlock ("", "SSDT", 2, "HIEP", "ECUSBX", 0)
{
    External (_SB_.PCI0.LPCB, DeviceObj)

    Scope (\_SB)
    {
        Device (USBX)
        {
            Name (_ADR, Zero)
            Method (_DSM, 4, NotSerialized)
            {
                If (!Arg2) { Return (Buffer() { 0x03 } ) }
                Return (Package ()
                {
                    "kUSBSleepPowerSupply", 0x13EC,
                    "kUSBSleepPortCurrentLimit", 0x0834,
                    "kUSBWakePowerSupply", 0x13EC,
                    "kUSBWakePortCurrentLimit", 0x0834
                })
            }
        }
    }

    Scope (\_SB.PCI0.LPCB)
    {
        Device (EC)
        {
            Name (_HID, "ACID0001")
        }
    }
}
