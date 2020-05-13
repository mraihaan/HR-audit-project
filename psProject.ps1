#Author: Mohammad Syed Raihaan
#NOTE: CSV file path is an arbitrary name

#Importing Active-Directory module
Import-Module ActiveDirectory

#Variable called 'list' to store contents of CSV file
$list = Import-Csv -Path filePath123.csv

#Loop through each user in list
Foreach($user in $list){
    #variable to store name of user {'name' is header name of the users column in the CSV file}
    $dn = $user.name
    
    #Try the following code block
    try{
        #If user doesn't exist in AD
        if((Get-ADUser -Filter {displayName -like $dn}) -eq $null){
            #Print out name with nothing next to it
            Write-Host $user.name
        }
        
        #If user does exist in AD
        else{
            #Print out name and enabled status (true or false)
            Get-ADUser -Filter {displayName -like $dn} | select Name, Enabled
        }
    }
    
    #If there is an error
    catch{
        Write-Host ""
    }
}
