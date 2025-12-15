Get-PnpDevice -Class Mouse -PresentOnly -Status OK | ForEach-Object `
{
	$PropPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$($_.DeviceId)\Device Parameters"
	$Prop = Get-ItemProperty -Path $PropPath -Name "FlipFlopWheel" -ErrorAction SilentlyContinue
	if ($Prop -ne $null)
	{
		"$($_.DeviceID)"
		Set-ItemProperty -Path $PropPath -Name "FlipFlopWheel" -Value "0"
	}

}
