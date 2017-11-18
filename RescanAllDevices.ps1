# Resolver Script - This script fixes the root cause. It only runs if the Troubleshooter detects the root cause.
# Key cmdlets:
# -- get-diaginput invokes an interactions and returns the response
# -- write-diagprogress displays a progress string to the user
# Your logic to fix the root cause here
# Create a function that loads our managed code into powershell

#
# From https://blogs.msdn.microsoft.com/mattbie/2010/02/23/how-to-call-net-and-win32-methods-from-powershell-and-your-troubleshooting-packs/
#

function InitDeviceClass {
    # This is the C# source code.  I've tested this in visual studio and then copy/pasted it here
    # You could also load the .CS file from the disk, if you prefer
    [string]$SourceCode =  @"
    using System.Runtime.InteropServices;
    using System;
    namespace mattbie.examples.devices
    {
        // These are the native win32 methods that we require
        internal static class NativeMethods
        {
            [DllImport("cfgmgr32.dll", SetLastError = true, EntryPoint = "CM_Locate_DevNode_Ex", CharSet = CharSet.Auto)]
            public static extern UInt32 CM_Locate_DevNode_Ex(ref UInt32 DevInst, IntPtr DeviceID, UInt64 Flags, IntPtr Machine);

            [DllImport("cfgmgr32.dll", SetLastError = true, EntryPoint = "CM_Reenumerate_DevNode_Ex", CharSet = CharSet.Auto)]
            public static extern UInt32 CM_Reenumerate_DevNode_Ex(UInt32 DevInst, UInt64 Flags, IntPtr Machine);

            [DllImport("cfgmgr32.dll", SetLastError = true, EntryPoint = "CMP_WaitNoPendingInstallEvents", CharSet = CharSet.Auto)]
            public static extern UInt32 CMP_WaitNoPendingInstallEvents(UInt32 TimeOut);
        }

        // This class houses the public methods that we'll use from powershell
        public static class StaticMethods
        {
            public const UInt32 CR_SUCCESS = 0;
            public const UInt64 CM_REENUMERATE_SYNCHRONOUS = 1;
            public const UInt64 CM_LOCATE_DEVNODE_NORMAL = 0;
            public static UInt32 RescanAllDevices()
            {
                //only connect to local device nodes
                UInt32 ResultCode = 0;
                IntPtr LocalMachineInstance = IntPtr.Zero;
                UInt32 DeviceInstance = 0;
                UInt32 PendingTime = 30000;
                ResultCode = NativeMethods.CM_Locate_DevNode_Ex(ref DeviceInstance, IntPtr.Zero, CM_LOCATE_DEVNODE_NORMAL, LocalMachineInstance);

                if (CR_SUCCESS == ResultCode)
                {
                    ResultCode = NativeMethods.CM_Reenumerate_DevNode_Ex(DeviceInstance, CM_REENUMERATE_SYNCHRONOUS, LocalMachineInstance);
                    ResultCode = NativeMethods.CMP_WaitNoPendingInstallEvents(PendingTime);
                }
                return ResultCode;
            }
        }
    }
"@
# use the powershell 2.0 add-type cmdlet to compile the source and make it available to our powershell session
    Add-Type -TypeDefinition $SourceCode
}

# Load up our C# code
InitDeviceClass

# Call the RescanAllDevices method

[mattbie.examples.devices.staticmethods]::RescanAllDevices()