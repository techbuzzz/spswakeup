﻿<#
					if(((Get-Host).Version.Major) -gt 2){$GenericWebRequest.ServerCertificateValidationCallback = { $true }}
	Try
	{
	
	   ForEach ($Url in $Urls)
	   {
			$Job = [powershell]::Create().AddScript($ScriptBlock).AddParameter("URL",$Url.Url).AddParameter("UserAgent",$userAgent)
			$Jobs += New-Object PSObject -Property @{
			}
	   }
	}
	Catch
	{
		Add-LogContent "Yellow" "An error occurred invoking multi-threading function"
	}
	
	{
		$Pool.Dispose()
	}