using namespace System.Management.Automation.Host
function New-Menu {
    [OutputType([int])]
    [CmdletBinding()]

    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Title,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Question,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]]$Options
    )
    Begin{
       [ChoiceDescription[]]$ChoiceArray = @()
    }
    Process{
        
        foreach($Option in $Options){ 
            $Choice = [ChoiceDescription]::new("&$Option", "$option")
            $ChoiceArray += $choice
        }
        
        $result = $host.ui.PromptForChoice($Title, $Question, $ChoiceArray, 0)
        $result
    }
}