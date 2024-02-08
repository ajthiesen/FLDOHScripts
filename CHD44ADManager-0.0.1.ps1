# Replace 'Username' with the username of the user whose logon script you want to delete
$username = 'Username'

# Connect to Active Directory
Import-Module ActiveDirectory

try {
    # Get the user's distinguished name (DN)
    $userDN = (Get-ADUser -Filter "SamAccountName -eq '$username'").DistinguishedName
    
    # Clear the logon script
    Set-ADUser -Identity $userDN -ScriptPath $null

    # Output confirmation
    Write-Host "Logon script for user $username has been deleted successfully."
}
catch {
    Write-Host "Error: $($_.Exception.Message)"
}
