/*
 * XCPM power management compatibility table.
 */
DefinitionBlock ("", "SSDT", 2, "HIEP", "CpuPlug", 0)
{
    External (_PR_.PR00, ProcessorObj)

    If ((ObjectType (\_PR.PR00) == 0x0C)) {
        Scope (\_PR.PR00) {
            Method (_DSM, 4, NotSerialized)
            {
                If (LEqual (Arg2, Zero)) {
                    Return (Buffer (One) { 0x03 })
                }

                Return (Package (0x02)
                {
                    "plugin-type",
                    One
                })
            }
        }
    }
}
