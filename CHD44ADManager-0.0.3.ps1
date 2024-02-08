# Replace 'Username' with the username of the user whose logon script you want to delete
$username = 'Username'

# Connect to Active Directory
Import-Module ActiveDirectory

# Get the user's distinguished name (DN)
$userDN = (Get-ADUser -Filter "SamAccountName -eq '$username'").DistinguishedName

# Clear the logon script
Set-ADUser -Identity $userDN -ScriptPath $null

# Output confirmation message
Write-Host "Logon script deleted for user $username." -ForegroundColor Green
