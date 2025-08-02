# WindowsAccesControl-WAC
This project implements an access control system for a user by allowing a user to log in only with his password and a specific access key (in this example a USB stick).
If the USB device is missing, the user will be logged off immediately.
---
## Warning: Do not implement this code in systems that you are not allowed to have full access to, this code Code may result in complete loss of user information

## Set up:

# 🔐 USB Login Guard
---

## 📋 What This Does

- A PowerShell script checks for a USB stick with a specific serial number.
- If the USB stick is not found, it triggers immediate logoff.
- A batch file is used to launch the PowerShell script.
- The batch file is added to the Windows Startup folder to run on login.
- This works **per user** – each Windows user must configure it separately if needed.

---

### Before you start:

  Open your PowerShell as adiministrator and type: "Get-WmiObject Win32_DiskDrive | Where-Object {$_.InterfaceType -eq "USB"} | Select-Object SerialNumber, Model >>"
  This will give you the Serial Number of you USB-Stick which is important for the code

#### Step 1:

  📁 Folder Structure

    ```text
    C:\
    └── Scripts\
        ├── CheckUSB.ps1
        └── RunCheckUSB.bat
    ```
  Save the Folder Structure and the containing Files on your main windows mount("Example: Windows-SSD (C:)")

#### Step 2:

  Change the marked lines of code with your details

#### Step 3: 

  Create a link to RunCheckUSB.bat in your autostart-list on the user you want to secure by pressing **Windows+R** and typing:"shell:startup".
  Now save the link you just created in the folder you are now in.

#### Step 4 - Test:

  Now you want to log off from your current user and login again but without the USB-Stick connected.
  If everything went well the script should be startet and you should be logged of.

  - By connecting the USB-Stick you will stay logged in

#### Please Note:

  If any troubles occour dont mind asking for help and writing a comment
