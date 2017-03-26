function Get-MnemonicWord {
<#
    .SYNOPSIS
    Retrieve a random mnemonic word
    .DESCRIPTION
    Retrieve a random mnemonic word from a JSON document stored in a git repository
    .INPUTS
    None
    .OUTPUTS
    System.String
    .EXAMPLE
    Get-MnemonicWord
#>

    [CmdletBinding()][OutputType("System.String")]
    Param()

    try {

        $WordListUri = "https://raw.githubusercontent.com/chelnak/MnemonicEncodingWordList/master/mnemonics.json"
        $WordListObject = Invoke-RestMethod -Method Get -Uri $WordListUri -Verbose:$VerbosePreference

        Write-Verbose -Message "Version: $($WordListObject.version)"
        Write-Verbose -Message "Word Count: $($WordListObject.words.Count)"
        Write-Verbose -Message "Returning word:"

        Get-Random -InputObject $WordListObject.words -Count 1 -Verbose:$VerbosePreference
    }
    catch [Exception]{

        throw "Could not retrieve Mnemonic Word List: $($Exception.Message)"
    }

}