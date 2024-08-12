@{
    Severity     = @(
        'Error',
        'Warning',
        'Information'
    )
    ExcludeRules = @(
        'PSUseDeclaredVarsMoreThanAssignments',
        'PSAvoidUsingWriteHost',
        'PSAvoidUsingInvokeExpression',
        'PSUseShouldProcessForStateChangingFunctions',
        'PSUseUsingScopeModifierInNewRunspaces'
    )
}
# How to use : RUN
# Invoke-ScriptAnalyzer -Path "WindowsTweaks\RegistrySettings.ps1" -Settings "PSScriptAnalyzerSettings.psd1" -fix
# Invoke-ScriptAnalyzer -Path "." -Settings "PSScriptAnalyzerSettings.psd1" -fix