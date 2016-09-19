$TwilioTwimletsRootURI = "http://twimlets.com"

Function New-TwilioTwimletSimpleMenuURL {
    param (
        $Message,
        $Options
    )    
    $URL = $TwilioTwimletsRootURI + "/menu?" + $(([Ordered]@{Message = $Message} + $Options) | ConvertTo-URLEncodedQueryStringParameterString)
    $URL
}

Function New-TwilioTwimletEchoURL {
    param (
        $Twiml
    )    
    $URL = $TwilioTwimletsRootURI + "/echo?" + $($PSBoundParameters | ConvertTo-URLEncodedQueryStringParameterString)
    $URL
}


Function New-TwilioTwimletSimpleMenuOption {
    param (
        $Digits,
        $Url
    )
    [Ordered]@{
        "Options[$Digits]" = $Url
    }
}

Function New-TwilioTwimletMessageURL {
    param (
        [Parameter(Mandatory)][String[]]$Messages
    )


    ForEach ($Message in $Messages) {
        $MessagesHashTable += [ordered]@{
            "Message[$($Messages.IndexOf($Message))]" = $Message
        }
    }

    $URL = $TwilioTwimletsRootURI + "/message?" + $($MessagesHashTable | ConvertTo-URLEncodedQueryStringParameterString)
    $URL
}