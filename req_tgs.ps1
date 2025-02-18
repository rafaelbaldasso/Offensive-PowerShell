Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Kerb {
    [DllImport("secur32.dll", SetLastError = false)]
    public static extern uint LsaEnumerateLogonSessions(out UInt64 LogonSessionCount, out IntPtr LogonSessionList);
}
"@
[Kerb]::LsaEnumerateLogonSessions([ref]0, [ref]0)
