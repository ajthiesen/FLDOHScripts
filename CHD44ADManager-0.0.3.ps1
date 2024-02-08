# Specify the distinguished name (DN) of the OU where you want to delete logon scripts for all users
$ouDN = "OU=Users,OU=Monroe CHD,DC=doh,DC=ad,DC=state,DC=fl,DC=us"

# Connect to Active Directory
Import-Module ActiveDirectory

# Get all users in the specified OU
$users = Get-ADUser -Filter * -SearchBase "LDAP://$ouDN"

# Display the list of users
Write-Host "Users in $($ouDN):"
$users | Select-Object Name, SamAccountName

# Pause to allow reviewing the list of users
pause

# Prompt for confirmation before proceeding
$confirmation = Read-Host "Do you want to delete the logon script for these users? (Y/N)"
if ($confirmation -eq "Y" -or $confirmation -eq "y") {
    # Loop through each user and clear the logon script
    foreach ($user in $users) {
        $userDN = $user.DistinguishedName
        Set-ADUser -Identity $userDN -ScriptPath $null
        Write-Host "Logon script deleted for user $($user.SamAccountName)." -ForegroundColor Green
    }
} else {
    Write-Host "Operation cancelled." -ForegroundColor Yellow
}
