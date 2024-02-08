# Replace 'Username' with the username of the user whose logon script you want to delete
$username = 'username'

# Connect to Active Directory
Import-Module ActiveDirectory

# Get the user's distinguished name (DN)
$userDN = (Get-ADUser -Filter "SamAccountName -eq '$username'").DistinguishedName

# Clear the logon script
Set-ADUser -Identity $userDN -ScriptPath $null
