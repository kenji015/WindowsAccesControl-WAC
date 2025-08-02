Add-Content "C:\Scripts\log.txt" "$(Get-Date): Script started."

# Allowed USB serial number
$allowedSerial = "Change to your serial number"

# Query connected USB drives
$usbDevices = Get-WmiObject Win32_DiskDrive | Where-Object {$_.InterfaceType -eq "USB"}

$found = $false
foreach ($device in $usbDevices) {
    if ($device.SerialNumber -eq $allowedSerial) {
        $found = $true
        break
    }
}

if (-not $found) {
    Add-Content "C:\Scripts\log.txt" "$(Get-Date): USB stick not found, triggering logoff."
    shutdown /l /f
} else {
    Add-Content "C:\Scripts\log.txt" "$(Get-Date): USB stick found, no logoff."
}

Add-Content "C:\Scripts\log.txt" "$(Get-Date): Script finished."
