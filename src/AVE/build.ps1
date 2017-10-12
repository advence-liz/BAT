$currentPath = split-path -Parent $MyInvocation.MyCommand.Definition
cd $currentPath

$securityPwd= ConvertTo-SecureString "1qaz2wsxE" -AsPlainText -Force
$credential= New-Object System.Management.Automation.PSCredential("administrator",$securityPwd)


Start-Process "git" -ArgumentList "pull" -Credential $credential -Wait